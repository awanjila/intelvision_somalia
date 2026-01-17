<template>
  <section class="services-section">
    <div class="container">
      <div class="section-header">
        <div class="icon-wrapper">
          <i class="fas fa-cogs"></i>
        </div>
        <h2 class="section-title">What We Do</h2>
        <p class="section-subtitle">
          Comprehensive security solutions powered by modern technology
        </p>
      </div>

      <div v-if="loading" class="loading-state">
        <div class="spinner"></div>
        <p>Loading services...</p>
      </div>

      <div v-else>
        <!-- Services Grid -->
        <div class="services-grid">
          <div
            v-for="service in paginatedServices"
            :key="service.slug"
            class="service-card"
          >
            <div class="card-image-wrapper">
              <img 
                :src="service.image || '/images/services/default.jpg'" 
                :alt="service.title || service.name" 
                class="card-image" 
              />
              <div class="card-overlay"></div>
            </div>
            <div class="card-content">
              <h3 class="card-title">{{ service.title || service.name }}</h3>
              <p class="card-description" v-html="truncateDescription(service.description)"></p>
              <a :href="`/show/service/${service.slug}`" class="card-link">
                Learn More
                <i class="fas fa-arrow-right"></i>
              </a>
            </div>
          </div>
        </div>

        <!-- Pagination Controls -->
        <div v-if="totalPages > 1" class="pagination-wrapper">
          <button 
            class="pagination-btn"
            @click="goToPage(currentPage - 1)"
            :disabled="currentPage === 1"
            aria-label="Previous page"
          >
            <i class="fas fa-chevron-left"></i>
            <span>Previous</span>
          </button>

          <div class="pagination-numbers">
            <button
              v-for="page in displayedPages"
              :key="page"
              @click="goToPage(page)"
              :class="['page-number', { active: currentPage === page, ellipsis: page === '...' }]"
              :disabled="page === '...'"
            >
              {{ page }}
            </button>
          </div>

          <button 
            class="pagination-btn"
            @click="goToPage(currentPage + 1)"
            :disabled="currentPage === totalPages"
            aria-label="Next page"
          >
            <span>Next</span>
            <i class="fas fa-chevron-right"></i>
          </button>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import axios from 'axios'

const currentPage = ref(1)
const itemsPerPage = ref(8)
const services = ref([])
const loading = ref(true)

// Helper function to decode HTML entities
const decodeHtmlEntities = (text) => {
  const textarea = document.createElement('textarea')
  textarea.innerHTML = text
  return textarea.value
}

// Helper function to strip HTML tags
const stripHtmlTags = (html) => {
  const div = document.createElement('div')
  div.innerHTML = html
  return div.textContent || div.innerText || ''
}

// Truncate description to uniform length
const truncateDescription = (description) => {
  if (!description) return ''
  
  let cleanText = stripHtmlTags(description)
  cleanText = decodeHtmlEntities(cleanText)
  cleanText = cleanText.trim()
  
  const maxLength = 120
  if (cleanText.length > maxLength) {
    return cleanText.substring(0, maxLength).trim() + '...'
  }
  
  return cleanText
}

