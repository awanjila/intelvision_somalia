<template>
  <section class="blog-section">
    <div class="container">
      <div class="section-header">
        <h2 class="section-title">Insights & Updates</h2>
        <p class="section-subtitle">
          Expert knowledge and industry trends to keep you informed and secure
        </p>
      </div>

      <div class="carousel-wrapper">
        <div v-if="loading" class="loading-state">
          <div class="spinner"></div>
          <p>Loading articles...</p>
        </div>
        
        <transition-group v-else name="slide-fade" tag="div" class="carousel-track">
          <div
            v-for="(batch, batchIndex) in batches"
            :key="batchIndex"
            v-show="currentBatch === batchIndex"
            class="blog-batch"
          >
            <article
              v-for="(blog, index) in batch"
              :key="`${batchIndex}-${index}`"
              class="blog-card"
            >
              <div class="card-image-wrapper">
                <img 
                  :src="blog.image || '/images/blog/default.jpg'" 
                  :alt="blog.name" 
                  class="card-image" 
                />
                <div class="card-overlay"></div>
                <div v-if="blog.category" class="card-category">{{ blog.category.name }}</div>
              </div>
              <div class="card-content">
                <div class="card-meta">
                  <span class="meta-date">
                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                      <circle cx="12" cy="12" r="10"></circle>
                      <polyline points="12 6 12 12 16 14"></polyline>
                    </svg>
                    {{ formatDate(blog.created_at) }}
                  </span>
                  <span v-if="blog.read_time" class="meta-read-time">{{ blog.read_time }}</span>
                </div>
                <h3 class="card-title">{{ blog.name }}</h3>
                <p class="card-excerpt">{{ truncateExcerpt(blog.meta_description) }}</p>
                <a 
                  v-if="blog.slug" 
                  :href="`/show/blog/${blog.slug}`" 
                  class="card-link"
                >
                  Read Article
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
                    <line x1="5" y1="12" x2="19" y2="12"></line>
                    <polyline points="12 5 19 12 12 19"></polyline>
                  </svg>
                </a>
                <span v-else class="card-link disabled">
                  No Link Available
                </span>
              </div>
            </article>
          </div>
        </transition-group>

        <!-- Navigation Arrows -->
        <button 
          v-if="batches.length > 1"
          class="carousel-nav prev" 
          @click="prevBatch" 
          :disabled="currentBatch === 0"
          aria-label="Previous"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
          >
            <polyline points="15 18 9 12 15 6"></polyline>
          </svg>
        </button>

        <button 
          v-if="batches.length > 1"
          class="carousel-nav next" 
          @click="nextBatch"
          :disabled="currentBatch === batches.length - 1"
          aria-label="Next"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
          >
            <polyline points="9 18 15 12 9 6"></polyline>
          </svg>
        </button>

        <!-- Dots Indicator -->
        <div v-if="batches.length > 1" class="carousel-dots">
          <button
            v-for="(batch, index) in batches"
            :key="`dot-${index}`"
            :class="['dot', { active: currentBatch === index }]"
            @click="goToBatch(index)"
            :aria-label="`Go to batch ${index + 1}`"
          ></button>
        </div>
      </div>

      <div class="section-footer">
        <a href="/blogs" class="view-all-link">
          View All Articles
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <line x1="5" y1="12" x2="19" y2="12"></line>
            <polyline points="9 18 15 12 9 6"></polyline>
          </svg>
        </a>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue'

const currentBatch = ref(0)
const blogs = ref([])
const loading = ref(true)

// Helper function to decode HTML entities
const decodeHtmlEntities = (text) => {
  if (!text) return ''
  const textarea = document.createElement('textarea')
  textarea.innerHTML = text
  return textarea.value
}

// Helper function to strip HTML tags
const stripHtmlTags = (html) => {
  if (!html) return ''
  const div = document.createElement('div')
  div.innerHTML = html
  return div.textContent || div.innerText || ''
}

// Truncate excerpt to uniform length
const truncateExcerpt = (excerpt) => {
  if (!excerpt) return ''
  
  // Decode HTML entities and strip tags
  let cleanText = stripHtmlTags(excerpt)
  cleanText = decodeHtmlEntities(cleanText)
  
  // Trim whitespace
  cleanText = cleanText.trim()
  
  // Truncate to 140 characters
  const maxLength = 140
  if (cleanText.length > maxLength) {
    return cleanText.substring(0, maxLength).trim() + '...'
  }
  
  return cleanText
}

// Format date
const formatDate = (date) => {
  if (!date) return 'Recent'
  const d = new Date(date)
  return d.toLocaleDateString('en-US', { year: 'numeric', month: 'short', day: 'numeric' })
}

