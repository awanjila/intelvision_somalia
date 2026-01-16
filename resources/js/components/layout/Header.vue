<template>
  <!-- Top Info Bar -->
  <div class="top-info-bar">
    <div class="container">
      <div class="info-items">
        <a href="tel:+254722850008" class="info-item">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"/>
          </svg>
          <span>+254(0)722 850008</span>
        </a>
        <a href="tel:+254734850008" class="info-item">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"/>
          </svg>
          <span>+254(0)734 850008</span>
        </a>
        <a href="mailto:info@intelvision.co.ke" class="info-item">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <rect width="20" height="16" x="2" y="4" rx="2"/>
            <path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"/>
          </svg>
          <span>info@intelvision.co.ke</span>
        </a>
        <a href="mailto:sales@intelvision.co.ke" class="info-item">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10"/>
            <path d="m9 12 2 2 4-4"/>
          </svg>
          <span>sales@intelvision.co.ke</span>
        </a>
        <div class="info-item">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M20 10c0 6-8 12-8 12s-8-6-8-12a8 8 0 0 1 16 0Z"/>
            <circle cx="12" cy="10" r="3"/>
          </svg>
          <span>Nairobi, Kenya</span>
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
          <a href="/about/wabe_digital_Agency" class="nav-link">About Us</a>
          <a href="/our-works" class="nav-link">Our Works</a>
          <a href="/wabe_digital_agency/services" class="nav-link">Services</a>
          
          <!-- Resources Dropdown -->
          <div class="dropdown">
            <button class="nav-link dropdown-toggle" @click="showResourcesDropdown = !showResourcesDropdown">
              Resources
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" :class="{ 'rotate': showResourcesDropdown }">
                <path d="m6 9 6 6 6-6"/>
              </svg>
            </button>
            <div class="dropdown-menu" :class="{ 'show': showResourcesDropdown }">
              <a href="/blogs" class="dropdown-item">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M4 22h16a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H8a2 2 0 0 0-2 2v16a2 2 0 0 1-2 2Zm0 0a2 2 0 0 1-2-2v-9c0-1.1.9-2 2-2h2"/>
                  <path d="M18 14h-8"/>
                  <path d="M15 18h-5"/>
                  <path d="M10 6h8v4h-8V6Z"/>
                </svg>
                News & Articles
              </a>
              <a href="/pricing_and_packages" class="dropdown-item">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <circle cx="8" cy="8" r="6"/>
                  <path d="M18.09 10.37A6 6 0 1 1 10.34 18"/>
                  <path d="M7 6h1v4"/>
                  <path d="m16.71 13.88.7.71-2.82 2.82"/>
                </svg>
                Pricing & Packages
              </a>
            </div>
          </div>

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
          <a href="/our-works" class="mobile-nav-link" @click="mobileMenuOpen = false">Our Works</a>
          <a href="/services" class="mobile-nav-link" @click="mobileMenuOpen = false">Services</a>
          
          <!-- Resources Accordion -->
          <div class="mobile-dropdown">
            <button class="mobile-dropdown-toggle" @click="mobileResourcesOpen = !mobileResourcesOpen">
              Resources
              <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" :class="{ 'rotate': mobileResourcesOpen }">
                <path d="m6 9 6 6 6-6"/>
              </svg>
            </button>
            <transition name="expand">
              <div v-show="mobileResourcesOpen" class="mobile-dropdown-content">
                <a href="/resources/news-articles" class="mobile-dropdown-link" @click="mobileMenuOpen = false">
                  <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M4 22h16a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H8a2 2 0 0 0-2 2v16a2 2 0 0 1-2 2Zm0 0a2 2 0 0 1-2-2v-9c0-1.1.9-2 2-2h2"/>
                    <path d="M18 14h-8"/>
                    <path d="M15 18h-5"/>
                    <path d="M10 6h8v4h-8V6Z"/>
                  </svg>
                  News & Articles
                </a>
                <a href="/resources/pricing" class="mobile-dropdown-link" @click="mobileMenuOpen = false">
                  <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="8" cy="8" r="6"/>
                    <path d="M18.09 10.37A6 6 0 1 1 10.34 18"/>
                    <path d="M7 6h1v4"/>
                    <path d="m16.71 13.88.7.71-2.82 2.82"/>
                  </svg>
                  Pricing & Packages
                </a>
              </div>
            </transition>
          </div>

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
export default {
  name: 'SiteHeader',
  data() {
    return {
      whatsappNumber: '254722850008',
      mobileMenuOpen: false,
      showResourcesDropdown: false,
      mobileResourcesOpen: false
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
      }
    }
  },
  mounted() {
    // Close dropdown when clicking outside
    this.boundHandleClickOutside = this.handleClickOutside.bind(this)
    document.addEventListener('click', this.boundHandleClickOutside)
    
    // Add hover listeners for desktop dropdown
    if (this.$refs.headerRef) {
      const dropdown = this.$refs.headerRef.querySelector('.dropdown')
      if (dropdown) {
        dropdown.addEventListener('mouseenter', this.showDropdown.bind(this))
        dropdown.addEventListener('mouseleave', this.hideDropdown.bind(this))
      }
    }
  },
  beforeUnmount() {
    document.body.style.overflow = ''
    document.removeEventListener('click', this.boundHandleClickOutside)
    
    if (this.$refs.headerRef) {
      const dropdown = this.$refs.headerRef.querySelector('.dropdown')
      if (dropdown) {
        dropdown.removeEventListener('mouseenter', this.showDropdown.bind(this))
        dropdown.removeEventListener('mouseleave', this.hideDropdown.bind(this))
      }
    }
  },
  methods: {
    handleClickOutside(event) {
      if (!this.$refs.headerRef) return
      
      const dropdown = this.$refs.headerRef.querySelector('.dropdown')
      const mobileToggle = this.$refs.headerRef.querySelector('.mobile-menu-toggle')
      
      if (dropdown && !dropdown.contains(event.target) && (!mobileToggle || !mobileToggle.contains(event.target))) {
        this.showResourcesDropdown = false
      }
    },
    showDropdown() {
      this.showResourcesDropdown = true
    },
    hideDropdown() {
      this.showResourcesDropdown = false
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
  background: #f8fafc;
  color: #0369a1;
}

.mobile-dropdown-link svg {
  color: #0369a1;
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
}
</style>