<template>
  <section id="contact" class="contact-section">
    <div class="container">
      <div class="contact-content">
        <!-- Left Side: Contact Info & Illustration -->
        <div class="contact-left">
          <div class="contact-header">
            <div class="section-label">Get In Touch</div>
            <h2 class="section-title">
              Let's <span class="gradient-text">Get Started</span>
            </h2>
            <p class="section-description">
              Ready to transform your business? Fill out the form and we'll get back to you within 24 hours. Let's build something amazing together.
            </p>
          </div>

          <div class="contact-info-list">
            <div class="contact-info-item">
              <div class="info-icon-wrapper">
                <i class="fas fa-phone info-icon"></i>
              </div>
              <div class="info-content">
                <h4 class="info-title">Phone</h4>
                <p class="info-text">+254 781 312 070</p>
              </div>
            </div>
            <div class="contact-info-item">
              <div class="info-icon-wrapper">
                <i class="fas fa-envelope info-icon"></i>
              </div>
              <div class="info-content">
                <h4 class="info-title">Email</h4>
                <p class="info-text">info@wabestudio.co.ke</p>
              </div>
            </div>
            <div class="contact-info-item">
              <div class="info-icon-wrapper">
                <i class="fas fa-globe info-icon"></i>
              </div>
              <div class="info-content">
                <h4 class="info-title">Website</h4>
                <p class="info-text">wabestudio.co.ke</p>
              </div>
            </div>
            <div class="contact-info-item">
              <div class="info-icon-wrapper">
                <i class="fas fa-map-marker-alt info-icon"></i>
              </div>
              <div class="info-content">
                <h4 class="info-title">Location</h4>
                <p class="info-text">Nairobi, Kenya</p>
              </div>
            </div>
          </div>
        </div>

        <!-- Right Side: Contact Form -->
        <div class="contact-right">
          <!-- Success Message -->
          <div v-if="successMessage" class="alert alert-success">
            <i class="fas fa-check-circle"></i>
            {{ successMessage }}
          </div>

          <!-- Error Message -->
          <div v-if="errorMessage" class="alert alert-error">
            <i class="fas fa-exclamation-circle"></i>
            {{ errorMessage }}
          </div>

          <form @submit.prevent="submitForm" class="contact-form">
            <div class="form-group">
              <label class="form-label">Your Name *</label>
              <input
                v-model="formData.name"
                type="text"
                placeholder="John Doe"
                class="form-input"
                :disabled="isSubmitting"
                required
              />
            </div>
            <div class="form-group">
              <label class="form-label">Company / Project Name</label>
              <input
                v-model="formData.company"
                type="text"
                placeholder="Your Company"
                class="form-input"
                :disabled="isSubmitting"
              />
            </div>
            <div class="form-row">
              <div class="form-group">
                <label class="form-label">Email Address *</label>
                <input
                  v-model="formData.email"
                  type="email"
                  placeholder="john@example.com"
                  class="form-input"
                  :disabled="isSubmitting"
                  required
                />
              </div>
              <div class="form-group">
                <label class="form-label">Phone Number *</label>
                <input
                  v-model="formData.phone"
                  type="tel"
                  placeholder="+254 781 312 070"
                  class="form-input"
                  :disabled="isSubmitting"
                  required
                />
              </div>
            </div>
            <div class="form-group">
              <label class="form-label">Tell us about your project *</label>
              <textarea
                v-model="formData.message"
                placeholder="Describe your project requirements, goals, and timeline..."
                class="form-textarea"
                :disabled="isSubmitting"
                required
              ></textarea>
            </div>
            <button type="submit" class="form-submit" :disabled="isSubmitting">
              <span v-if="!isSubmitting" class="button-text">Send Message</span>
              <span v-else class="button-text">Sending...</span>
              <svg v-if="!isSubmitting" class="button-icon" width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M2 10L18 10M18 10L11 3M18 10L11 17" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>
              <svg v-else class="spinner" width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <circle cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4" stroke-opacity="0.25"/>
                <path d="M12 2a10 10 0 0 1 10 10" stroke="currentColor" stroke-width="4" stroke-linecap="round"/>
              </svg>
            </button>
            <p class="form-note">
              <i class="fas fa-lock note-icon"></i>
              Your information is secure and will never be shared with third parties.
            </p>
          </form>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref } from 'vue'
import axios from 'axios'

const formData = ref({
  name: '',
  company: '',
  email: '',
  phone: '',
  message: ''
})

const isSubmitting = ref(false)
const successMessage = ref('')
const errorMessage = ref('')