const fetchServices = async () => {
  try {
    loading.value = true
    const response = await axios.get('/api/services')
    // Fix image paths - ensure correct upload path
    services.value = response.data.map(service => {
      let imagePath = service.image
      if (imagePath) {
        // Remove '/wabe_digital_agency' if it exists in the path
        imagePath = imagePath.replace('/wabe_digital_agency', '')
        // Ensure it starts with /upload/
        if (!imagePath.startsWith('/upload/')) {
          imagePath = '/upload/' + imagePath.split('/upload/').pop()
        }
      }
      return {
        ...service,
        image: imagePath
      }
    })
  } catch (error) {
    console.error('Error fetching services:', error)
    // Fallback to hardcoded services if API fails
    services.value = [
      {
        title: 'CCTV Surveillance',
        description: 'Professional HD cameras with remote monitoring and night vision for comprehensive property security.',
        image: '/images/services/cctv-surveillance.jpg',
        slug: 'cctv-surveillance'
      },
      {
        title: 'Electric Fences',
        description: 'Advanced energizer systems with alarm integration for maximum perimeter protection.',
        image: '/images/services/electric-fences.jpg',
        slug: 'electric-fences'
      },
      {
        title: 'Biometric Access Control',
        description: 'Fingerprint scanners and card readers for secure entry management and attendance tracking.',
        image: '/images/services/access-control.jpg',
        slug: 'biometric-access-control'
      },
      {
        title: 'Automated Gates',
        description: 'Smart gate automation with remote control for convenient and secure property access.',
        image: '/images/services/automated-gates.jpg',
        slug: 'automated-gates'
      },
      {
        title: 'Video Door Phones',
        description: 'Modern intercom systems with video capability for secure visitor identification.',
        image: '/images/services/door-phones.jpg',
        slug: 'video-door-phones'
      },
      {
        title: 'Fire Safety Solutions',
        description: 'Comprehensive fire protection including extinguishers and fire doors for complete safety.',
        image: '/images/services/fire-safety.jpg',
        slug: 'fire-safety-solutions'
      },
      {
        title: 'Barriers & Road Blocks',
        description: 'Heavy-duty barriers for controlled vehicle access in commercial facilities.',
        image: '/images/services/barriers.jpg',
        slug: 'barriers-road-blocks'
      },
      {
        title: 'Metal Detectors',
        description: 'Professional-grade detection systems for enhanced security screening.',
        image: '/images/services/metal-detectors.jpg',
        slug: 'metal-detectors'
      },
      {
        title: 'Fire Doors',
        description: 'Fire-rated doors that provide crucial protection and compartmentalization during emergencies.',
        image: '/images/services/fire-doors.jpg',
        slug: 'fire-doors'
      },
      {
        title: 'Security Alarms',
        description: 'Advanced alarm systems with 24/7 monitoring for immediate threat response.',
        image: '/images/services/alarms.jpg',
        slug: 'security-alarms'
      }
    ]
  } finally {
    loading.value = false
  }
}

const totalPages = computed(() => {
  return Math.ceil(services.value.length / itemsPerPage.value)
})

const paginatedServices = computed(() => {
  const start = (currentPage.value - 1) * itemsPerPage.value
  const end = start + itemsPerPage.value
  return services.value.slice(start, end)
})

const displayedPages = computed(() => {
  const pages = []
  const total = totalPages.value
  const current = currentPage.value
  
  if (total <= 7) {
    for (let i = 1; i <= total; i++) {
      pages.push(i)
    }
  } else {
    if (current <= 3) {
      for (let i = 1; i <= 5; i++) pages.push(i)
      pages.push('...')
      pages.push(total)
    } else if (current >= total - 2) {
      pages.push(1)
      pages.push('...')
      for (let i = total - 4; i <= total; i++) pages.push(i)
    } else {
      pages.push(1)
      pages.push('...')
      for (let i = current - 1; i <= current + 1; i++) pages.push(i)
      pages.push('...')
      pages.push(total)
    }
  }
  
  return pages
})

const goToPage = (page) => {
  if (page >= 1 && page <= totalPages.value) {
    currentPage.value = page
    window.scrollTo({ top: 0, behavior: 'smooth' })
  }
}

onMounted(() => {
  fetchServices()
})
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.services-section {
  padding: 80px 0;
  background: linear-gradient(to bottom, #f8fafc 0%, #f1f5f9 100%);
  font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 24px;
}

/* Section Header */
.section-header {
  text-align: center;
  margin-bottom: 60px;
}

.icon-wrapper {
  width: 60px;
  height: 60px;
  background: linear-gradient(135deg, #01aeef 0%, #02375f 100%);
  border-radius: 12px;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 16px;
}

.icon-wrapper i {
  font-size: 1.75rem;
  color: white;
}

.section-title {
  font-size: 2.5rem;
  font-weight: 800;
  color: #02375f;
  margin-bottom: 12px;
  position: relative;
  display: inline-block;
}

.section-subtitle {
  font-size: 1.125rem;
  color: #64748b;
  max-width: 600px;
  margin: 0 auto;
  line-height: 1.7;
}

/* Loading State */
.loading-state {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 20px;
  padding: 80px 20px;
  color: #64748b;
  min-height: 400px;
}

.spinner {
  width: 48px;
  height: 48px;
  border: 4px solid #e2e8f0;
  border-top-color: #01aeef;
  border-radius: 50%;
  animation: spin 0.8s linear infinite;
}

@keyframes spin {
  to { transform: rotate(360deg); }
}

/* Services Grid */
.services-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
  gap: 32px;
  margin-bottom: 60px;
}

.service-card {
  background: white;
  border-radius: 16px;
  overflow: hidden;
  box-shadow: 0 4px 24px rgba(0, 0, 0, 0.08);
  border: 1px solid rgba(1, 174, 239, 0.1);
  transition: all 0.3s ease;
  display: flex;
  flex-direction: column;
  height: 100%;
}

.service-card:hover {
  transform: translateY(-8px);
  box-shadow: 0 12px 40px rgba(1, 174, 239, 0.2);
  border-color: #01aeef;
}

.card-image-wrapper {
  position: relative;
  width: 100%;
  height: 200px;
  overflow: hidden;
  background: linear-gradient(135deg, #02375f 0%, #01517a 100%);
}

.card-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.5s ease;
}

.service-card:hover .card-image {
  transform: scale(1.1);
}

.card-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(180deg, transparent 0%, rgba(2, 55, 95, 0.4) 100%);
  transition: background 0.3s ease;
}

