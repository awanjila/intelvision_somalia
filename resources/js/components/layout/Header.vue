<template>
  <!-- Top Info Bar -->
<div class="top-info-bar">
    <div class="container">
      <div class="info-items">
        <a href="tel:+252615992025" class="info-item">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"/>
          </svg>
          <span><strong>+252 61 599 2025</strong></span>
        </a>
        <a href="mailto:info@intelvisionsomalia.com" class="info-item">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <rect width="20" height="16" x="2" y="4" rx="2"/>
            <path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"/>
          </svg>
          <span><strong>info@intelvisionsomalia.com</strong></span>
        </a>
        <div class="info-item">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M20 10c0 6-8 12-8 12s-8-6-8-12a8 8 0 0 1 16 0Z"/>
            <circle cx="12" cy="10" r="3"/>
          </svg>
          <span><strong>KM4, Mogadishu, Somalia</strong></span>
        </div>
      </div>
    </div>
  </div>

  <header class="site-header" ref="headerRef">
    <div class="container">
      <div class="header-content">
        <!-- Logo -->
        <div class="logo-part">
          <a href="/"><img src="/front_assets/images/logo-dark.png" alt=""></a>
        </div>

        <!-- Desktop Navigation -->
        <nav class="desktop-nav">
          <a href="/" class="nav-link">Home</a>
          <a href="/about" class="nav-link">About Us</a>

          <!-- Products Dropdown -->
          <div class="products-dropdown">
            <button class="nav-link dropdown-toggle" @click="toggleProductsDropdown">
              Products
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" :class="{ rotate: showProductsDropdown }">
                <polyline points="6 9 12 15 18 9"></polyline>
              </svg>
            </button>
            <div class="products-dropdown-menu" :class="{ show: showProductsDropdown }">
              <div class="services-grid">
                <a
                  v-for="service in services"
                  :key="service.id"
                  :href="`/show/product/${service.slug}`"
                  class="service-item"
                  @mouseenter="showProductsDropdown = true"
                  @click.stop="showProductsDropdown = false"
                >
                  <span class="service-name">{{ service.name }}</span>
                </a>
              </div>
            </div>
          </div>

          <a href="/blogs" class="nav-link">Blog</a>
        
          <a href="/contact" class="nav-link">Contact</a>
        </nav>

        <!-- CTA Buttons -->
        <div class="header-cta">
          <a :href="whatsappLink" target="_blank" rel="noopener noreferrer" class="btn-whatsapp">
            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path>
            </svg>
            WhatsApp
          </a>
          <a href="/contact" class="btn-contact">Get Started</a>
        </div>

        <!-- Mobile Menu Toggle -->
        <button class="mobile-menu-toggle" @click="mobileMenuOpen = !mobileMenuOpen" aria-label="Toggle menu">
          <svg v-if="!mobileMenuOpen" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <line x1="4" x2="20" y1="12" y2="12"/>
            <line x1="4" x2="20" y1="6" y2="6"/>
            <line x1="4" x2="20" y1="18" y2="18"/>
          </svg>
          <svg v-else xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M18 6 6 18"/>
            <path d="m6 6 12 12"/>
          </svg>
        </button>
      </div>
    </div>

    <!-- Mobile Navigation -->
    <transition name="slide">
      <div v-show="mobileMenuOpen" class="mobile-nav">
        <div class="mobile-nav-content">
          <a href="/" class="mobile-nav-link" @click="mobileMenuOpen = false">Home</a>
          <a href="/about" class="mobile-nav-link" @click="mobileMenuOpen = false">About Us</a>
          
          <!-- Mobile Products Dropdown -->
          <div class="mobile-dropdown">
            <button 
              class="mobile-dropdown-toggle" 
              @click="mobileProductsOpen = !mobileProductsOpen"
            >
              Products
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" :class="{ rotate: mobileProductsOpen }">
                <polyline points="6 9 12 15 18 9"></polyline>
              </svg>
            </button>
            <transition name="expand">
              <div v-show="mobileProductsOpen" class="mobile-dropdown-content">
                <a
                  v-for="service in services"
                  :key="service.id"
                  :href="`/show/product/${service.slug}`"
                  class="mobile-dropdown-link"
                  @click="mobileMenuOpen = false; mobileProductsOpen = false"
                >
                  {{ service.name }}
                </a>
              </div>
            </transition>
          </div>

          <a href="/blog" class="mobile-nav-link" @click="mobileMenuOpen = false">Blog</a>
          <a href="/contact" class="mobile-nav-link" @click="mobileMenuOpen = false">Contact</a>

          <!-- Mobile CTA Buttons -->
          <div class="mobile-cta-buttons">
            <a :href="whatsappLink" target="_blank" rel="noopener noreferrer" class="btn-whatsapp mobile">
              <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path>
              </svg>
              WhatsApp Us
            </a>
            <a href="/contact" class="btn-contact mobile" @click="mobileMenuOpen = false">Get Started</a>
          </div>
        </div>
      </div>
    </transition>
  </header>
