<template>
  <section class="services-section">
    <div class="container">
      <div class="section-header">
        <h2 class="section-title">What We Do</h2>
        <p class="section-subtitle">
          Comprehensive security solutions powered by modern technology
        </p>
      </div>

      <div v-if="loading" class="loading-state">
        <div class="spinner"></div>
        <p>Loading services...</p>
      </div>

      <div
        v-else
        v-for="cat in serviceCategories"
        :key="cat.key"
        class="category-block"
      >
        <div class="category-header">
          <h3 class="category-title">{{ cat.label }}</h3>
        </div>

        <div class="carousel-wrapper">
          <transition-group
            name="slide-fade"
            tag="div"
            class="carousel-track"
          >
            <div
              v-for="(batch, batchIndex) in cat.batches"
              :key="batchIndex"
              v-show="cat.currentBatch === batchIndex"
              class="services-batch"
            >
              <div
                v-for="(service, index) in batch"
                :key="`${cat.key}-${batchIndex}-${index}`"
                class="service-card"
              >
                <div class="card-image-wrapper">
                  <img
                    :src="service.image || '/images/services/default.jpg'"
                    :alt="service.title || service.name"
                    class="card-image"
                  />
                </div>

                <div class="card-content">
                  <h4 class="card-title">
                    {{ service.title || service.name }}
                  </h4>

                  <p
                    class="card-description"
                    v-html="truncateDescription(service.description)"
                  ></p>

                  <a
                    :href="`/show/product/${service.slug}`"
                    class="card-link"
                  >
                    Learn More
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
                      <line x1="5" y1="12" x2="19" y2="12" />
                      <polyline points="12 5 19 12 12 19" />
                    </svg>
                  </a>
                </div>
              </div>
            </div>
          </transition-group>

          <!-- Navigation -->
          <button
            class="carousel-nav prev"
            @click="prevBatch(cat)"
            :disabled="cat.currentBatch === 0"
          >
            ‹
          </button>

          <button
            class="carousel-nav next"
            @click="nextBatch(cat)"
            :disabled="cat.currentBatch === cat.batches.length - 1"
          >
            ›
          </button>

          <!-- Dots -->
          <div class="carousel-dots">
            <button
              v-for="(_, index) in cat.batches"
              :key="index"
              :class="['dot', { active: cat.currentBatch === index }]"
              @click="goToBatch(cat, index)"
            />
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import { ref, computed, onMounted } from 'vue'
import axios from 'axios'

export default {
  name: 'ServicesCarousel',
  setup() {
    const services = ref([])
    const loading = ref(true)

    const categories = [
      { key: 'security', label: 'Security Systems', match: 'Security Systems' },
      { key: 'gold', label: 'Gold Detectors', match: 'Gold Detectors' }
    ]

    const truncateDescription = (html) => {
      if (!html) return ''
      const div = document.createElement('div')
      div.innerHTML = html
      const text = div.textContent || ''
      return text.length > 120 ? text.slice(0, 120) + '…' : text
    }

    const fetchServices = async () => {
      try {
        const { data } = await axios.get('/api/services')
        services.value = data
      } catch {
        services.value = []
      } finally {
        loading.value = false
      }
    }

    const makeBatches = (list) => {
      const size = 3
      const out = []
      for (let i = 0; i < list.length; i += size) {
        out.push(list.slice(i, i + size))
      }
      return out
    }

    const serviceCategories = computed(() => {
      return categories
        .map((cat) => {
          const items = services.value.filter(
            (s) => (s.category || '').toLowerCase() === cat.match.toLowerCase()
          )
          return {
            ...cat,
            currentBatch: 0,
            batches: makeBatches(items)
          }
        })
        .filter((cat) => cat.batches.length)
    })

    const nextBatch = (cat) => {
      if (cat.currentBatch < cat.batches.length - 1) {
        cat.currentBatch++
      }
    }

    const prevBatch = (cat) => {
      if (cat.currentBatch > 0) {
        cat.currentBatch--
      }
    }

    const goToBatch = (cat, i) => (cat.currentBatch = i)

    onMounted(fetchServices)

    return {
      loading,
      serviceCategories,
      nextBatch,
      prevBatch,
      goToBatch,
      truncateDescription
    }
  }
}
</script>

<style scoped>
.services-section {
  padding: 50px 0 30px 0;
  background: #f8f9fa;
}

.container {
  max-width: 1280px;
  padding: 0 32px;
  margin: auto;
}

.section-header {
  text-align: center;
  margin-bottom: 64px;
}

.section-title {
  font-size: 2.75rem;
  font-weight: 800;
  color: #02375f;
  margin-bottom: 20px;
  letter-spacing: -0.02em;
  position: relative;
  display: inline-block;
}

.section-subtitle {
  max-width: 620px;
  margin: 16px auto 0;
  color: #6c757d;
  font-size: 1.1rem;
  line-height: 1.6;
}

.category-block {
  margin-bottom: 60px;
}

.category-block:last-child {
  margin-bottom: 0;
}

.category-header {
  text-align: center;
  margin-bottom: 40px;
}

.category-title {
  font-size: 2rem;
  font-weight: 800;
  color: #02375f;
  letter-spacing: -0.02em;
  display: inline-block;
  position: relative;
  padding-bottom: 12px;
}

.category-title::after {
  content: '';
  position: absolute;
  left: 0;
  right: 0;
  bottom: 0;
  height: 4px;
  background: #01aeef;
  border-radius: 2px;
}

