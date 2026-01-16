<template>
  <div class="main-content">
    <!-- Breadcrumbs -->
    <div class="rs-breadcrumbs img3">
      <div class="breadcrumbs-inner text-center">
        <h1 class="page-title">{{ service.name || 'Service Details' }}</h1>
        <ul>
          <li>
            <a href="/">Home</a>
          </li>
          <li>
            <a href="/wabe_digital_agency/services">Services</a>
          </li>
          <li>{{ service.name }}</li>
        </ul>
      </div>
    </div>

    <!-- Service Detail Section -->
    <section class="service-detail-section">
      <div class="container">
        <div v-if="loading" class="loading-state">
          <div class="spinner"></div>
          <p>Loading service details...</p>
        </div>

        <div v-else-if="service.id" class="service-detail-content">
          <!-- Left Side: Service Details -->
          <div class="detail-left">
            <!-- Cover Image -->
            <div v-if="service.image" class="service-cover-image">
              <img :src="`/${service.image}`" :alt="service.name" />
            </div>

            <!-- Service Content -->
            <div class="service-main-content">
              <h2 class="service-detail-title">{{ service.name }}</h2>
              <div class="service-detail-description" v-html="service.description"></div>
            </div>
          </div>

          <!-- Right Side: Services List & Contact -->
          <div class="detail-right">
            <!-- All Services List -->
            <div class="services-sidebar">
              <h3 class="sidebar-title">All Services</h3>
              <ul class="services-list">
                <li v-for="item in allServices" :key="item.id" :class="{ active: item.slug === service.slug }">
                  <a :href="`/show/service/${item.slug}`">
                    {{ item.name }}
                    <i class="fas fa-arrow-right"></i>
                  </a>
                </li>
              </ul>
            </div>

            <!-- Contact Card -->
            <div class="contact-card">
              <div class="contact-icon">
                <i class="fas fa-phone"></i>
              </div>
              <h3 class="contact-title">Have any Questions?<br/>Call us Today!</h3>
              <a href="tel:+254781312070" class="contact-number">+254 781 312 070</a>
            </div>

            <!-- Brochure Card -->
            <div class="brochure-card">
              <h3 class="brochure-title">Brochures</h3>
              <p class="brochure-text">
                Download our comprehensive service brochure to learn more about what we offer.
              </p>
              <a href="/contact" class="brochure-button">
                Request Brochure
                <i class="fas fa-file-pdf"></i>
              </a>
            </div>
          </div>
        </div>

        <div v-else class="error-state">
          <p>Service not found.</p>
          <a href="/wabe_digital_agency/services" class="back-button">Back to Services</a>
        </div>
      </div>
    </section>

    <!-- CTA Section -->
    <div class="rs-cta style1 bg7 pt-80 pb-70">
      <div class="container">
        <div class="cta-wrap">
          <div class="row align-items-center">
            <div class="col-lg-9 col-md-12 md-mb-30">
              <span>Plan to Start a Project</span>
              <div class="title-wrap">
                <h2 class="epx-title">Our Experts Ready to Help You</h2>
              </div>
            </div>
            <div class="col-lg-3 text-right md-text-left col-md-12">
              <div class="button-wrap">
                <a class="readon learn-more" href="/contact">Get In Touch</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'

const service = ref({})
const allServices = ref([])
const loading = ref(true)

// Get slug from URL
const getSlugFromUrl = () => {
  const pathParts = window.location.pathname.split('/')
  return pathParts[pathParts.length - 1]
}

const fetchServiceDetail = async () => {
  try {
    loading.value = true
    const slug = getSlugFromUrl()
    
    // Fetch specific service
    const serviceResponse = await axios.get(`/api/service/${slug}`)
    service.value = serviceResponse.data

    // Fetch all services for sidebar
    const servicesResponse = await axios.get('/api/services')
    allServices.value = servicesResponse.data
  } catch (error) {
    console.error('Error fetching service:', error)
  } finally {
    loading.value = false
  }
}

onMounted(() => {
  fetchServiceDetail()
})
</script>

<style scoped>
/* ===== DESIGN SYSTEM ===== */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.container {
  max-width: 1280px;
  margin: 0 auto;
  padding: 0 24px;
}