.service-card:hover .card-overlay {
  background: linear-gradient(180deg, rgba(1, 174, 239, 0.1) 0%, rgba(1, 174, 239, 0.3) 100%);
}

.card-content {
  padding: 28px;
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.card-title {
  font-size: 1.35rem;
  font-weight: 700;
  color: #02375f;
  line-height: 1.3;
  margin-bottom: 4px;
}

.card-description {
  font-size: 0.95rem;
  color: #475569;
  line-height: 1.7;
  flex: 1;
}

.card-link {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  color: #01aeef;
  text-decoration: none;
  font-size: 0.95rem;
  font-weight: 600;
  transition: all 0.3s ease;
  align-self: flex-start;
  margin-top: 8px;
}

.card-link:hover {
  color: #0284c7;
  gap: 12px;
}

.card-link i {
  transition: transform 0.3s ease;
}

.card-link:hover i {
  transform: translateX(4px);
}

/* Pagination */
.pagination-wrapper {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 16px;
  flex-wrap: wrap;
}

.pagination-btn {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 12px 20px;
  background: white;
  border: 2px solid #e2e8f0;
  border-radius: 8px;
  color: #02375f;
  font-size: 0.95rem;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
}

.pagination-btn:hover:not(:disabled) {
  background: #01aeef;
  border-color: #01aeef;
  color: white;
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(1, 174, 239, 0.3);
}

.pagination-btn:disabled {
  opacity: 0.4;
  cursor: not-allowed;
}

.pagination-numbers {
  display: flex;
  gap: 8px;
  align-items: center;
}

.page-number {
  width: 44px;
  height: 44px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: white;
  border: 2px solid #e2e8f0;
  border-radius: 8px;
  color: #475569;
  font-size: 0.95rem;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
}

.page-number:hover:not(.active):not(.ellipsis) {
  background: #f1f5f9;
  border-color: #01aeef;
  color: #01aeef;
}

.page-number.active {
  background: linear-gradient(135deg, #01aeef 0%, #0284c7 100%);
  border-color: #01aeef;
  color: white;
  box-shadow: 0 4px 12px rgba(1, 174, 239, 0.3);
}

.page-number.ellipsis {
  background: transparent;
  border: none;
  cursor: default;
  color: #94a3b8;
}

/* Responsive Design */
@media (max-width: 1024px) {
  .services-grid {
    grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
    gap: 28px;
  }
}

@media (max-width: 768px) {
  .services-section {
    padding: 60px 0;
  }

  .section-header {
    margin-bottom: 48px;
  }

  .section-title {
    font-size: 2rem;
  }

  .section-subtitle {
    font-size: 1rem;
  }

  .services-grid {
    grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
    gap: 24px;
    margin-bottom: 48px;
  }

  .card-content {
    padding: 24px;
  }

  .pagination-btn span {
    display: none;
  }

  .pagination-btn {
    padding: 12px 16px;
  }

  .page-number {
    width: 40px;
    height: 40px;
    font-size: 0.9rem;
  }
}

@media (max-width: 640px) {
  .services-grid {
    grid-template-columns: 1fr;
  }

  .pagination-numbers {
    gap: 6px;
  }

  .page-number {
    width: 36px;
    height: 36px;
    font-size: 0.85rem;
  }
}

@media (max-width: 480px) {
  .services-section {
    padding: 40px 0;
  }

  .container {
    padding: 0 16px;
  }

  .icon-wrapper {
    width: 50px;
    height: 50px;
  }

  .icon-wrapper i {
    font-size: 1.5rem;
  }

  .section-title {
    font-size: 1.75rem;
  }

  .section-subtitle {
    font-size: 0.95rem;
  }

  .card-content {
    padding: 20px;
  }

  .card-title {
    font-size: 1.2rem;
  }

  .card-description {
    font-size: 0.9rem;
  }
}
</style>