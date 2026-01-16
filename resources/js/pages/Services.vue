<template>
  <div class="main-content">
    <!-- Breadcrumbs -->
    <div class="rs-breadcrumbs img3">
      <div class="breadcrumbs-inner text-center">
        <h1 class="page-title">Services</h1>
        <ul>
          <li>
            <a class="active" href="/">Home</a>
          </li>
          <li>Services</li>
        </ul>
      </div>
    </div>

    <!-- Services Section -->
    <section class="services-section">
      <div class="container">
        <div class="services-content">
          <!-- Left Side: Text & Services List -->
          <div class="services-left">
            <div class="services-header">
              <div class="section-label">What We Do</div>
              <h2 class="section-title">
                Our Featured <span class="gradient-text">Services</span>
              </h2>
              <p class="section-description">
                Comprehensive digital solutions designed to transform your business operations and drive sustainable growth.
              </p>
            </div>

            <div v-if="loading" class="loading-state">
              <div class="spinner"></div>
              <p>Loading services...</p>
            </div>

            <div v-else-if="services.length > 0" class="services-list">
              <a
                v-for="(service, index) in services"
                :key="service.id"
                :href="`/show/service/${service.slug}`"
                class="service-item"
              >
                <div class="service-number">{{ String(index + 1).padStart(2, '0') }}</div>
                <div class="service-icon-wrapper">
                  <i :class="getServiceIcon(index)" class="service-icon"></i>
                </div>
                <div class="service-content">
                  <h3 class="service-title">{{ service.name }}</h3>
                  <p class="service-description">{{ truncateText(service.description, 110) }}</p>
                </div>
              </a>
            </div>

            <div v-else class="no-services">
              <p>No services available at the moment.</p>
            </div>
          </div>

          <!-- Right Side: Branded Illustration -->
          <div class="services-right">
            <div class="services-image-wrapper">
              <div class="floating-badge badge-1">
                <div class="badge-icon">✓</div>
                <div class="badge-text">Quality Assured</div>
              </div>
              <div class="floating-badge badge-2">
                <div class="badge-icon">⚡</div>
                <div class="badge-text">Fast Delivery</div>
              </div>
              <div class="services-illustration">
                <svg viewBox="0 0 500 500" xmlns="http://www.w3.org/2000/svg">
                  <!-- Background Elements -->
                  <circle cx="250" cy="250" r="200" fill="url(#servicesGradient1)" opacity="0.08"/>
                  <circle cx="350" cy="150" r="60" fill="#60a5fa" opacity="0.1"/>
                  <circle cx="150" cy="350" r="80" fill="#fbbf24" opacity="0.1"/>
                  
                  <!-- Central Workspace -->
                  <rect x="100" y="100" width="300" height="300" rx="20" fill="white" opacity="0.95"/>
                  <rect x="115" y="115" width="270" height="270" rx="15" fill="url(#servicesGradient2)"/>
                  
                  <!-- Grid/Dashboard Elements -->
                  <rect x="140" y="140" width="100" height="80" rx="8" fill="white" opacity="0.9"/>
                  <rect x="260" y="140" width="100" height="80" rx="8" fill="white" opacity="0.7"/>
                  <rect x="140" y="240" width="100" height="80" rx="8" fill="white" opacity="0.8"/>
                  <rect x="260" y="240" width="100" height="80" rx="8" fill="white" opacity="0.6"/>
                  
                  <!-- Icons representation -->
                  <circle cx="190" cy="180" r="15" fill="#0369a1" opacity="0.8"/>
                  <circle cx="310" cy="180" r="15" fill="#60a5fa" opacity="0.8"/>
                  <circle cx="190" cy="280" r="15" fill="#fbbf24" opacity="0.8"/>
                  <circle cx="310" cy="280" r="15" fill="#34d399" opacity="0.8"/>
                  
                  <!-- Connecting Lines -->
                  <line x1="190" y1="195" x2="190" y2="265" stroke="#0369a1" stroke-width="2" opacity="0.3"/>
                  <line x1="205" y1="180" x2="295" y2="180" stroke="#60a5fa" stroke-width="2" opacity="0.3"/>
                  
                  <!-- Decorative Tech Elements -->
                  <text x="50" y="250" font-size="50" fill="#1e3a8a" opacity="0.15" font-family="monospace">&lt;/&gt;</text>
                  <text x="400" y="250" font-size="40" fill="#0369a1" opacity="0.15" font-family="monospace">{ }</text>
                  
                  <!-- Gradients -->
                  <defs>
                    <linearGradient id="servicesGradient1" x1="0%" y1="0%" x2="100%" y2="100%">
                      <stop offset="0%" style="stop-color:#1e3a8a;stop-opacity:1" />
                      <stop offset="100%" style="stop-color:#0369a1;stop-opacity:1" />
                    </linearGradient>
                    <linearGradient id="servicesGradient2" x1="0%" y1="0%" x2="100%" y2="100%">
                      <stop offset="0%" style="stop-color:#1e3a8a;stop-opacity:1" />
                      <stop offset="50%" style="stop-color:#0369a1;stop-opacity:1" />
                      <stop offset="100%" style="stop-color:#60a5fa;stop-opacity:1" />
                    </linearGradient>
                  </defs>
                </svg>
              </div>
            </div>
          </div>
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