</template>

<script>
import axios from 'axios'

export default {
  name: 'SiteHeader',
  data() {
    return {
      whatsappNumber: '252615992025',
      mobileMenuOpen: false,
      showResourcesDropdown: false,
      mobileResourcesOpen: false,
      services: [],
      servicesLoading: true,
      showProductsDropdown: false,
      mobileProductsOpen: false
    }
  },
  computed: {
    whatsappLink() {
      return `https://wa.me/${this.whatsappNumber}?text=Hi%20Intelvision%2C%20I'm%20interested%20in%20learning%20more%20about%20your%20services`
    }
  },
  watch: {
    mobileMenuOpen(newVal) {
      if (newVal) {
        document.body.style.overflow = 'hidden'
      } else {
        document.body.style.overflow = ''
        this.mobileResourcesOpen = false
        this.mobileProductsOpen = false
      }
    }
  },
  mounted() {
    this.fetchServices()
    // Close dropdown when clicking outside
    this.boundHandleClickOutside = this.handleClickOutside.bind(this)
    document.addEventListener('click', this.boundHandleClickOutside)
    
    // Add hover listeners for desktop dropdowns
    this.$nextTick(() => {
      if (this.$refs.headerRef) {
        const dropdown = this.$refs.headerRef.querySelector('.dropdown')
        const productsDropdown = this.$refs.headerRef.querySelector('.products-dropdown')
        
        if (dropdown) {
          this.boundShowDropdown = this.showDropdown.bind(this)
          this.boundHideDropdown = this.hideDropdown.bind(this)
          dropdown.addEventListener('mouseenter', this.boundShowDropdown)
          dropdown.addEventListener('mouseleave', this.boundHideDropdown)
        }
        
        if (productsDropdown) {
          this.boundShowProducts = () => { 
            this.showProductsDropdown = true
            // Clear any pending hide timeout
            if (this.productsHideTimeout) {
              clearTimeout(this.productsHideTimeout)
              this.productsHideTimeout = null
            }
          }
          this.boundHideProducts = () => { 
            // Add a small delay before hiding to allow navigation
            this.productsHideTimeout = setTimeout(() => {
              this.showProductsDropdown = false
              this.productsHideTimeout = null
            }, 200)
          }
          productsDropdown.addEventListener('mouseenter', this.boundShowProducts)
          productsDropdown.addEventListener('mouseleave', this.boundHideProducts)
        }
      }
    })
  },
  beforeUnmount() {
    document.body.style.overflow = ''
    document.removeEventListener('click', this.boundHandleClickOutside)
    
    if (this.$refs.headerRef) {
      const dropdown = this.$refs.headerRef.querySelector('.dropdown')
      const productsDropdown = this.$refs.headerRef.querySelector('.products-dropdown')
      
      if (dropdown && this.boundShowDropdown && this.boundHideDropdown) {
        dropdown.removeEventListener('mouseenter', this.boundShowDropdown)
        dropdown.removeEventListener('mouseleave', this.boundHideDropdown)
      }
      
      if (productsDropdown && this.boundShowProducts && this.boundHideProducts) {
        productsDropdown.removeEventListener('mouseenter', this.boundShowProducts)
        productsDropdown.removeEventListener('mouseleave', this.boundHideProducts)
      }
      
      // Clear any pending timeout
      if (this.productsHideTimeout) {
        clearTimeout(this.productsHideTimeout)
        this.productsHideTimeout = null
      }
    }
  },
  methods: {
    async fetchServices() {
      try {
        this.servicesLoading = true
        const response = await axios.get('/api/services')
        this.services = response.data
        // Fix image URLs by removing the incorrect path
        this.services = this.services.map(service => {
          if (service.image) {
            service.image = service.image.replace('/wabe_digital_agency/upload/service_image/', '/upload/service_image/')
          }
          return service
        })
      } catch (error) {
        console.error('Error fetching services:', error)
        // Fallback to hardcoded services if API fails
        this.services = [
          {
            id: 1,
            name: 'CCTV Surveillance',
            slug: 'cctv-surveillance'
          },
          {
            id: 2,
            name: 'Electric Fences',
            slug: 'electric-fences'
          },
          {
            id: 3,
            name: 'Biometric Access Control',
            slug: 'biometric-access-control'
          },
          {
            id: 4,
            name: 'Automated Gates',
            slug: 'automated-gates'
          },
          {
            id: 5,
            name: 'Video Door Phones',
            slug: 'video-door-phones'
          },
          {
            id: 6,
            name: 'Fire Safety Solutions',
            slug: 'fire-safety-solutions'
          },
          {
            id: 7,
            name: 'Barriers & Road Blocks',
            slug: 'barriers-road-blocks'
          },
          {
            id: 8,
            name: 'Metal Detectors',
            slug: 'metal-detectors'
          }
        ]
      } finally {
        this.servicesLoading = false
      }
    },
    handleClickOutside(event) {
      if (!this.$refs.headerRef) return
      
      const dropdown = this.$refs.headerRef.querySelector('.dropdown')
      const productsDropdown = this.$refs.headerRef.querySelector('.products-dropdown')
      const productsDropdownMenu = this.$refs.headerRef.querySelector('.products-dropdown-menu')
      const mobileToggle = this.$refs.headerRef.querySelector('.mobile-menu-toggle')
      
      // Check if click is outside dropdown
      if (dropdown && !dropdown.contains(event.target) && (!mobileToggle || !mobileToggle.contains(event.target))) {
        this.showResourcesDropdown = false
      }
      
      // For products dropdown, check both the dropdown container and the menu itself
      if (productsDropdown) {
        const isClickInside = productsDropdown.contains(event.target) || 
                             (productsDropdownMenu && productsDropdownMenu.contains(event.target))
        const isMobileToggle = mobileToggle && mobileToggle.contains(event.target)
        
        if (!isClickInside && !isMobileToggle) {
          this.showProductsDropdown = false
        }
      }
    },
    showDropdown() {
      this.showResourcesDropdown = true
    },
    hideDropdown() {
      this.showResourcesDropdown = false
    },
    toggleProductsDropdown() {
      this.showProductsDropdown = !this.showProductsDropdown
      // Clear any pending hide timeout when toggling
      if (this.productsHideTimeout) {
        clearTimeout(this.productsHideTimeout)
        this.productsHideTimeout = null
      }
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

/* Top Info Bar */
.top-info-bar {
  background: #f8fafc;
  border-bottom: 1px solid #e0f2fe;
  padding: 10px 0;
  font-size: 0.85rem;
}

.info-items {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 32px;
  flex-wrap: wrap;
}

.info-item {
  display: flex;
  align-items: center;
  gap: 6px;
  color: #475569;
  text-decoration: none;
  transition: color 0.3s ease;
}

.info-item:hover {
  color: #0369a1;
}

.info-item svg {
  color: #0369a1;
  flex-shrink: 0;
}

/* Header */
.site-header {
  background: white;
  box-shadow: 0 2px 8px rgba(30, 58, 138, 0.1);
  position: sticky;
  top: 0;
  z-index: 1000;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 24px;
}

.header-content {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 16px 0;
  gap: 20px;
}

/* Logo */
.logo-part a {
  display: block;
  line-height: 0;
}

.logo-part img {
  height: 45px;
  width: auto;
  display: block;
}

/* Desktop Navigation */
.desktop-nav {
  display: flex;
  align-items: center;
  gap: 28px;
  flex: 1;
  justify-content: center;
}

.nav-link {
  color: #1e3a8a;
  text-decoration: none;
  font-size: 0.95rem;
  font-weight: 500;
  transition: all 0.3s ease;
  padding: 8px 4px;
  position: relative;
  background: none;
  border: none;
  cursor: pointer;
  display: flex;
  align-items: center;
  gap: 4px;
}

.nav-link:hover {
  color: #0369a1;
}

.nav-link::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  width: 0;
  height: 2px;
  background: #0369a1;
  transition: width 0.3s ease;
}

.nav-link:hover::after {
  width: 100%;
}

/* Dropdown */
.dropdown {
  position: relative;
}

.dropdown-toggle {
  white-space: nowrap;
}

.dropdown-toggle svg {
  transition: transform 0.3s ease;
}

.dropdown-toggle svg.rotate {
  transform: rotate(180deg);
}

.dropdown-menu {
  position: absolute;
  top: 100%;
  left: 50%;
  transform: translateX(-50%);
  margin-top: 12px;
  background: white;
  border-radius: 8px;
  box-shadow: 0 8px 24px rgba(30, 58, 138, 0.2);
  min-width: 220px;
  padding: 8px;
  opacity: 0;
  visibility: hidden;
  transition: opacity 0.3s ease, visibility 0.3s ease;
  pointer-events: none;
}

.dropdown-menu.show {
  opacity: 1;
  visibility: visible;
  pointer-events: auto;
}

.dropdown-item {
  display: flex;
  align-items: center;
  gap: 10px;
  padding: 10px 14px;
  color: #1e3a8a;
  text-decoration: none;
  font-size: 0.9rem;
  font-weight: 500;
  border-radius: 6px;
  transition: all 0.2s ease;
}

.dropdown-item:hover {
  background: linear-gradient(135deg, #f0f9ff 0%, #e0f2fe 100%);
  color: #0369a1;
}

.dropdown-item svg {
  color: #0369a1;
}

/* Products Dropdown */
.products-dropdown {
  position: relative;
}

.products-dropdown-menu {
  position: absolute;
  top: 100%;
  left: 50%;
  transform: translateX(-50%);
  margin-top: 16px;
  background: white;
  border-radius: 16px;
  box-shadow: 0 20px 60px rgba(2, 55, 95, 0.2), 0 0 0 1px rgba(2, 55, 95, 0.05);
  min-width: 700px;
  max-width: 900px;
  padding: 32px;
  opacity: 0;
  visibility: hidden;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  pointer-events: none;
  z-index: 1000;
}

.products-dropdown-menu.show {
  opacity: 1;
  visibility: visible;
  pointer-events: auto;
  transform: translateX(-50%) translateY(0);
}

.products-dropdown-menu::before {
  content: '';
  position: absolute;
  top: -8px;
  left: 50%;
  transform: translateX(-50%);
  width: 0;
  height: 0;
  border-left: 10px solid transparent;
  border-right: 10px solid transparent;
  border-bottom: 10px solid white;
  filter: drop-shadow(0 -2px 4px rgba(2, 55, 95, 0.1));
}

.services-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 20px;
}

.service-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 8px;
  padding: 20px 16px;
  color: #02375f;
  text-decoration: none;
  font-size: 0.9rem;
  font-weight: 600;
  border-radius: 12px;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  border: 2px solid #e2e8f0;
  text-align: center;
  min-height: 80px;
  background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%);
  position: relative;
  overflow: hidden;
}