const batches = computed(() => {
  const batchSize = 3
  const result = []
  for (let i = 0; i < blogs.value.length; i += batchSize) {
    result.push(blogs.value.slice(i, i + batchSize))
  }
  return result
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

const goToBatch = (index) => {
  currentBatch.value = index
}

onMounted(async () => {
  try {
    loading.value = true
    const res = await fetch('/api/blogs')
    const data = await res.json()
    
    // Debug: Log blogs with missing slugs
    const missingSlug = data.filter(blog => !blog.slug)
    if (missingSlug.length > 0) {
      console.warn('Blogs missing slugs:', missingSlug)
    }
    
    blogs.value = data
  } catch (error) {
    console.error('Error fetching blogs:', error)
    blogs.value = []
  } finally {
    loading.value = false
  }
})
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.blog-section {
  padding: 50px 0 30px 0;
  background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
  position: relative;
}

.blog-section::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 1px;
  background: linear-gradient(90deg, transparent, #02375f, transparent);
}

.container {
  max-width: 1280px;
  margin: 0 auto;
  padding: 0 40px;
}

.section-header {
  text-align: center;
  margin-bottom: 70px;
}

.section-title {
  font-size: 3.2rem;
  font-weight: 800;
  color: #02375f;
  margin-bottom: 20px;
  letter-spacing: -0.03em;
  position: relative;
  display: inline-block;
}

.section-title::after {
  content: '';
  position: absolute;
  bottom: -12px;
  left: 50%;
  transform: translateX(-50%);
  width: 100px;
  height: 5px;
  background: linear-gradient(90deg, #02375f, #01517a);
  border-radius: 3px;
}

.section-subtitle {
  font-size: 1.3rem;
  color: #6c757d;
  max-width: 650px;
  margin: 0 auto;
  line-height: 1.6;
}

.carousel-wrapper {
  position: relative;
  width: 100%;
  min-height: 580px;
}

.loading-state {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 20px;
  padding: 80px 20px;
  color: #6c757d;
  min-height: 580px;
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

.blog-batch {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 32px;
  width: 100%;
}

.blog-card {
  background: #ffffff;
  border-radius: 20px;
  overflow: hidden;
  transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
  border: 1px solid #e9ecef;
  box-shadow: 0 4px 16px rgba(2, 55, 95, 0.06);
  display: flex;
  flex-direction: column;
  height: 100%;
}

.blog-card:hover {
  transform: translateY(-12px);
  box-shadow: 0 20px 48px rgba(2, 55, 95, 0.15);
  border-color: #02375f;
}

.card-image-wrapper {
  position: relative;
  width: 100%;
  height: 260px;
  overflow: hidden;
  background: linear-gradient(135deg, #02375f 0%, #01517a 100%);
}

.card-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.7s cubic-bezier(0.25, 0.46, 0.45, 0.94);
}

.blog-card:hover .card-image {
  transform: scale(1.1);
}

.card-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(180deg, transparent 0%, rgba(2, 55, 95, 0.6) 100%);
  transition: background 0.4s ease;
}

.blog-card:hover .card-overlay {
  background: linear-gradient(180deg, rgba(2, 55, 95, 0.1) 0%, rgba(2, 55, 95, 0.5) 100%);
}

.card-category {
  position: absolute;
  top: 20px;
  left: 20px;
  background: rgba(1, 174, 239, 0.95);
  color: #ffffff;
  padding: 8px 16px;
  border-radius: 20px;
  font-size: 0.8rem;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  z-index: 2;
  backdrop-filter: blur(10px);
}

.card-content {
  padding: 28px;
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 14px;
}

.card-meta {
  display: flex;
  align-items: center;
  gap: 16px;
  font-size: 0.85rem;
  color: #6c757d;
}

.meta-date {
  display: flex;
  align-items: center;
  gap: 6px;
}

.meta-date svg {
  opacity: 0.7;
}

.meta-read-time {
  display: flex;
  align-items: center;
}

.meta-read-time::before {
  content: '•';
  margin-right: 8px;
  color: #cbd5e0;
}

.card-title {
  font-size: 1.4rem;
  font-weight: 700;
  color: #02375f;
  line-height: 1.4;
  min-height: 70px;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.card-excerpt {
  font-size: 0.98rem;
  color: #6c757d;
  line-height: 1.7;
  flex: 1;
  min-height: 85px;
  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.card-link {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  color: #02375f;
  text-decoration: none;
  font-size: 0.95rem;
  font-weight: 700;
  transition: all 0.3s ease;
  align-self: flex-start;
  padding: 8px 0;
  margin-top: 4px;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.card-link svg {
  transition: transform 0.3s ease;
}

.card-link:hover {
  color: #01aeef;
  gap: 12px;
}

.card-link:hover svg {
  transform: translateX(6px);
}

.card-link.disabled {
  opacity: 0.5;
  cursor: not-allowed;
  pointer-events: none;
}

/* Navigation Arrows */
.carousel-nav {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  background: #ffffff;
  border: 2px solid #02375f;
  width: 56px;
  height: 56px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  z-index: 10;
  transition: all 0.3s ease;
  box-shadow: 0 4px 12px rgba(2, 55, 95, 0.15);
}

.carousel-nav:disabled {
  opacity: 0.3;
  cursor: not-allowed;
  box-shadow: none;
}

.carousel-nav:not(:disabled):hover {
  background: #02375f;
  transform: translateY(-50%) scale(1.15);
  box-shadow: 0 6px 20px rgba(2, 55, 95, 0.25);
}

.carousel-nav svg {
  color: #02375f;
  transition: color 0.3s ease;
}

.carousel-nav:not(:disabled):hover svg {
  color: #ffffff;
}

.carousel-nav.prev {
  left: -28px;
}

.carousel-nav.next {
  right: -28px;
}

/* Dots */
.carousel-dots {
  display: flex;
  gap: 14px;
  justify-content: center;
  margin-top: 50px;
}

.dot {
  width: 14px;
  height: 14px;
  background: #cbd5e0;
  border: none;
  border-radius: 7px;
  cursor: pointer;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  padding: 0;
}

.dot.active {
  background: #02375f;
  width: 42px;
  box-shadow: 0 2px 8px rgba(2, 55, 95, 0.3);
}

.dot:not(.active):hover {
  background: #01aeef;
  transform: scale(1.2);
}

/* Section Footer */
.section-footer {
  text-align: center;
  margin-top: 60px;
}

.view-all-link {
  display: inline-flex;
  align-items: center;
  gap: 10px;
  background: linear-gradient(135deg, #02375f 0%, #01517a 100%);
  color: #ffffff;
  text-decoration: none;
  padding: 16px 36px;
  border-radius: 50px;
  font-size: 1rem;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.8px;
  transition: all 0.4s ease;
  box-shadow: 0 6px 20px rgba(2, 55, 95, 0.2);
}

.view-all-link svg {
  transition: transform 0.3s ease;
}

.view-all-link:hover {
  transform: translateY(-3px);
  box-shadow: 0 10px 30px rgba(2, 55, 95, 0.3);
  gap: 14px;
}

.view-all-link:hover svg {
  transform: translateX(4px);
}

/* Transitions */
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

/* Responsive */
@media (max-width: 1200px) {
  .blog-batch {
    grid-template-columns: repeat(2, 1fr);
    gap: 28px;
  }
}

@media (max-width: 900px) {
  .section-title {
    font-size: 2.8rem;
  }

  .carousel-nav.prev {
    left: -20px;
  }

  .carousel-nav.next {
    right: -20px;
  }
}

@media (max-width: 768px) {
  .blog-section {
    padding: 40px 0 25px 0;
  }

  .container {
    padding: 0 20px;
  }

  .section-header {
    margin-bottom: 50px;
  }

  .section-title {
    font-size: 2.2rem;
  }

  .section-subtitle {
    font-size: 1.1rem;
  }

  .carousel-wrapper {
    min-height: auto;
  }

  .blog-batch {
    grid-template-columns: 1fr;
    gap: 24px;
  }

  .card-image-wrapper {
    height: 220px;
  }

  .card-title {
    min-height: auto;
    font-size: 1.3rem;
  }

  .card-excerpt {
    min-height: 60px;
  }

  .carousel-nav {
    width: 48px;
    height: 48px;
  }

  .carousel-nav.prev {
    left: 0;
  }

  .carousel-nav.next {
    right: 0;
  }

  .carousel-dots {
    margin-top: 40px;
  }

  .dot {
    width: 12px;
    height: 12px;
  }

  .dot.active {
    width: 36px;
  }

  .section-footer {
    margin-top: 50px;
  }

  .view-all-link {
    padding: 14px 32px;
    font-size: 0.95rem;
  }
}

@media (max-width: 480px) {
  .section-title {
    font-size: 1.9rem;
  }

  .section-subtitle {
    font-size: 1rem;
  }

  .card-content {
    padding: 24px;
  }

  .card-title {
    font-size: 1.2rem;
  }

  .card-excerpt {
    font-size: 0.92rem;
  }

  .card-link {
    font-size: 0.9rem;
  }

  .view-all-link {
    padding: 12px 28px;
    font-size: 0.9rem;
  }
}
</style>