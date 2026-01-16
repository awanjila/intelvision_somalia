<template>
  <section class="services-section">
    <div class="container">
      <div class="section-header">
        <h2 class="section-title">What We Do</h2>
        <p class="section-subtitle">
          Comprehensive security solutions powered by modern technology
        </p>
      </div>

      <div class="carousel-wrapper">
        <div v-if="loading" class="loading-state">
          <div class="spinner"></div>
          <p>Loading services...</p>
        </div>
        
        <transition-group v-else name="slide-fade" tag="div" class="carousel-track">
          <div
            v-for="(batch, batchIndex) in batches"
            :key="batchIndex"
            v-show="currentBatch === batchIndex"
            class="services-batch"
          >
            <div
              v-for="(service, index) in batch"
              :key="`${batchIndex}-${index}`"
              class="service-card"
            >
              <div class="card-image-wrapper">
                <img :src="service.image || '/images/services/default.jpg'" :alt="service.title || service.name" class="card-image" />
                <div class="card-overlay"></div>
              </div>
              <div class="card-content">
                <h3 class="card-title">{{ service.title || service.name }}</h3>
                <p class="card-description">{{ service.description }}</p>
                <a :href="`/show/service/${service.slug}`" class="card-link">
                  View Service
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="16"
                    height="16"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    stroke-width="2.5"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                  >
                    <line x1="5" y1="12" x2="19" y2="12"></line>
                    <polyline points="12 5 19 12 12 19"></polyline>
                  </svg>
                </a>
              </div>
            </div>
          </div>
        </transition-group>

        <!-- Navigation Arrows -->
        <button 
          class="carousel-nav prev" 
          @click="prevBatch" 
          :disabled="currentBatch === 0"
          aria-label="Previous"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
          >
            <polyline points="15 18 9 12 15 6"></polyline>
          </svg>
        </button>

        <button 
          class="carousel-nav next" 
          @click="nextBatch"
          :disabled="currentBatch === batches.length - 1"
          aria-label="Next"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
          >
            <polyline points="9 18 15 12 9 6"></polyline>
          </svg>
        </button>

        <!-- Dots Indicator -->
        <div class="carousel-dots">
          <button
            v-for="(batch, index) in batches"
            :key="`dot-${index}`"
            :class="['dot', { active: currentBatch === index }]"
            @click="goToBatch(index)"
            :aria-label="`Go to batch ${index + 1}`"
          ></button>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import { ref, onMounted, computed } from 'vue'
import axios from 'axios'