/* ===== BREADCRUMBS ===== */
.rs-breadcrumbs {
  padding: 100px 0 80px;
  background: linear-gradient(135deg, #1e3a8a 0%, #0369a1 100%);
  position: relative;
}

.breadcrumbs-inner {
  color: white;
}

.page-title {
  font-size: 3rem;
  font-weight: 800;
  margin-bottom: 20px;
  color: white;
}

.breadcrumbs-inner ul {
  list-style: none;
  padding: 0;
  display: flex;
  justify-content: center;
  gap: 10px;
}

.breadcrumbs-inner ul li {
  color: rgba(255, 255, 255, 0.8);
}

.breadcrumbs-inner ul li a {
  color: #fbbf24;
  text-decoration: none;
  transition: color 0.3s;
}

.breadcrumbs-inner ul li a:hover {
  color: white;
}

/* ===== SERVICE DETAIL SECTION ===== */
.service-detail-section {
  padding: 80px 24px;
  background: linear-gradient(135deg, #f8fafc 0%, #ffffff 100%);
}

/* ===== LOADING & ERROR STATES ===== */
.loading-state,
.error-state {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 16px;
  padding: 60px 20px;
  color: #64748b;
}

.spinner {
  width: 50px;
  height: 50px;
  border: 4px solid #e0f2fe;
  border-top-color: #0369a1;
  border-radius: 50%;
  animation: spin 1s linear infinite;
}

@keyframes spin {
  to { transform: rotate(360deg); }
}

.back-button {
  margin-top: 20px;
  padding: 12px 24px;
  background: linear-gradient(135deg, #1e3a8a 0%, #0369a1 100%);
  color: white;
  text-decoration: none;
  border-radius: 8px;
  font-weight: 600;
  transition: all 0.3s ease;
}

.back-button:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 20px rgba(30, 58, 138, 0.3);
}

/* ===== CONTENT LAYOUT ===== */
.service-detail-content {
  display: grid;
  grid-template-columns: 1.5fr 1fr;
  gap: 60px;
  align-items: start;
}

/* ===== LEFT SIDE - MAIN CONTENT ===== */
.detail-left {
  display: flex;
  flex-direction: column;
  gap: 32px;
}

.service-cover-image {
  width: 100%;
  border-radius: 20px;
  overflow: hidden;
  box-shadow: 0 10px 40px rgba(30, 58, 138, 0.15);
}

.service-cover-image img {
  width: 100%;
  height: auto;
  display: block;
  object-fit: cover;
}

.service-main-content {
  background: white;
  padding: 40px;
  border-radius: 20px;
  box-shadow: 0 4px 20px rgba(30, 58, 138, 0.08);
}

.service-detail-title {
  font-size: 2.5rem;
  font-weight: 800;
  color: #1e3a8a;
  margin-bottom: 24px;
  line-height: 1.2;
  font-family: 'Segoe UI', system-ui, sans-serif;
}

.service-detail-description {
  font-size: 1.05rem;
  color: #475569;
  line-height: 1.8;
  font-family: 'Segoe UI', system-ui, sans-serif;
}

.service-detail-description :deep(h1),
.service-detail-description :deep(h2),
.service-detail-description :deep(h3) {
  color: #1e3a8a;
  margin-top: 24px;
  margin-bottom: 16px;
  font-weight: 700;
}

.service-detail-description :deep(p) {
  margin-bottom: 16px;
}

.service-detail-description :deep(ul),
.service-detail-description :deep(ol) {
  margin-left: 24px;
  margin-bottom: 16px;
}

.service-detail-description :deep(li) {
  margin-bottom: 8px;
}

/* ===== RIGHT SIDE - SIDEBAR ===== */
.detail-right {
  display: flex;
  flex-direction: column;
  gap: 24px;
  position: sticky;
  top: 100px;
}

/* ===== SERVICES SIDEBAR ===== */
.services-sidebar {
  background: white;
  padding: 32px;
  border-radius: 20px;
  box-shadow: 0 4px 20px rgba(30, 58, 138, 0.08);
  border-top: 4px solid #0369a1;
}

.sidebar-title {
  font-size: 1.5rem;
  font-weight: 700;
  color: #1e3a8a;
  margin-bottom: 20px;
  font-family: 'Segoe UI', system-ui, sans-serif;
}

.services-list {
  list-style: none;
  padding: 0;
  margin: 0;
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.services-list li {
  border-radius: 10px;
  transition: all 0.3s ease;
}

.services-list li a {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 14px 16px;
  color: #475569;
  text-decoration: none;
  font-weight: 600;
  font-size: 0.95rem;
  border-radius: 10px;
  transition: all 0.3s ease;
  font-family: 'Segoe UI', system-ui, sans-serif;
}

.services-list li a i {
  font-size: 0.875rem;
  transition: transform 0.3s ease;
}

.services-list li a:hover {
  background: linear-gradient(135deg, #f0f9ff 0%, #e0f2fe 100%);
  color: #0369a1;
  padding-left: 20px;
}

.services-list li a:hover i {
  transform: translateX(4px);
}

.services-list li.active a {
  background: linear-gradient(135deg, #1e3a8a 0%, #0369a1 100%);
  color: white;
}

/* ===== CONTACT CARD ===== */
.contact-card {
  background: linear-gradient(135deg, #1e3a8a 0%, #0369a1 100%);
  padding: 32px;
  border-radius: 20px;
  text-align: center;
  color: white;
  box-shadow: 0 10px 30px rgba(30, 58, 138, 0.2);
}

.contact-icon {
  width: 60px;
  height: 60px;
  background: rgba(255, 255, 255, 0.2);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto 20px;
}

.contact-icon i {
  font-size: 1.75rem;
  color: white;
}

.contact-title {
  font-size: 1.25rem;
  font-weight: 700;
  margin-bottom: 16px;
  line-height: 1.4;
}

.contact-number {
  display: inline-block;
  font-size: 1.5rem;
  font-weight: 800;
  color: #fbbf24;
  text-decoration: none;
  transition: all 0.3s ease;
}

.contact-number:hover {
  color: white;
  transform: scale(1.05);
}

/* ===== BROCHURE CARD ===== */
.brochure-card {
  background: white;
  padding: 32px;
  border-radius: 20px;
  box-shadow: 0 4px 20px rgba(30, 58, 138, 0.08);
  border-left: 4px solid #fbbf24;
}

.brochure-title {
  font-size: 1.25rem;
  font-weight: 700;
  color: #1e3a8a;
  margin-bottom: 12px;
  font-family: 'Segoe UI', system-ui, sans-serif;
}

.brochure-text {
  font-size: 0.95rem;
  color: #64748b;
  line-height: 1.6;
  margin-bottom: 20px;
  font-family: 'Segoe UI', system-ui, sans-serif;
}

.brochure-button {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 12px 24px;
  background: linear-gradient(135deg, #fbbf24 0%, #f59e0b 100%);
  color: #1e3a8a;
  text-decoration: none;
  border-radius: 10px;
  font-weight: 600;
  transition: all 0.3s ease;
  box-shadow: 0 4px 15px rgba(251, 191, 36, 0.3);
}

.brochure-button:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 20px rgba(251, 191, 36, 0.4);
}

.brochure-button i {
  font-size: 1.1rem;
}

/* ===== RESPONSIVE DESIGN ===== */
@media (max-width: 1024px) {
  .service-detail-content {
    grid-template-columns: 1fr;
    gap: 40px;
  }

  .detail-right {
    position: static;
  }

  .page-title {
    font-size: 2.5rem;
  }
}

@media (max-width: 768px) {
  .service-detail-section {
    padding: 60px 20px;
  }

  .service-detail-title {
    font-size: 2rem;
  }

  .service-detail-description {
    font-size: 1rem;
  }

  .service-main-content {
    padding: 30px 24px;
  }

  .services-sidebar,
  .contact-card,
  .brochure-card {
    padding: 24px;
  }

  .page-title {
    font-size: 2rem;
  }
}

@media (max-width: 480px) {
  .service-detail-section {
    padding: 40px 16px;
  }

  .service-detail-title {
    font-size: 1.75rem;
  }

  .service-detail-description {
    font-size: 0.95rem;
  }

  .service-main-content {
    padding: 24px 20px;
  }

  .contact-number {
    font-size: 1.25rem;
  }

  .page-title {
    font-size: 1.75rem;
  }
}
</style>