const services = ref([])
const loading = ref(true)

const serviceIcons = [
  'fas fa-code',
  'fas fa-globe',
  'fas fa-video',
  'fas fa-fingerprint',
  'fas fa-plug',
  'fas fa-cash-register',
  'fas fa-mobile-alt',
  'fas fa-database',
  'fas fa-shield-alt',
  'fas fa-chart-line'
]

const getServiceIcon = (index) => {
  return serviceIcons[index % serviceIcons.length]
}

const truncateText = (text, length) => {
  if (!text) return ''
  const stripped = text.replace(/<[^>]*>/g, '')
  return stripped.length > length ? stripped.substring(0, length) + '...' : stripped
}

const fetchServices = async () => {
  try {
    loading.value = true
    // Fetch services from your Laravel backend
    const response = await axios.get('/api/services')
    services.value = response.data
  } catch (error) {
    console.error('Error fetching services:', error)
  } finally {
    loading.value = false
  }
}

onMounted(() => {
  fetchServices()
})
</script>

<style scoped>
/* Import the same styles from ServicesSection.vue */

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

/* ===== SERVICES SECTION - SPLIT LAYOUT ===== */
.services-section {
  padding: 80px 24px;
  background: white;
  position: relative;
  overflow: hidden;
}

.services-section::before {
  content: '';
  position: absolute;
  top: 0;
  right: 0;
  width: 50%;
  height: 100%;
  background: linear-gradient(135deg, #f8fafc 0%, #e0f2fe 100%);
  opacity: 0.5;
  pointer-events: none;
}

.services-content {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 80px;
  align-items: center;
  position: relative;
  z-index: 1;
}

/* ===== LEFT SIDE - SERVICES LIST ===== */
.services-left {
  display: flex;
  flex-direction: column;
  gap: 32px;
  animation: fadeInLeft 1s ease-out;
}

.services-header {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.section-label {
  font-size: 0.875rem;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.1em;
  color: #0369a1;
}

.section-title {
  font-size: 2.75rem;
  font-weight: 800;
  color: #1e3a8a;
  line-height: 1.2;
  letter-spacing: -0.02em;
  font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
}

.gradient-text {
  background: linear-gradient(135deg, #0369a1 0%, #60a5fa 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  display: inline-block;
}

.section-description {
  font-size: 1.05rem;
  color: #64748b;
  line-height: 1.7;
  font-family: 'Segoe UI', system-ui, sans-serif;
}

/* ===== LOADING STATE ===== */
.loading-state {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 16px;
  padding: 40px;
  color: #64748b;
}

.spinner {
  width: 40px;
  height: 40px;
  border: 4px solid #e0f2fe;
  border-top-color: #0369a1;
  border-radius: 50%;
  animation: spin 1s linear infinite;
}

@keyframes spin {
  to { transform: rotate(360deg); }
}

.no-services {
  padding: 40px;
  text-align: center;
  color: #64748b;
}

/* ===== SERVICES LIST ===== */
.services-list {
  display: flex;
  flex-direction: column;
  gap: 14px;
}

.service-item {
  display: flex;
  align-items: flex-start;
  gap: 16px;
  padding: 20px;
  background: white;
  border-radius: 14px;
  box-shadow: 0 4px 20px rgba(30, 58, 138, 0.08);
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  border-left: 4px solid transparent;
  position: relative;
  overflow: hidden;
  text-decoration: none;
  color: inherit;
}

.service-item::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(135deg, rgba(96, 165, 250, 0.03) 0%, transparent 100%);
  opacity: 0;
  transition: opacity 0.3s ease;
}

.service-item:hover {
  transform: translateX(8px);
  box-shadow: 0 8px 30px rgba(30, 58, 138, 0.15);
  border-left-color: #fbbf24;
}

.service-item:hover::before {
  opacity: 1;
}

.service-number {
  flex-shrink: 0;
  width: 40px;
  height: 40px;
  background: linear-gradient(135deg, #dbeafe 0%, #bfdbfe 100%);
  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: 800;
  font-size: 1.1rem;
  color: #0369a1;
  transition: all 0.3s ease;
}

.service-item:hover .service-number {
  background: linear-gradient(135deg, #fef3c7 0%, #fde68a 100%);
  color: #d97706;
  transform: scale(1.1);
}

.service-icon-wrapper {
  flex-shrink: 0;
  width: 50px;
  height: 50px;
  background: linear-gradient(135deg, #f0f9ff 0%, #e0f2fe 100%);
  border-radius: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: all 0.3s ease;
}

.service-icon {
  font-size: 1.5rem;
  color: #0369a1;
  transition: all 0.3s ease;
}

.service-item:hover .service-icon-wrapper {
  background: linear-gradient(135deg, #1e3a8a 0%, #0369a1 100%);
  transform: rotate(5deg);
}

.service-item:hover .service-icon {
  color: white;
}

.service-content {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 6px;
}

.service-title {
  font-size: 1.125rem;
  font-weight: 700;
  color: #1e3a8a;
  font-family: 'Segoe UI', system-ui, sans-serif;
  line-height: 1.3;
  transition: color 0.3s ease;
}

.service-item:hover .service-title {
  color: #0369a1;
}

.service-description {
  font-size: 0.95rem;
  color: #64748b;
  line-height: 1.6;
  font-family: 'Segoe UI', system-ui, sans-serif;
}

/* ===== RIGHT SIDE - ILLUSTRATION ===== */
.services-right {
  position: relative;
  animation: fadeInRight 1s ease-out;
}

.services-image-wrapper {
  position: relative;
  width: 100%;
  height: 500px;
}

.services-illustration {
  width: 100%;
  height: 100%;
  filter: drop-shadow(0 20px 60px rgba(30, 58, 138, 0.15));
}

.services-illustration svg {
  width: 100%;
  height: 100%;
}

/* ===== FLOATING BADGES ===== */
.floating-badge {
  position: absolute;
  background: white;
  backdrop-filter: blur(10px);
  padding: 12px 20px;
  border-radius: 50px;
  box-shadow: 0 10px 30px rgba(30, 58, 138, 0.2);
  display: flex;
  align-items: center;
  gap: 10px;
  animation: floatBadge 3s ease-in-out infinite;
  border: 2px solid rgba(96, 165, 250, 0.2);
}

.badge-1 {
  top: 15%;
  right: 5%;
  animation-delay: 0s;
}

.badge-2 {
  bottom: 20%;
  left: 5%;
  animation-delay: 1.5s;
}

.badge-icon {
  font-size: 1.25rem;
  line-height: 1;
}

.badge-text {
  font-size: 0.875rem;
  font-weight: 600;
  color: #1e3a8a;
  white-space: nowrap;
}

/* ===== ANIMATIONS ===== */
@keyframes fadeInLeft {
  from {
    opacity: 0;
    transform: translateX(-50px);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}

@keyframes fadeInRight {
  from {
    opacity: 0;
    transform: translateX(50px);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}

@keyframes floatBadge {
  0%, 100% {
    transform: translateY(0px);
  }
  50% {
    transform: translateY(-15px);
  }
}

/* ===== RESPONSIVE DESIGN ===== */
@media (max-width: 1024px) {
  .services-content {
    grid-template-columns: 1fr;
    gap: 60px;
  }

  .services-right {
    order: -1;
  }

  .services-image-wrapper {
    height: 350px;
  }

  .section-title {
    font-size: 2.25rem;
  }

  .floating-badge {
    display: none;
  }
}

@media (max-width: 768px) {
  .services-section {
    padding: 60px 20px;
  }

  .services-content {
    gap: 40px;
  }

  .section-title {
    font-size: 2rem;
  }

  .section-description {
    font-size: 1rem;
  }

  .services-image-wrapper {
    height: 280px;
  }

  .service-item {
    flex-direction: column;
    text-align: center;
    align-items: center;
    padding: 20px;
  }

  .service-number {
    position: absolute;
    top: -15px;
    left: 50%;
    transform: translateX(-50%);
  }

  .service-item:hover .service-number {
    transform: translateX(-50%) scale(1.1);
  }

  .page-title {
    font-size: 2.5rem;
  }
}

@media (max-width: 480px) {
  .services-section {
    padding: 40px 16px;
  }

  .section-title {
    font-size: 1.75rem;
  }

  .section-description {
    font-size: 0.95rem;
  }

  .service-item {
    padding: 24px 16px;
  }

  .service-icon-wrapper {
    width: 45px;
    height: 45px;
  }

  .service-icon {
    font-size: 1.25rem;
  }

  .service-title {
    font-size: 1rem;
  }

  .service-description {
    font-size: 0.875rem;
  }

  .page-title {
    font-size: 2rem;
  }
}
</style>