export default {
  name: 'ServicesCarousel',
  setup() {
    const currentBatch = ref(0)
    const services = ref([])
    const loading = ref(true)

    const fetchServices = async () => {
      try {
        loading.value = true
        const response = await axios.get('/api/services')
        services.value = response.data
      } catch (error) {
        console.error('Error fetching services:', error)
        // Fallback to hardcoded services if API fails
        services.value = [
          {
            title: 'CCTV Surveillance',
            description: 'Professional HD cameras with remote monitoring and night vision for comprehensive property security.',
            image: '/images/services/cctv-surveillance.jpg',
            link: '/services/cctv',
            slug: 'cctv-surveillance'
          },
          {
            title: 'Electric Fences',
            description: 'Advanced energizer systems with alarm integration for maximum perimeter protection.',
            image: '/images/services/electric-fences.jpg',
            link: '/services/electric-fences',
            slug: 'electric-fences'
          },
          {
            title: 'Biometric Access Control',
            description: 'Fingerprint scanners and card readers for secure entry management and attendance tracking.',
            image: '/images/services/access-control.jpg',
            link: '/services/access-control',
            slug: 'biometric-access-control'
          },
          {
            title: 'Automated Gates',
            description: 'Smart gate automation with remote control for convenient and secure property access.',
            image: '/images/services/automated-gates.jpg',
            link: '/services/automated-gates',
            slug: 'automated-gates'
          },
          {
            title: 'Video Door Phones',
            description: 'Modern intercom systems with video capability for secure visitor identification.',
            image: '/images/services/door-phones.jpg',
            link: '/services/door-phones',
            slug: 'video-door-phones'
          },
          {
            title: 'Fire Safety Solutions',
            description: 'Comprehensive fire protection including extinguishers and fire doors for complete safety.',
            image: '/images/services/fire-safety.jpg',
            link: '/services/fire-safety',
            slug: 'fire-safety-solutions'
          },
          {
            title: 'Barriers & Road Blocks',
            description: 'Heavy-duty barriers for controlled vehicle access in commercial facilities.',
            image: '/images/services/barriers.jpg',
            link: '/services/barriers',
            slug: 'barriers-road-blocks'
          },
          {
            title: 'Metal Detectors',
            description: 'Professional-grade detection systems for enhanced security screening.',
            image: '/images/services/metal-detectors.jpg',
            link: '/services/metal-detectors',
            slug: 'metal-detectors'
          }
        ]
      } finally {
        loading.value = false
      }
    }

    const batches = computed(() => {
      const batchSize = 4
      const result = []
      for (let i = 0; i < services.value.length; i += batchSize) {
        result.push(services.value.slice(i, i + batchSize))
      }
      return result
    })

    const nextBatch = () => {
      if (currentBatch.value < batches.value.length - 1) {
        currentBatch.value++
      }
    }

    const prevBatch = () => {
      if (currentBatch.value > 0) {
        currentBatch.value--
      }
    }

    const goToBatch = (index) => {
      currentBatch.value = index
    }

    onMounted(() => {
      fetchServices()
    })

    return {
      currentBatch,
      services,
      loading,
      batches,
      nextBatch,
      prevBatch,
      goToBatch
    }
  }
}
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.services-section {
  padding: 80px 0;
  background: #f8f9fa;
}

.container {
  max-width: 1280px;
  margin: 0 auto;
  padding: 0 40px;
}

.section-header {
  text-align: center;
  margin-bottom: 60px;
}

.section-title {
  font-size: 3rem;
  font-weight: 700;
  color: #02375f;
  margin-bottom: 16px;
  letter-spacing: -0.02em;
  position: relative;
  display: inline-block;
}

.section-title::after {
  content: '';
  position: absolute;
  bottom: -8px;
  left: 50%;
  transform: translateX(-50%);
  width: 80px;
  height: 4px;
  background: #01aeef;
}

.section-subtitle {
  font-size: 1.25rem;
  color: #6c757d;
  max-width: 600px;
  margin: 0 auto;
}

.carousel-wrapper {
  position: relative;
  width: 100%;
  min-height: 480px;
}

.loading-state {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 16px;
  padding: 60px 20px;
  color: #6c757d;
  min-height: 480px;
}

.spinner {
  width: 40px;
  height: 40px;
  border: 4px solid #e0f2fe;
  border-top-color: #01aeef;
  border-radius: 50%;
  animation: spin 1s linear infinite;
}

@keyframes spin {
  to { transform: rotate(360deg); }
}

.carousel-track {
  position: relative;
  width: 100%;
}

.services-batch {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 30px;
  width: 100%;
}

.service-card {
  background: #ffffff;
  border-radius: 0;
  overflow: hidden;
  transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
  border-top: 3px solid transparent;
  box-shadow: 0 2px 8px rgba(2, 55, 95, 0.08);
  display: flex;
  flex-direction: column;
}

.service-card:hover {
  transform: translateY(-8px);
  box-shadow: 0 12px 24px rgba(1, 174, 239, 0.15);
  border-top-color: #01aeef;
}

.card-image-wrapper {
  position: relative;
  width: 100%;
  height: 200px;
  overflow: hidden;
  background: #02375f;
}

.card-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.6s ease;
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
  transition: background 0.4s ease;
}