const submitForm = async () => {
  isSubmitting.value = true
  successMessage.value = ''
  errorMessage.value = ''

  try {
    const response = await axios.post('/api/contact', formData.value)
    
    if (response.data.success) {
      successMessage.value = response.data.message
      
      // Reset form
      formData.value = {
        name: '',
        company: '',
        email: '',
        phone: '',
        message: ''
      }

      // Clear success message after 10 seconds
      setTimeout(() => {
        successMessage.value = ''
      }, 10000)
    }
  } catch (error) {
    if (error.response && error.response.data && error.response.data.errors) {
      // Validation errors
      const errors = Object.values(error.response.data.errors).flat()
      errorMessage.value = errors.join(' ')
    } else if (error.response && error.response.data && error.response.data.message) {
      errorMessage.value = error.response.data.message
    } else {
      errorMessage.value = 'An error occurred while sending your message. Please try again.'
    }

    // Clear error message after 8 seconds
    setTimeout(() => {
      errorMessage.value = ''
    }, 8000)
  } finally {
    isSubmitting.value = false
  }
}
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

/* ===== CONTACT SECTION - SPLIT LAYOUT ===== */
.contact-section {
  padding: 100px 24px;
  background: white;
  position: relative;
  overflow: hidden;
}

.contact-section::before {
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

.contact-content {
  display: grid;
  grid-template-columns: 1fr 1.2fr;
  gap: 80px;
  align-items: start;
  position: relative;
  z-index: 1;
}

/* ===== LEFT SIDE - CONTACT INFO ===== */
.contact-left {
  display: flex;
  flex-direction: column;
  gap: 40px;
  animation: fadeInLeft 1s ease-out;
  position: sticky;
  top: 100px;
}

.contact-header {
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

/* ===== CONTACT INFO LIST ===== */
.contact-info-list {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.contact-info-item {
  display: flex;
  align-items: center;
  gap: 16px;
  padding: 20px;
  background: white;
  border-radius: 12px;
  box-shadow: 0 4px 20px rgba(30, 58, 138, 0.08);
  transition: all 0.3s ease;
  border-left: 4px solid #0369a1;
}

.contact-info-item:hover {
  transform: translateX(8px);
  box-shadow: 0 8px 30px rgba(30, 58, 138, 0.15);
  border-left-color: #fbbf24;
}

.info-icon-wrapper {
  width: 50px;
  height: 50px;
  background: linear-gradient(135deg, #dbeafe 0%, #bfdbfe 100%);
  border-radius: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  transition: all 0.3s ease;
}

.contact-info-item:hover .info-icon-wrapper {
  background: linear-gradient(135deg, #fef3c7 0%, #fde68a 100%);
  transform: scale(1.1);
}

.info-icon {
  font-size: 1.3rem;
  line-height: 1;
  color: #0369a1;
  transition: color 0.3s ease;
}

.contact-info-item:hover .info-icon {
  color: #d97706;
}

.info-content {
  flex: 1;
}

.info-title {
  font-size: 0.875rem;
  font-weight: 700;
  color: #1e3a8a;
  margin-bottom: 4px;
  font-family: 'Segoe UI', system-ui, sans-serif;
}

.info-text {
  font-size: 0.95rem;
  color: #64748b;
  font-family: 'Segoe UI', system-ui, sans-serif;
  margin: 0;
}


/* ===== RIGHT SIDE - CONTACT FORM ===== */
.contact-right {
  animation: fadeInRight 1s ease-out;
}

.contact-form {
  background: white;
  padding: 40px;
  border-radius: 20px;
  box-shadow: 0 10px 40px rgba(30, 58, 138, 0.1);
  border-top: 4px solid #0369a1;
}

.form-group {
  margin-bottom: 24px;
}

.form-label {
  display: block;
  font-size: 0.875rem;
  font-weight: 600;
  color: #1e3a8a;
  margin-bottom: 8px;
  font-family: 'Segoe UI', system-ui, sans-serif;
}

.form-row {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 20px;
  margin-bottom: 0;
}

.form-input {
  width: 100%;
  padding: 14px 18px;
  border: 2px solid #e2e8f0;
  border-radius: 10px;
  font-size: 0.95rem;
  font-family: 'Segoe UI', system-ui, sans-serif;
  transition: all 0.3s ease;
  color: #1e293b;
  background: white;
}

.form-input:focus {
  outline: none;
  border-color: #0369a1;
  box-shadow: 0 0 0 4px rgba(3, 105, 161, 0.1);
}

.form-textarea {
  width: 100%;
  padding: 14px 18px;
  border: 2px solid #e2e8f0;
  border-radius: 10px;
  font-size: 0.95rem;
  font-family: 'Segoe UI', system-ui, sans-serif;
  transition: all 0.3s ease;
  resize: vertical;
  min-height: 140px;
  color: #1e293b;
  background: white;
}

.form-textarea:focus {
  outline: none;
  border-color: #0369a1;
  box-shadow: 0 0 0 4px rgba(3, 105, 161, 0.1);
}

.form-submit {
  width: 100%;
  padding: 16px 32px;
  background: linear-gradient(135deg, #1e3a8a 0%, #0369a1 100%);
  color: white;
  border: none;
  border-radius: 10px;
  font-size: 1rem;
  font-weight: 600;
  font-family: 'Segoe UI', system-ui, sans-serif;
  cursor: pointer;
  transition: all 0.3s ease;
  box-shadow: 0 6px 20px rgba(30, 58, 138, 0.3);
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  position: relative;
  overflow: hidden;
}

.form-submit::before {
  content: '';
  position: absolute;
  top: 0;
  left: -100%;
  width: 100%;
  height: 100%;
  background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
  transition: left 0.5s;
}

.form-submit:hover::before {
  left: 100%;
}

.form-submit:hover {
  transform: translateY(-2px);
  box-shadow: 0 10px 30px rgba(30, 58, 138, 0.4);
}

.button-icon {
  transition: transform 0.3s ease;
}

.form-submit:hover .button-icon {
  transform: translateX(4px);
}

.form-note {
  margin-top: 16px;
  font-size: 0.875rem;
  color: #64748b;
  display: flex;
  align-items: center;
  gap: 8px;
  font-family: 'Segoe UI', system-ui, sans-serif;
}

.note-icon {
  font-size: 1rem;
  color: #64748b;
}

/* ===== ALERT MESSAGES ===== */
.alert {
  padding: 16px 20px;
  border-radius: 12px;
  margin-bottom: 24px;
  display: flex;
  align-items: center;
  gap: 12px;
  font-size: 0.95rem;
  font-family: 'Segoe UI', system-ui, sans-serif;
  animation: slideDown 0.3s ease-out;
}

.alert i {
  font-size: 1.25rem;
}

.alert-success {
  background: linear-gradient(135deg, #d1fae5 0%, #a7f3d0 100%);
  color: #065f46;
  border-left: 4px solid #10b981;
}

.alert-error {
  background: linear-gradient(135deg, #fee2e2 0%, #fecaca 100%);
  color: #991b1b;
  border-left: 4px solid #ef4444;
}

/* ===== LOADING SPINNER ===== */
.spinner {
  animation: spin 1s linear infinite;
}

@keyframes spin {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}

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

/* ===== DISABLED STATE ===== */
.form-input:disabled,
.form-textarea:disabled {
  background: #f8fafc;
  cursor: not-allowed;
  opacity: 0.6;
}

.form-submit:disabled {
  opacity: 0.7;
  cursor: not-allowed;
  transform: none !important;
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

/* ===== RESPONSIVE DESIGN ===== */
@media (max-width: 1024px) {
  .contact-content {
    grid-template-columns: 1fr;
    gap: 60px;
  }

  .contact-left {
    position: static;
  }

  .section-title {
    font-size: 2.25rem;
  }
}

@media (max-width: 768px) {
  .contact-section {
    padding: 60px 20px;
  }

  .contact-content {
    gap: 40px;
  }

  .section-title {
    font-size: 2rem;
  }

  .section-description {
    font-size: 1rem;
  }

  .contact-form {
    padding: 30px 24px;
  }

  .form-row {
    grid-template-columns: 1fr;
    gap: 0;
  }

}

@media (max-width: 480px) {
  .contact-section {
    padding: 40px 16px;
  }

  .section-title {
    font-size: 1.75rem;
  }

  .section-description {
    font-size: 0.95rem;
  }

  .contact-form {
    padding: 24px 20px;
  }

  .form-input,
  .form-textarea {
    padding: 12px 16px;
    font-size: 0.9rem;
  }

  .form-submit {
    padding: 14px 28px;
    font-size: 0.95rem;
  }

  .contact-info-item {
    padding: 16px;
  }

  .info-icon-wrapper {
    width: 45px;
    height: 45px;
  }

  .info-icon {
    font-size: 1.25rem;
  }

  .info-title {
    font-size: 0.8rem;
  }

  .info-text {
    font-size: 0.875rem;
  }
}
</style>