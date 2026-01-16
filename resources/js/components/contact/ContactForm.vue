<template>
  <div class="contact-widget">
    <div class="sec-title2 mb-40">
      <span class="sub-text contact mb-15">Get In Touch</span>
      <h2 class="title testi-title">Fill The Form Below</h2>
    </div>

    <div class="form-messages">
      <div v-if="successMessage" class="alert success">
        {{ successMessage }}
      </div>
      <div v-if="errorMessage" class="alert error">
        {{ errorMessage }}
      </div>
    </div>

    <form @submit.prevent="handleSubmit" class="query_form wrap-form">
      <fieldset>
        <div class="form-grid">
          <div class="form-group">
            <input
              v-model="form.name"
              class="form-input"
              :class="{ 'has-error': errors.name }"
              type="text"
              placeholder="Name"
              required
            >
            <span v-if="errors.name" class="error-message">{{ errors.name[0] }}</span>
          </div>

          <div class="form-group">
            <input
              v-model="form.email"
              class="form-input"
              :class="{ 'has-error': errors.email }"
              type="email"
              placeholder="E-Mail"
              required
            >
            <span v-if="errors.email" class="error-message">{{ errors.email[0] }}</span>
          </div>

          <div class="form-group">
            <input
              v-model="form.phone"
              class="form-input"
              :class="{ 'has-error': errors.phone }"
              type="text"
              placeholder="Phone Number"
              required
            >
            <span v-if="errors.phone" class="error-message">{{ errors.phone[0] }}</span>
          </div>

          <div class="form-group">
            <input
              v-model="form.subject"
              class="form-input"
              :class="{ 'has-error': errors.subject }"
              type="text"
              placeholder="Your Website"
              required
            >
            <span v-if="errors.subject" class="error-message">{{ errors.subject[0] }}</span>
          </div>

          <div class="form-group full-width">
            <textarea
              v-model="form.message"
              class="form-input"
              :class="{ 'has-error': errors.message }"
              placeholder="Your message Here"
              required
            ></textarea>
            <span v-if="errors.message" class="error-message">{{ errors.message[0] }}</span>
          </div>

          <div class="form-group full-width">
            <vue-recaptcha
              ref="recaptcha"
              :sitekey="recaptchaSiteKey"
              @verify="onRecaptchaVerified"
              @expired="onRecaptchaExpired"
              @error="onRecaptchaError"
            />
            <span v-if="errors['g-recaptcha-response']" class="error-message">
              {{ errors['g-recaptcha-response'][0] }}
            </span>
          </div>
        </div>

        <div class="submit-wrapper">
          <button
            type="submit"
            class="submit-button"
            :disabled="loading"
          >
            <span v-if="loading">Sending...</span>
            <span v-else>Submit Now</span>
          </button>
        </div>
      </fieldset>
    </form>
  </div>
</template>

<script>
import { VueRecaptcha } from 'vue-recaptcha'
import axios from 'axios'

export default {
  name: 'ContactForm',
  components: {
    VueRecaptcha
  },
  data() {
    return {
      form: {
        name: '',
        email: '',
        phone: '',
        subject: '',
        message: '',
        'g-recaptcha-response': ''
      },
      loading: false,
      errors: {},
      successMessage: '',
      errorMessage: '',
      recaptchaSiteKey: import.meta.env.VITE_RECAPTCHA_SITE_KEY
    }
  },
  mounted() {
    // Verify that the site key is available
    if (!this.recaptchaSiteKey) {
      console.error('reCAPTCHA site key is not configured')
    }
  },
  methods: {
    async handleSubmit() {
      if (!this.form['g-recaptcha-response']) {
        this.errorMessage = 'Please complete the reCAPTCHA verification'
        return
      }

      this.loading = true
      this.errors = {}
      this.successMessage = ''
      this.errorMessage = ''

      try {
        const response = await axios.post('/contact', this.form)
        this.successMessage = 'Your message has been sent successfully!'
        this.resetForm()
      } catch (error) {
        if (error.response?.data?.errors) {
          this.errors = error.response.data.errors
        } else {
          this.errorMessage = 'An error occurred. Please try again.'
        }
      } finally {
        this.loading = false
        this.$refs.recaptcha.reset()
      }
    },
    onRecaptchaVerified(response) {
      this.form['g-recaptcha-response'] = response
      this.errors['g-recaptcha-response'] = null
    },
    onRecaptchaExpired() {
      this.form['g-recaptcha-response'] = ''
    },
    onRecaptchaError() {
      this.errorMessage = 'reCAPTCHA error occurred. Please try again.'
    },
    resetForm() {
      this.form = {
        name: '',
        email: '',
        phone: '',
        subject: '',
        message: '',
        'g-recaptcha-response': ''
      }
    }
  }
}
</script>

<style scoped>
.form-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 20px;
}

.form-group {
  position: relative;
}

.form-group.full-width {
  grid-column: span 2;
}

.form-input {
  width: 100%;
  padding: 12px 15px;
  border: 1px solid #e0e0e0;
  border-radius: 4px;
  font-size: 16px;
  transition: border-color 0.3s;
}

.form-input:focus {
  outline: none;
  border-color: #3498db;
}

.form-input.has-error {
  border-color: #dc3545;
}

textarea.form-input {
  min-height: 120px;
  resize: vertical;
}

.error-message {
  color: #dc3545;
  font-size: 14px;
  margin-top: 5px;
  display: block;
}

.alert {
  padding: 15px;
  border-radius: 4px;
  margin-bottom: 20px;
}

.alert.success {
  background-color: #d4edda;
  color: #155724;
  border: 1px solid #c3e6cb;
}

.alert.error {
  background-color: #f8d7da;
  color: #721c24;
  border: 1px solid #f5c6cb;
}

.submit-wrapper {
  text-align: center;
  margin-top: 30px;
}

.submit-button {
  background: linear-gradient(135deg, #3498db, #2980b9);
  color: white;
  padding: 12px 30px;
  border: none;
  border-radius: 25px;
  font-size: 16px;
  cursor: pointer;
  transition: transform 0.2s, box-shadow 0.2s;
}

.submit-button:hover {
  transform: translateY(-1px);
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.submit-button:disabled {
  opacity: 0.7;
  cursor: not-allowed;
}

@media (max-width: 768px) {
  .form-grid {
    grid-template-columns: 1fr;
  }

  .form-group.full-width {
    grid-column: auto;
  }
}
</style> 