.service-card:hover .card-overlay {
  background: linear-gradient(180deg, transparent 0%, rgba(1, 174, 239, 0.3) 100%);
}

.card-content {
  padding: 24px;
  flex: 1;
  display: flex;
  flex-direction: column;
}

.card-title {
  font-size: 1.25rem;
  font-weight: 700;
  color: #02375f;
  margin-bottom: 12px;
  line-height: 1.3;
}

.card-description {
  font-size: 0.95rem;
  color: #6c757d;
  line-height: 1.6;
  margin-bottom: 20px;
  flex: 1;
}

.card-link {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  color: #01aeef;
  text-decoration: none;
  font-size: 0.9rem;
  font-weight: 600;
  transition: all 0.3s ease;
  align-self: flex-start;
}

.card-link svg {
  transition: transform 0.3s ease;
}

.card-link:hover {
  color: #0398d4;
  gap: 10px;
}

.card-link:hover svg {
  transform: translateX(4px);
}

/* Navigation Arrows */
.carousel-nav {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  background: #02375f;
  border: none;
  width: 50px;
  height: 50px;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  z-index: 10;
  transition: all 0.3s ease;
}

.carousel-nav:disabled {
  opacity: 0.3;
  cursor: not-allowed;
}

.carousel-nav:not(:disabled):hover {
  background: #01aeef;
  transform: translateY(-50%) scale(1.1);
}

.carousel-nav svg {
  color: #ffffff;
}

.carousel-nav.prev {
  left: -25px;
}

.carousel-nav.next {
  right: -25px;
}

/* Dots */
.carousel-dots {
  display: flex;
  gap: 12px;
  justify-content: center;
  margin-top: 40px;
}

.dot {
  width: 12px;
  height: 12px;
  background: #d1d5db;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  transition: all 0.3s ease;
  padding: 0;
}

.dot.active {
  background: #01aeef;
  width: 36px;
}

.dot:hover {
  background: #02375f;
}

/* Transitions */
.slide-fade-enter-active {
  transition: opacity 0.6s ease;
}

.slide-fade-leave-active {
  transition: opacity 0.3s ease;
  position: absolute;
}

.slide-fade-enter-from {
  opacity: 0;
}

.slide-fade-leave-to {
  opacity: 0;
}

/* Responsive */
@media (max-width: 1200px) {
  .services-batch {
    grid-template-columns: repeat(3, 1fr);
    gap: 25px;
  }
}

@media (max-width: 900px) {
  .services-batch {
    grid-template-columns: repeat(2, 1fr);
    gap: 20px;
  }

  .section-title {
    font-size: 2.5rem;
  }

  .carousel-nav.prev {
    left: -15px;
  }

  .carousel-nav.next {
    right: -15px;
  }
}

@media (max-width: 768px) {
  .services-section {
    padding: 60px 0;
  }

  .container {
    padding: 0 20px;
  }

  .section-header {
    margin-bottom: 40px;
  }

  .section-title {
    font-size: 2rem;
  }

  .section-subtitle {
    font-size: 1rem;
  }

  .carousel-wrapper {
    min-height: auto;
  }

  .services-batch {
    grid-template-columns: 1fr;
    gap: 20px;
  }

  .card-image-wrapper {
    height: 180px;
  }

  .carousel-nav {
    width: 44px;
    height: 44px;
  }

  .carousel-nav.prev {
    left: 0;
  }

  .carousel-nav.next {
    right: 0;
  }

  .carousel-dots {
    margin-top: 30px;
  }

  .dot {
    width: 10px;
    height: 10px;
  }

  .dot.active {
    width: 30px;
  }
}

@media (max-width: 480px) {
  .section-title {
    font-size: 1.75rem;
  }

  .card-content {
    padding: 20px;
  }

  .card-title {
    font-size: 1.1rem;
  }

  .card-description {
    font-size: 0.9rem;
  }
}
</style>