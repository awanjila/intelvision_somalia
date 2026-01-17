<template>
  <div class="main-content">
    <!-- Breadcrumbs -->
    <div class="rs-breadcrumbs">
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
                    <span>{{ item.name }}</span>
                    <i class="fas fa-arrow-right"></i>
                  </a>
                </li>
              </ul>
            </div>

            <!-- Contact Card -->
            <div class="contact-card">
              <div class="contact-icon">
                <i class="fas fa-phone-alt"></i>
              </div>
              <h3 class="contact-title">Have any Questions?</h3>
              <p class="contact-subtitle">Call us Today!</p>
              <div class="contact-numbers">
                <a href="tel:+254722850008" class="contact-number">+254 (0)722 850008</a>
                <a href="tel:+254734850008" class="contact-number">+254 (0)734 850008</a>
              </div>
            </div>

            <!-- Email Card -->
            <div class="email-card">
              <div class="email-icon">
                <i class="fas fa-envelope"></i>
              </div>
              <h3 class="email-title">Email Us</h3>
              <div class="email-addresses">
                <a href="mailto:info@intelvision.co.ke" class="email-link">
                  <i class="fas fa-paper-plane"></i>
                  info@intelvision.co.ke
                </a>
                <a href="mailto:sales@intelvision.co.ke" class="email-link">
                  <i class="fas fa-paper-plane"></i>
                  sales@intelvision.co.ke
                </a>
              </div>
            </div>

            <!-- Brochure Card -->
            <div class="brochure-card">
              <div class="brochure-icon">
                <i class="fas fa-file-pdf"></i>
              </div>
              <h3 class="brochure-title">Brochures</h3>
              <p class="brochure-text">
                Download our comprehensive service brochure to learn more about what we offer.
              </p>
              <a href="/contact" class="brochure-button">
                Request Brochure
                <i class="fas fa-download"></i>
              </a>
            </div>
          </div>
        </div>

        <div v-else class="error-state">
          <i class="fas fa-exclamation-circle"></i>
          <p>Service not found.</p>
          <a href="/wabe_digital_agency/services" class="back-button">Back to Services</a>
        </div>
      </div>
    </section>

    <!-- CTA Section -->
    <div class="cta-section">
      <div class="container">
        <div class="cta-content">
          <div class="cta-text">
            <span class="cta-label">Plan to Start a Project</span>
            <h2 class="cta-title">Our Experts Ready to Help You</h2>
          </div>
          <div class="cta-button-wrap">
            <a class="cta-button" href="/contact">
              Get In Touch
              <i class="fas fa-arrow-right"></i>
            </a>
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
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 24px;
}

.main-content {
  font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
  color: #1e293b;
}

