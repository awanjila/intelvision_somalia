<template>
  <footer class="site-footer">
    <!-- Main Footer Content -->
    <div class="footer-main">
      <div class="container">
        <div class="footer-grid">
          <!-- Company Info -->
          <div class="footer-column">
            <div class="footer-logo">
              <!-- <a href="/"><img src="/front_assets/images/logo-light.png" alt="Wabe Studio"></a> -->
            </div>
            <p class="footer-description">
              An excellent service management in the area of IT providing solutions. High level efficient solution to businesses growth.
            </p>
            <div class="social-links">
              <a href="#" target="_blank" rel="noopener noreferrer" class="social-link" aria-label="Facebook">
                <i class="fab fa-facebook-f"></i>
              </a>
              <a href="#" target="_blank" rel="noopener noreferrer" class="social-link" aria-label="Twitter">
                <i class="fab fa-twitter"></i>
              </a>
              <a href="#" target="_blank" rel="noopener noreferrer" class="social-link" aria-label="LinkedIn">
                <i class="fab fa-linkedin-in"></i>
              </a>
              <a href="#" target="_blank" rel="noopener noreferrer" class="social-link" aria-label="Instagram">
                <i class="fab fa-instagram"></i>
              </a>
            </div>
          </div>

          <!-- IT Services -->
          <div class="footer-column">
            <h3 class="footer-title">IT Services</h3>
            <ul v-if="services.length > 0" class="footer-links">
              <li v-for="service in services.slice(0, 6)" :key="service.id">
                <a :href="`/show/service/${service.slug}`">
                  <i class="fas fa-chevron-right"></i>
                  {{ service.name }}
                </a>
              </li>
            </ul>
            <ul v-else class="footer-links">
              <li><a href="/wabe_digital_agency/services"><i class="fas fa-chevron-right"></i>View All Services</a></li>
            </ul>
          </div>

          <!-- Contact Info -->
          <div class="footer-column">
            <h3 class="footer-title">Contact Info</h3>
            <ul class="contact-info">
              <li>
                <i class="fas fa-map-marker-alt"></i>
                <span>3rd Parklands Ave, Nairobi</span>
              </li>
              <li>
                <i class="fas fa-phone"></i>
                <div class="contact-group">
                  <a href="tel:+254722850008">+254 (0)722 850008</a>
                  <a href="tel:+254734850008">+254 (0)734 850008</a>
                </div>
              </li>
              <li>
                <i class="fas fa-envelope"></i>
                <div class="contact-group">
                  <a href="mailto:info@intelvision.co.ke">info@intelvision.co.ke</a>
                  <a href="mailto:sales@intelvision.co.ke">sales@intelvision.co.ke</a>
                </div>
              </li>
              <li>
                <i class="fas fa-clock"></i>
                <span>Mon - Fri: 08:00 - 17:00</span>
              </li>
            </ul>
          </div>

          <!-- Newsletter -->
          <div class="footer-column">
            <h3 class="footer-title">Newsletter</h3>
            <p class="newsletter-desc">
              Stay updated with our latest news and exclusive offers. Subscribe to our newsletter today!
            </p>
            <form @submit.prevent="subscribeNewsletter" class="newsletter-form">
              <div class="input-wrapper">
                <input
                  v-model="newsletterEmail"
                  type="email"
                  placeholder="Your email address"
                  required
                  :disabled="isSubscribing"
                />
                <button type="submit" :disabled="isSubscribing" aria-label="Subscribe">
                  <i v-if="!isSubscribing" class="fas fa-paper-plane"></i>
                  <i v-else class="fas fa-spinner fa-spin"></i>
                </button>
              </div>
              <p v-if="newsletterMessage" class="newsletter-message" :class="newsletterMessageType">
                {{ newsletterMessage }}
              </p>
            </form>
          </div>
        </div>
      </div>
    </div>

    <!-- Footer Bottom -->
    <div class="footer-bottom">
      <div class="container">
        <div class="footer-bottom-content">
          <div class="copyright">
            <span id="current-year">{{ currentYear }}</span> © All Rights Reserved. Developed By 
            <a href="https://wabestudio.co.ke/" target="_blank">Wabe Digital Agency</a>
          </div>
          <ul class="footer-menu">
            <li><a href="/">Home</a></li>
            <li><a href="/about/wabe_digital_Agency">About</a></li>
            <li><a href="/blogs">Blog</a></li>
            <li><a href="/wabe_digital_agency/services">Services</a></li>
            <li><a href="/contact">Contact</a></li>
          </ul>
        </div>
      </div>
    </div>
  </footer>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue'
import axios from 'axios'

const services = ref([])
const newsletterEmail = ref('')
const isSubscribing = ref(false)
const newsletterMessage = ref('')
const newsletterMessageType = ref('')