.service-item::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 3px;
  background: linear-gradient(90deg, #01aeef 0%, #0284c7 100%);
  transform: scaleX(0);
  transition: transform 0.3s ease;
  transform-origin: left;
}

.service-item:hover {
  background: linear-gradient(135deg, #f0f9ff 0%, #e0f2fe 100%);
  color: #02375f;
  border-color: #01aeef;
  transform: translateY(-4px);
  box-shadow: 0 8px 24px rgba(1, 174, 239, 0.2);
}

.service-item:hover::before {
  transform: scaleX(1);
}

.service-icon {
  display: none;
}

.service-name {
  font-weight: 700;
  line-height: 1.4;
  color: inherit;
}

/* Header CTA */
.header-cta {
  display: flex;
  align-items: center;
  gap: 12px;
}

.btn-whatsapp,
.btn-contact {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  padding: 8px 16px;
  border-radius: 6px;
  text-decoration: none;
  font-size: 0.9rem;
  font-weight: 600;
  transition: all 0.3s ease;
  white-space: nowrap;
}

.btn-whatsapp {
  background: #25D366;
  color: white;
  box-shadow: 0 2px 8px rgba(37, 211, 102, 0.3);
}

.btn-whatsapp:hover {
  background: #20bd5a;
  transform: translateY(-1px);
  box-shadow: 0 4px 12px rgba(37, 211, 102, 0.4);
}

.btn-contact {
  background: #1e3a8a;
  color: white;
  box-shadow: 0 2px 8px rgba(30, 58, 138, 0.3);
}

.btn-contact:hover {
  background: #0369a1;
  transform: translateY(-1px);
  box-shadow: 0 4px 12px rgba(30, 58, 138, 0.4);
}

/* Mobile Menu Toggle */
.mobile-menu-toggle {
  display: none;
  background: none;
  border: none;
  color: #1e3a8a;
  cursor: pointer;
  padding: 8px;
  margin: -8px;
}

/* Mobile Navigation */
.mobile-nav {
  background: white;
  border-top: 1px solid #e0f2fe;
  max-height: calc(100vh - 68px);
  overflow-y: auto;
}

.mobile-nav-content {
  padding: 20px 24px;
}

.mobile-nav-link {
  display: block;
  padding: 14px 16px;
  color: #1e3a8a;
  text-decoration: none;
  font-size: 1rem;
  font-weight: 500;
  border-radius: 6px;
  transition: all 0.2s ease;
  margin-bottom: 4px;
}

.mobile-nav-link:hover {
  background: linear-gradient(135deg, #f0f9ff 0%, #e0f2fe 100%);
}

/* Mobile Dropdown */
.mobile-dropdown {
  margin-bottom: 4px;
}

.mobile-dropdown-toggle {
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 14px 16px;
  background: none;
  border: none;
  color: #1e3a8a;
  font-size: 1rem;
  font-weight: 500;
  border-radius: 6px;
  cursor: pointer;
  transition: all 0.2s ease;
  text-align: left;
}

.mobile-dropdown-toggle:hover {
  background: linear-gradient(135deg, #f0f9ff 0%, #e0f2fe 100%);
}

.mobile-dropdown-toggle svg {
  transition: transform 0.3s ease;
}

.mobile-dropdown-toggle svg.rotate {
  transform: rotate(180deg);
}

.mobile-dropdown-content {
  padding-left: 16px;
  margin-top: 4px;
}

.mobile-dropdown-link {
  display: flex;
  align-items: center;
  gap: 10px;
  padding: 12px 16px;
  color: #475569;
  text-decoration: none;
  font-size: 0.9rem;
  font-weight: 500;
  border-radius: 6px;
  transition: all 0.2s ease;
  margin-bottom: 4px;
}

.mobile-dropdown-link:hover {
  background: linear-gradient(135deg, #f0f9ff 0%, #e0f2fe 100%);
  color: #02375f;
  padding-left: 24px;
}

.mobile-dropdown-link svg {
  color: #01aeef;
}

/* Mobile CTA Buttons */
.mobile-cta-buttons {
  display: flex;
  flex-direction: column;
  gap: 10px;
  margin-top: 24px;
  padding-top: 20px;
  border-top: 1px solid #e0f2fe;
}

.btn-whatsapp.mobile,
.btn-contact.mobile {
  width: 100%;
  justify-content: center;
  padding: 12px 20px;
  font-size: 0.95rem;
}

/* Animations */
.slide-enter-active,
.slide-leave-active {
  transition: all 0.3s ease;
}

.slide-enter-from {
  opacity: 0;
  transform: translateY(-20px);
}

.slide-leave-to {
  opacity: 0;
  transform: translateY(-20px);
}

.expand-enter-active,
.expand-leave-active {
  transition: all 0.3s ease;
  overflow: hidden;
}

.expand-enter-from,
.expand-leave-to {
  max-height: 0;
  opacity: 0;
}

.expand-enter-to,
.expand-leave-from {
  max-height: 200px;
  opacity: 1;
}

/* Responsive */
@media (max-width: 1024px) {
  .desktop-nav {
    gap: 20px;
  }
  
  .products-dropdown-menu {
    min-width: 600px;
    max-width: 700px;
    padding: 28px;
  }
  
  .services-grid {
    grid-template-columns: repeat(3, 1fr);
    gap: 16px;
  }

  .service-item {
    padding: 18px 14px;
    min-height: 75px;
  }
  
  .header-cta {
    gap: 8px;
  }
  
  .btn-whatsapp,
  .btn-contact {
    padding: 8px 12px;
    font-size: 0.85rem;
  }
  
  .info-items {
    gap: 20px;
    font-size: 0.8rem;
  }
}

@media (max-width: 768px) {
  .desktop-nav,
  .header-cta {
    display: none;
  }
  
  .mobile-menu-toggle {
    display: block;
  }
  
  .header-content {
    padding: 14px 0;
  }
  
  .logo-part img {
    height: 40px;
  }
  
  .top-info-bar {
    padding: 8px 0;
  }
  
  .info-items {
    gap: 16px;
    font-size: 0.75rem;
  }
  
  .info-item span {
    display: none;
  }
  
  .info-item {
    justify-content: center;
  }
}

@media (max-width: 900px) {
  .products-dropdown-menu {
    min-width: 500px;
    max-width: 600px;
    padding: 24px;
  }

  .services-grid {
    grid-template-columns: repeat(3, 1fr);
    gap: 14px;
  }

  .service-item {
    padding: 16px 12px;
    min-height: 70px;
    font-size: 0.85rem;
  }
}

@media (max-width: 480px) {
  .container {
    padding: 0 16px;
  }
  
  .mobile-nav-content {
    padding: 16px;
  }
  
  .logo-part img {
    height: 36px;
  }
  
  .info-items {
    gap: 12px;
  }

  .mobile-dropdown-link {
    padding: 14px 20px;
    font-size: 0.95rem;
  }
}
</style>