.carousel-wrapper {
  position: relative;
  width: 100%;
}

.loading-state {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 20px;
  padding: 60px 20px;
  color: #6c757d;
  min-height: 400px;
}

.spinner {
  width: 48px;
  height: 48px;
  border: 5px solid #f0f0f0;
  border-top-color: #02375f;
  border-radius: 50%;
  animation: spin 0.8s linear infinite;
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
  grid-template-columns: repeat(3, 1fr);
  gap: 32px;
}

.service-card {
  background: #fff;
  border-radius: 16px;
  overflow: hidden;
  display: flex;
  flex-direction: column;
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.06);
  transition: all 0.3s ease;
  border: 1px solid transparent;
}

.service-card:hover {
  transform: translateY(-6px);
  box-shadow: 0 12px 32px rgba(0, 0, 0, 0.12);
  border-color: #01aeef;
}

.card-image-wrapper {
  width: 100%;
  aspect-ratio: 16 / 9;
  background: #02375f;
  display: flex;
  align-items: center;
  justify-content: center;
}

.card-image {
  width: 100%;
  height: 100%;
  object-fit: contain;
}

.card-content {
  padding: 24px;
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.card-title {
  font-size: 1.3rem;
  font-weight: 700;
  color: #02375f;
}

.card-description {
  color: #6c757d;
  font-size: 0.95rem;
  line-height: 1.6;
  flex: 1;
}

.card-link {
  margin-top: auto;
  font-weight: 700;
  color: #01aeef;
  text-decoration: none;
  display: inline-flex;
  align-items: center;
  gap: 6px;
  transition: all 0.3s ease;
  padding: 4px 0;
}

.card-link:hover {
  color: #0284c7;
  gap: 10px;
}

.card-link svg {
  transition: transform 0.3s ease;
}

.card-link:hover svg {
  transform: translateX(4px);
}

.carousel-nav {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  background: #02375f;
  color: #fff;
  border: none;
  width: 48px;
  height: 48px;
  border-radius: 50%;
  cursor: pointer;
  z-index: 10;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 24px;
  transition: all 0.3s ease;
  box-shadow: 0 4px 12px rgba(2, 55, 95, 0.2);
}

.carousel-nav:hover:not(:disabled) {
  background: #01aeef;
  transform: translateY(-50%) scale(1.1);
  box-shadow: 0 6px 16px rgba(1, 174, 239, 0.3);
}

.carousel-nav:disabled {
  opacity: 0.3;
  cursor: not-allowed;
}

.carousel-nav.prev { left: -20px }
.carousel-nav.next { right: -20px }

.carousel-dots {
  display: flex;
  justify-content: center;
  gap: 10px;
  margin-top: 40px;
}

.dot {
  width: 12px;
  height: 12px;
  background: #cbd5e0;
  border-radius: 50%;
  border: none;
  cursor: pointer;
  transition: all 0.3s ease;
  padding: 0;
}

.dot:hover:not(.active) {
  background: #01aeef;
  transform: scale(1.2);
}

.dot.active {
  background: #01aeef;
  width: 36px;
  border-radius: 12px;
}

/* Slide transitions */
.slide-fade-enter-active {
  transition: all 0.5s ease;
}

.slide-fade-leave-active {
  transition: all 0.3s ease;
  position: absolute;
}

.slide-fade-enter-from {
  opacity: 0;
  transform: translateX(30px);
}

.slide-fade-leave-to {
  opacity: 0;
  transform: translateX(-30px);
}

/* Responsive Design */
@media (max-width: 1024px) {
  .container {
    padding: 0 24px;
  }

  .section-header {
    margin-bottom: 50px;
  }

  .section-title {
    font-size: 2.5rem;
  }

  .services-batch {
    gap: 24px;
  }
}

@media (max-width: 900px) {
  .services-batch {
    grid-template-columns: repeat(2, 1fr);
    gap: 24px;
  }

  .carousel-nav.prev {
    left: -10px;
  }

  .carousel-nav.next {
    right: -10px;
  }
}

@media (max-width: 768px) {
  .services-section {
    padding: 40px 0 25px 0;
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
    margin-top: 12px;
  }

  .category-block {
    margin-bottom: 44px;
  }

  .category-header {
    margin-bottom: 28px;
  }

  .category-title {
    font-size: 1.5rem;
  }

  .services-batch {
    grid-template-columns: 1fr;
    gap: 20px;
  }

  .service-card {
    border-radius: 12px;
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

  .carousel-nav {
    width: 40px;
    height: 40px;
    font-size: 20px;
  }

  .carousel-nav.prev {
    left: 0;
  }

  .carousel-nav.next {
    right: 0;
  }

  .carousel-dots {
    margin-top: 30px;
    gap: 8px;
  }

  .dot {
    width: 10px;
    height: 10px;
  }

  .dot.active {
    width: 28px;
  }

  .loading-state {
    min-height: 300px;
    padding: 40px 20px;
  }
}

@media (max-width: 480px) {
  .section-title {
    font-size: 1.75rem;
  }

  .section-subtitle {
    font-size: 0.95rem;
  }

  .card-content {
    padding: 18px;
    gap: 10px;
  }

  .card-title {
    font-size: 1.1rem;
  }

  .card-description {
    font-size: 0.875rem;
  }

  .card-link {
    font-size: 0.9rem;
  }
}
</style>