const currentYear = computed(() => new Date().getFullYear())

const fetchServices = async () => {
  try {
    const response = await axios.get('/api/services')
    services.value = response.data
  } catch (error) {
    console.error('Error fetching services:', error)
  }
}

const subscribeNewsletter = async () => {
  isSubscribing.value = true
  newsletterMessage.value = ''
  
  try {
    // You can implement newsletter subscription API here
    // For now, just show success message
    await new Promise(resolve => setTimeout(resolve, 1000))
    newsletterMessage.value = 'Thank you for subscribing!'
    newsletterMessageType.value = 'success'
    newsletterEmail.value = ''
    
    setTimeout(() => {
      newsletterMessage.value = ''
    }, 5000)
  } catch (error) {
    newsletterMessage.value = 'Subscription failed. Please try again.'
    newsletterMessageType.value = 'error'
  } finally {
    isSubscribing.value = false
  }
}

onMounted(() => {
  fetchServices()
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

/* ===== FOOTER ===== */
.site-footer {
  background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
  color: #e2e8f0;
  font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
}

/* ===== MAIN FOOTER ===== */
.footer-main {
  padding: 80px 0 60px;
  border-bottom: 1px solid rgba(226, 232, 240, 0.1);
}

.footer-grid {
  display: grid;
  grid-template-columns: 1.5fr 1fr 1fr 1.2fr;
  gap: 60px;
}

.footer-column {
  display: flex;
  flex-direction: column;
  gap: 24px;
}

/* ===== LOGO & DESCRIPTION ===== */
.footer-logo img {
  height: 45px;
  width: auto;
  filter: brightness(0) invert(1);
}

.footer-description {
  font-size: 0.95rem;
  line-height: 1.7;
  color: #cbd5e1;
}

/* ===== SOCIAL LINKS ===== */
.social-links {
  display: flex;
  gap: 12px;
}

.social-link {
  width: 40px;
  height: 40px;
  background: rgba(255, 255, 255, 0.1);
  border-radius: 8px;
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  text-decoration: none;
  transition: all 0.3s ease;
  border: 1px solid rgba(255, 255, 255, 0.1);
}

.social-link:hover {
  background: linear-gradient(135deg, #0369a1 0%, #60a5fa 100%);
  border-color: #60a5fa;
  transform: translateY(-3px);
}

.social-link i {
  font-size: 1rem;
}

/* ===== FOOTER TITLES ===== */
.footer-title {
  font-size: 1.25rem;
  font-weight: 700;
  color: white;
  margin-bottom: 4px;
  position: relative;
  padding-bottom: 12px;
}

.footer-title::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  width: 40px;
  height: 3px;
  background: linear-gradient(90deg, #fbbf24 0%, #f59e0b 100%);
  border-radius: 2px;
}

/* ===== FOOTER LINKS ===== */
.footer-links {
  list-style: none;
  padding: 0;
  margin: 0;
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.footer-links li a {
  color: #cbd5e1;
  text-decoration: none;
  font-size: 0.9rem;
  display: flex;
  align-items: center;
  gap: 8px;
  transition: all 0.3s ease;
  padding: 4px 0;
}

.footer-links li a i {
  font-size: 0.7rem;
  color: #fbbf24;
  transition: transform 0.3s ease;
}

.footer-links li a:hover {
  color: white;
  padding-left: 8px;
}

.footer-links li a:hover i {
  transform: translateX(4px);
}

/* ===== CONTACT INFO ===== */
.contact-info {
  list-style: none;
  padding: 0;
  margin: 0;
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.contact-info li {
  display: flex;
  align-items: flex-start;
  gap: 12px;
  font-size: 0.9rem;
  line-height: 1.6;
}

.contact-info li i {
  color: #fbbf24;
  font-size: 1rem;
  margin-top: 2px;
  flex-shrink: 0;
}

.contact-info li a {
  color: #cbd5e1;
  text-decoration: none;
  transition: color 0.3s ease;
}

.contact-info li a:hover {
  color: white;
}

.contact-group {
  display: flex;
  flex-direction: column;
  gap: 4px;
}

/* ===== NEWSLETTER ===== */
.newsletter-desc {
  font-size: 0.9rem;
  line-height: 1.6;
  color: #cbd5e1;
}

.newsletter-form {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.input-wrapper {
  position: relative;
  display: flex;
}

.input-wrapper input {
  flex: 1;
  padding: 12px 50px 12px 16px;
  border: 2px solid rgba(255, 255, 255, 0.1);
  border-radius: 8px;
  background: rgba(255, 255, 255, 0.05);
  color: white;
  font-size: 0.9rem;
  transition: all 0.3s ease;
}

.input-wrapper input::placeholder {
  color: #94a3b8;
}

.input-wrapper input:focus {
  outline: none;
  border-color: #0369a1;
  background: rgba(255, 255, 255, 0.08);
}

.input-wrapper button {
  position: absolute;
  right: 4px;
  top: 50%;
  transform: translateY(-50%);
  width: 40px;
  height: 40px;
  background: linear-gradient(135deg, #fbbf24 0%, #f59e0b 100%);
  border: none;
  border-radius: 6px;
  color: #1e3a8a;
  cursor: pointer;
  transition: all 0.3s ease;
  display: flex;
  align-items: center;
  justify-content: center;
}

.input-wrapper button:hover:not(:disabled) {
  transform: translateY(-50%) scale(1.05);
  box-shadow: 0 4px 12px rgba(251, 191, 36, 0.4);
}

.input-wrapper button:disabled {
  opacity: 0.6;
  cursor: not-allowed;
}

.newsletter-message {
  font-size: 0.85rem;
  padding: 8px 12px;
  border-radius: 6px;
  animation: slideDown 0.3s ease;
}

.newsletter-message.success {
  background: rgba(16, 185, 129, 0.2);
  color: #10b981;
  border: 1px solid rgba(16, 185, 129, 0.3);
}

.newsletter-message.error {
  background: rgba(239, 68, 68, 0.2);
  color: #ef4444;
  border: 1px solid rgba(239, 68, 68, 0.3);
}

/* ===== FOOTER BOTTOM ===== */
.footer-bottom {
  padding: 24px 0;
  background: rgba(0, 0, 0, 0.2);
}

.footer-bottom-content {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 20px;
}

.copyright {
  font-size: 0.9rem;
  color: #cbd5e1;
}

.copyright a {
  color: #fbbf24;
  text-decoration: none;
  font-weight: 600;
  transition: color 0.3s ease;
}

.copyright a:hover {
  color: white;
}

.footer-menu {
  list-style: none;
  padding: 0;
  margin: 0;
  display: flex;
  gap: 24px;
  flex-wrap: wrap;
}

.footer-menu li a {
  color: #cbd5e1;
  text-decoration: none;
  font-size: 0.9rem;
  font-weight: 500;
  transition: color 0.3s ease;
}

.footer-menu li a:hover {
  color: white;
}

/* ===== ANIMATIONS ===== */
@keyframes slideDown {
  from {
    opacity: 0;
    transform: translateY(-10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

/* ===== RESPONSIVE DESIGN ===== */
@media (max-width: 1024px) {
  .footer-grid {
    grid-template-columns: repeat(2, 1fr);
    gap: 40px;
  }
}

@media (max-width: 768px) {
  .footer-main {
    padding: 60px 0 40px;
  }

  .footer-grid {
    grid-template-columns: 1fr;
    gap: 40px;
  }

  .footer-bottom-content {
    flex-direction: column;
    text-align: center;
    gap: 16px;
  }

  .footer-menu {
    justify-content: center;
    gap: 16px;
  }

  .copyright {
    font-size: 0.85rem;
  }

  .footer-menu li a {
    font-size: 0.85rem;
  }
}

@media (max-width: 480px) {
  .footer-main {
    padding: 40px 0 30px;
  }

  .container {
    padding: 0 16px;
  }

  .footer-grid {
    gap: 32px;
  }

  .footer-title {
    font-size: 1.1rem;
  }

  .footer-description,
  .newsletter-desc {
    font-size: 0.875rem;
  }

  .footer-links li a,
  .contact-info li {
    font-size: 0.85rem;
  }

  .social-links {
    gap: 10px;
  }

  .social-link {
    width: 36px;
    height: 36px;
  }

  .footer-menu {
    gap: 12px;
  }

  .footer-menu li a {
    font-size: 0.8rem;
  }
}

/* ===== INTELVISION BRAND COLOR OVERRIDES ===== */
/* Footer section headings */
.footer-title {
  color: #01aeeff2;
}

.footer-title::after {
  background: linear-gradient(90deg, #01aeeff2 0%, #018fc4 100%);
}

/* Footer links - service links */
.footer-links li a {
  color: #01aeeff2;
}

.footer-links li a:hover {
  color: #018fc4;
}

.footer-links li a i {
  color: #01aeeff2;
}

/* Contact info links (email & phone) */
.contact-info li a {
  color: #01aeeff2;
}

.contact-info li a:hover {
  color: #018fc4;
}

.contact-info li i {
  color: #01aeeff2;
}

/* Footer menu navigation links */
.footer-menu li a {
  color: #01aeeff2;
}

.footer-menu li a:hover {
  color: #018fc4;
}

/* Footer border/divider lines */
.footer-main {
  border-bottom: 1px solid rgba(1, 174, 239, 0.25);
}

/* Input focus state */
.input-wrapper input:focus {
  border-color: #01aeeff2;
}
</style>