/* ===== BREADCRUMBS ===== */
.rs-breadcrumbs {
  padding: 100px 0 80px;
  background: linear-gradient(135deg, #02375f 0%, #01aeef 100%);
  position: relative;
  overflow: hidden;
}

.rs-breadcrumbs::before {
  content: '';
  position: absolute;
  inset: 0;
  background: radial-gradient(circle at 30% 50%, rgba(1, 174, 239, 0.3) 0%, transparent 50%),
              radial-gradient(circle at 70% 50%, rgba(2, 55, 95, 0.3) 0%, transparent 50%);
}

.breadcrumbs-inner {
  position: relative;
  z-index: 2;
}

.text-center {
  text-align: center;
}

.page-title {
  font-size: 3rem;
  font-weight: 800;
  margin-bottom: 20px;
  color: white;
  text-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
}

.breadcrumbs-inner ul {
  list-style: none;
  padding: 0;
  display: flex;
  justify-content: center;
  gap: 12px;
  align-items: center;
}

.breadcrumbs-inner ul li {
  color: rgba(255, 255, 255, 0.9);
  font-size: 0.95rem;
}

.breadcrumbs-inner ul li::before {
  content: '/';
  margin-right: 12px;
  color: rgba(255, 255, 255, 0.5);
}

.breadcrumbs-inner ul li:first-child::before {
  display: none;
}

.breadcrumbs-inner ul li a {
  color: white;
  text-decoration: none;
  transition: color 0.3s;
  font-weight: 500;
}

.breadcrumbs-inner ul li a:hover {
  color: #fbbf24;
}

/* ===== SERVICE DETAIL SECTION ===== */
.service-detail-section {
  padding: 80px 0;
  background: linear-gradient(to bottom, #f8fafc 0%, #f1f5f9 100%);
}

/* ===== LOADING & ERROR STATES ===== */
.loading-state,
.error-state {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 20px;
  padding: 80px 20px;
  color: #64748b;
  min-height: 400px;
  justify-content: center;
}

.error-state i {
  font-size: 3rem;
  color: #ef4444;
}

.spinner {
  width: 50px;
  height: 50px;
  border: 4px solid #e2e8f0;
  border-top-color: #01aeef;
  border-radius: 50%;
  animation: spin 0.8s linear infinite;
}

@keyframes spin {
  to { transform: rotate(360deg); }
}

.back-button {
  margin-top: 12px;
  padding: 12px 28px;
  background: linear-gradient(135deg, #01aeef 0%, #0284c7 100%);
  color: white;
  text-decoration: none;
  border-radius: 8px;
  font-weight: 600;
  transition: all 0.3s ease;
  display: inline-flex;
  align-items: center;
  gap: 8px;
}

.back-button:hover {
  transform: translateY(-2px);
  box-shadow: 0 8px 24px rgba(1, 174, 239, 0.3);
}

/* ===== CONTENT LAYOUT ===== */
.service-detail-content {
  display: grid;
  grid-template-columns: 1.5fr 1fr;
  gap: 48px;
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
  border-radius: 16px;
  overflow: hidden;
  box-shadow: 0 8px 32px rgba(1, 174, 239, 0.15);
  border: 1px solid rgba(1, 174, 239, 0.1);
}

.service-cover-image img {
  width: 100%;
  height: auto;
  display: block;
  object-fit: cover;
  transition: transform 0.5s ease;
}

.service-cover-image:hover img {
  transform: scale(1.05);
}

.service-main-content {
  background: white;
  padding: 40px;
  border-radius: 16px;
  box-shadow: 0 4px 24px rgba(0, 0, 0, 0.08);
  border: 1px solid rgba(1, 174, 239, 0.1);
}

.service-detail-title {
  font-size: 2.25rem;
  font-weight: 800;
  color: #02375f;
  margin-bottom: 24px;
  line-height: 1.3;
}

.service-detail-description {
  font-size: 1.05rem;
  color: #475569;
  line-height: 1.8;
}

.service-detail-description :deep(h1),
.service-detail-description :deep(h2),
.service-detail-description :deep(h3) {
  color: #02375f;
  margin-top: 28px;
  margin-bottom: 16px;
  font-weight: 700;
}

.service-detail-description :deep(h1) {
  font-size: 2rem;
}

.service-detail-description :deep(h2) {
  font-size: 1.5rem;
}

.service-detail-description :deep(h3) {
  font-size: 1.25rem;
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
  color: #475569;
}

.service-detail-description :deep(strong) {
  color: #02375f;
  font-weight: 700;
}

.service-detail-description :deep(a) {
  color: #01aeef;
  text-decoration: none;
  font-weight: 600;
  transition: color 0.3s;
}

.service-detail-description :deep(a:hover) {
  color: #0284c7;
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
  border-radius: 16px;
  box-shadow: 0 4px 24px rgba(0, 0, 0, 0.08);
  border: 1px solid rgba(1, 174, 239, 0.1);
}

.sidebar-title {
  font-size: 1.5rem;
  font-weight: 700;
  color: #02375f;
  margin-bottom: 20px;
  padding-bottom: 16px;
  border-bottom: 2px solid #e2e8f0;
}

.services-list {
  list-style: none;
  padding: 0;
  margin: 0;
  display: flex;
  flex-direction: column;
  gap: 4px;
}

.services-list li a {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 12px 16px;
  color: #475569;
  text-decoration: none;
  font-weight: 600;
  font-size: 0.95rem;
  border-radius: 8px;
  transition: all 0.3s ease;
}

.services-list li a i {
  font-size: 0.875rem;
  color: #01aeef;
  transition: transform 0.3s ease;
  opacity: 0;
}

.services-list li a:hover {
  background: #f8fafc;
  color: #01aeef;
  padding-left: 20px;
}

.services-list li a:hover i {
  opacity: 1;
  transform: translateX(4px);
}

.services-list li.active a {
  background: linear-gradient(135deg, #01aeef 0%, #0284c7 100%);
  color: white;
}

.services-list li.active a i {
  opacity: 1;
  color: white;
}

/* ===== CONTACT CARD ===== */
.contact-card {
  background: linear-gradient(135deg, #02375f 0%, #01aeef 100%);
  padding: 32px;
  border-radius: 16px;
  text-align: center;
  color: white;
  box-shadow: 0 8px 32px rgba(1, 174, 239, 0.25);
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
  margin-bottom: 4px;
  line-height: 1.4;
}

.contact-subtitle {
  font-size: 1rem;
  margin-bottom: 20px;
  color: rgba(255, 255, 255, 0.9);
}

.contact-numbers {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.contact-number {
  display: block;
  font-size: 1.15rem;
  font-weight: 700;
  color: white;
  text-decoration: none;
  transition: all 0.3s ease;
  padding: 8px;
  border-radius: 8px;
}

.contact-number:hover {
  background: rgba(255, 255, 255, 0.1);
  transform: scale(1.02);
}

/* ===== EMAIL CARD ===== */
.email-card {
  background: white;
  padding: 32px;
  border-radius: 16px;
  box-shadow: 0 4px 24px rgba(0, 0, 0, 0.08);
  border: 1px solid rgba(1, 174, 239, 0.1);
}

.email-icon {
  width: 50px;
  height: 50px;
  background: linear-gradient(135deg, #01aeef 0%, #0284c7 100%);
  border-radius: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 16px;
}

.email-icon i {
  font-size: 1.5rem;
  color: white;
}

.email-title {
  font-size: 1.25rem;
  font-weight: 700;
  color: #02375f;
  margin-bottom: 16px;
}

.email-addresses {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.email-link {
  display: flex;
  align-items: center;
  gap: 10px;
  padding: 12px;
  color: #01aeef;
  text-decoration: none;
  font-weight: 600;
  font-size: 0.95rem;
  border-radius: 8px;
  transition: all 0.3s ease;
  background: #f8fafc;
}

.email-link:hover {
  background: #e0f2fe;
  color: #0284c7;
  padding-left: 16px;
}

.email-link i {
  font-size: 0.875rem;
}

/* ===== BROCHURE CARD ===== */
.brochure-card {
  background: white;
  padding: 32px;
  border-radius: 16px;
  box-shadow: 0 4px 24px rgba(0, 0, 0, 0.08);
  border: 1px solid rgba(1, 174, 239, 0.1);
}

.brochure-icon {
  width: 50px;
  height: 50px;
  background: linear-gradient(135deg, #01aeef 0%, #0284c7 100%);
  border-radius: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 16px;
}

.brochure-icon i {
  font-size: 1.5rem;
  color: white;
}

.brochure-title {
  font-size: 1.25rem;
  font-weight: 700;
  color: #02375f;
  margin-bottom: 12px;
}

.brochure-text {
  font-size: 0.95rem;
  color: #64748b;
  line-height: 1.6;
  margin-bottom: 20px;
}

.brochure-button {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 12px 24px;
  background: linear-gradient(135deg, #01aeef 0%, #0284c7 100%);
  color: white;
  text-decoration: none;
  border-radius: 8px;
  font-weight: 600;
  transition: all 0.3s ease;
  box-shadow: 0 4px 16px rgba(1, 174, 239, 0.25);
}

.brochure-button:hover {
  transform: translateY(-2px);
  box-shadow: 0 8px 24px rgba(1, 174, 239, 0.35);
}

/* ===== CTA SECTION ===== */
.cta-section {
  background: linear-gradient(135deg, #02375f 0%, #01aeef 100%);
  padding: 60px 0;
  position: relative;
  overflow: hidden;
}

.cta-section::before {
  content: '';
  position: absolute;
  inset: 0;
  background: radial-gradient(circle at 20% 50%, rgba(255, 255, 255, 0.1) 0%, transparent 50%),
              radial-gradient(circle at 80% 50%, rgba(255, 255, 255, 0.1) 0%, transparent 50%);
}

.cta-content {
  position: relative;
  z-index: 2;
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 32px;
}

.cta-label {
  display: inline-block;
  color: rgba(255, 255, 255, 0.9);
  font-size: 0.95rem;
  font-weight: 600;
  margin-bottom: 8px;
  text-transform: uppercase;
  letter-spacing: 1px;
}

.cta-title {
  font-size: 2.5rem;
  font-weight: 800;
  color: white;
  margin: 0;
  line-height: 1.2;
}

.cta-button {
  display: inline-flex;
  align-items: center;
  gap: 12px;
  padding: 16px 32px;
  background: white;
  color: #02375f;
  text-decoration: none;
  border-radius: 8px;
  font-weight: 700;
  font-size: 1.05rem;
  transition: all 0.3s ease;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
  white-space: nowrap;
}

.cta-button:hover {
  transform: translateY(-3px);
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
  gap: 16px;
}

.cta-button i {
  transition: transform 0.3s ease;
}

.cta-button:hover i {
  transform: translateX(4px);
}

/* ===== RESPONSIVE DESIGN ===== */
@media (max-width: 1024px) {
  .service-detail-content {
    grid-template-columns: 1fr;
    gap: 40px;
  }

  .detail-right {
    position: static;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    display: grid;
  }

  .page-title {
    font-size: 2.5rem;
  }

  .cta-title {
    font-size: 2rem;
  }
}

@media (max-width: 768px) {
  .service-detail-section {
    padding: 60px 0;
  }

  .rs-breadcrumbs {
    padding: 80px 0 60px;
  }

  .page-title {
    font-size: 2rem;
  }

  .service-detail-title {
    font-size: 1.875rem;
  }

  .service-main-content {
    padding: 32px 24px;
  }

  .services-sidebar,
  .contact-card,
  .email-card,
  .brochure-card {
    padding: 24px;
  }

  .detail-right {
    grid-template-columns: 1fr;
  }

  .cta-content {
    flex-direction: column;
    text-align: center;
  }

  .cta-title {
    font-size: 1.75rem;
  }
}

@media (max-width: 480px) {
  .container {
    padding: 0 16px;
  }

  .service-detail-section {
    padding: 40px 0;
  }

  .rs-breadcrumbs {
    padding: 60px 0 40px;
  }

  .page-title {
    font-size: 1.75rem;
  }

  .service-detail-title {
    font-size: 1.5rem;
  }

  .service-detail-description {
    font-size: 0.95rem;
  }

  .service-main-content {
    padding: 24px 20px;
  }

  .contact-number {
    font-size: 1rem;
  }

  .cta-title {
    font-size: 1.5rem;
  }

  .cta-button {
    padding: 14px 24px;
    font-size: 0.95rem;
  }
}
</style>