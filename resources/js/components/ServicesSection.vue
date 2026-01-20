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

        <transition-group
          v-else
          name="slide-fade"
          tag="div"
          class="carousel-track"
        >
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
                <img
                  :src="service.image || '/images/services/default.jpg'"
                  :alt="service.title || service.name"
                  class="card-image"
                />
              </div>

              <div class="card-content">
                <h3 class="card-title">
                  {{ service.title || service.name }}
                </h3>

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
          @click="prevBatch"
          :disabled="currentBatch === 0"
        >
          ‹
        </button>

        <button
          class="carousel-nav next"
          @click="nextBatch"
          :disabled="currentBatch === batches.length - 1"
        >
          ›
        </button>

        <!-- Dots -->
        <div class="carousel-dots">
          <button
            v-for="(_, index) in batches"
            :key="index"
            :class="['dot', { active: currentBatch === index }]"
            @click="goToBatch(index)"
          />
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
    const currentBatch = ref(0)
    const services = ref([])
    const loading = ref(true)

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

    const batches = computed(() => {
      const size = 3
      const out = []
      for (let i = 0; i < services.value.length; i += size) {
        out.push(services.value.slice(i, i + size))
      }
      return out
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

    const goToBatch = (i) => (currentBatch.value = i)

    onMounted(fetchServices)

    return {
      loading,
      currentBatch,
      batches,
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
  padding: 90px 0;
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
  font-size: 3rem;
  font-weight: 800;
  color: #02375f;
}

.section-subtitle {
  max-width: 620px;
  margin: 16px auto 0;
  color: #6c757d;
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
  transition: transform 0.3s ease;
}

.service-card:hover {
  transform: translateY(-6px);
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
}

.dot.active {
  background: #01aeef;
  width: 36px;
  border-radius: 12px;
}

@media (max-width: 900px) {
  .services-batch {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 600px) {
  .services-batch {
    grid-template-columns: 1fr;
  }
}
</style>
