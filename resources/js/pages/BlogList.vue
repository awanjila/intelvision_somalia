<template>
  <div class="blogs-page">
    <!-- Hero Section -->
    <section class="hero-section">
      <div class="container">
        <div class="hero-content">
          <h1 class="hero-title">Our Blog</h1>
          <p class="hero-subtitle">
            Stay informed with the latest insights, trends, and expert advice on security solutions
          </p>
        </div>
      </div>
    </section>

    <!-- Blogs Grid Section -->
    <section class="blogs-grid-section">
      <div class="container">
        <!-- Loading State -->
        <div v-if="loading" class="loading-state">
          <div class="spinner"></div>
          <p>Loading articles...</p>
        </div>

        <!-- Blogs Grid -->
        <div v-else-if="paginatedBlogs.length > 0" class="blogs-grid">
          <article
            v-for="blog in paginatedBlogs"
            :key="blog.id"
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
              <a :href="`show/blog/${blog.slug}`" class="card-link">
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
            </div>
          </article>
        </div>

        <!-- Empty State -->
        <div v-else class="empty-state">
          <svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
            <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
            <polyline points="14 2 14 8 20 8"></polyline>
            <line x1="16" y1="13" x2="8" y2="13"></line>
            <line x1="16" y1="17" x2="8" y2="17"></line>
            <polyline points="10 9 9 9 8 9"></polyline>
          </svg>
          <h3>No articles found</h3>
          <p>Check back soon for new content.</p>
        </div>

        <!-- Pagination -->
        <div v-if="!loading && blogs.length > blogsPerPage" class="pagination">
          <button 
            class="pagination-btn" 
            :disabled="currentPage === 1"
            @click="goToPage(currentPage - 1)"
          >
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <polyline points="15 18 9 12 15 6"></polyline>
            </svg>
            Previous
          </button>

          <div class="pagination-numbers">
            <button
              v-for="page in visiblePages"
              :key="page"
              :class="['page-number', { active: currentPage === page }]"
              @click="goToPage(page)"
            >
              {{ page }}
            </button>
          </div>

          <button 
            class="pagination-btn" 
            :disabled="currentPage === totalPages"
            @click="goToPage(currentPage + 1)"
          >
            Next
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <polyline points="9 18 15 12 9 6"></polyline>
            </svg>
          </button>
        </div>

        <!-- Results Info -->
        <div v-if="!loading && blogs.length > 0" class="results-info">
          Showing {{ startIndex + 1 }}-{{ Math.min(endIndex, blogs.length) }} of {{ blogs.length }} articles
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'

const blogs = ref([])
const loading = ref(true)
const currentPage = ref(1)
const blogsPerPage = ref(9)

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
  
  let cleanText = stripHtmlTags(excerpt)
  cleanText = decodeHtmlEntities(cleanText)
  cleanText = cleanText.trim()
  
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

// Paginated blogs
const totalPages = computed(() => Math.ceil(blogs.value.length / blogsPerPage.value))

const startIndex = computed(() => (currentPage.value - 1) * blogsPerPage.value)
const endIndex = computed(() => currentPage.value * blogsPerPage.value)

const paginatedBlogs = computed(() => {
  return blogs.value.slice(startIndex.value, endIndex.value)
})

// Visible page numbers for pagination
const visiblePages = computed(() => {
  const pages = []
  const maxVisible = 5
  let start = Math.max(1, currentPage.value - Math.floor(maxVisible / 2))
  let end = Math.min(totalPages.value, start + maxVisible - 1)
  
  if (end - start < maxVisible - 1) {
    start = Math.max(1, end - maxVisible + 1)
  }
  
  for (let i = start; i <= end; i++) {
    pages.push(i)
  }
  
  return pages
})

const goToPage = (page) => {
  if (page >= 1 && page <= totalPages.value) {
    currentPage.value = page
    window.scrollTo({ top: 0, behavior: 'smooth' })
  }
}

onMounted(async () => {
  try {
    loading.value = true
    const res = await fetch('/api/blogs')
    blogs.value = await res.json()
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

.blogs-page {
  min-height: 100vh;
  background: #f8f9fa;
}

/* Hero Section */
.hero-section {
  background: linear-gradient(135deg, #02375f 0%, #01517a 100%);
  padding: 100px 0 80px;
  position: relative;
  overflow: hidden;
}

.hero-section::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: url('data:image/svg+xml,<svg width="100" height="100" xmlns="http://www.w3.org/2000/svg"><defs><pattern id="grid" width="40" height="40" patternUnits="userSpaceOnUse"><path d="M 40 0 L 0 0 0 40" fill="none" stroke="rgba(255,255,255,0.05)" stroke-width="1"/></pattern></defs><rect width="100" height="100" fill="url(%23grid)"/></svg>');
  opacity: 0.3;
}

.hero-content {
  text-align: center;
  position: relative;
  z-index: 1;
}

.hero-title {
  font-size: 4rem;
  font-weight: 800;
  color: #ffffff;
  margin-bottom: 20px;
  letter-spacing: -0.03em;
}

.hero-subtitle {
  font-size: 1.4rem;
  color: rgba(255, 255, 255, 0.9);
  max-width: 700px;
  margin: 0 auto;
  line-height: 1.6;
}

/* Blogs Grid Section */
.blogs-grid-section {
  padding: 80px 0 100px;
}

.container {
  max-width: 1280px;
  margin: 0 auto;
  padding: 0 40px;
}

/* Loading State */
.loading-state {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 20px;
  padding: 100px 20px;
  color: #6c757d;
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

/* Blogs Grid */
.blogs-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 32px;
  margin-bottom: 60px;
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

/* Empty State */
.empty-state {
  text-align: center;
  padding: 100px 20px;
  color: #6c757d;
}

.empty-state svg {
  margin: 0 auto 24px;
  opacity: 0.5;
}

.empty-state h3 {
  font-size: 1.8rem;
  color: #02375f;
  margin-bottom: 12px;
}

.empty-state p {
  font-size: 1.1rem;
  max-width: 500px;
  margin: 0 auto;
}

/* Pagination */
.pagination {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 16px;
  margin-bottom: 30px;
}

.pagination-btn {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 12px 24px;
  background: #ffffff;
  border: 2px solid #02375f;
  color: #02375f;
  font-size: 0.95rem;
  font-weight: 700;
  border-radius: 50px;
  cursor: pointer;
  transition: all 0.3s ease;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.pagination-btn:disabled {
  opacity: 0.3;
  cursor: not-allowed;
}

.pagination-btn:not(:disabled):hover {
  background: #02375f;
  color: #ffffff;
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(2, 55, 95, 0.2);
}

.pagination-numbers {
  display: flex;
  gap: 8px;
}

.page-number {
  width: 44px;
  height: 44px;
  display: flex;
  align-items: center;
  justify-content: center;
  border: 2px solid #e9ecef;
  background: #ffffff;
  color: #6c757d;
  font-size: 0.95rem;
  font-weight: 700;
  border-radius: 50%;
  cursor: pointer;
  transition: all 0.3s ease;
}

.page-number:hover {
  border-color: #01aeef;
  color: #01aeef;
  transform: scale(1.1);
}

.page-number.active {
  background: #02375f;
  border-color: #02375f;
  color: #ffffff;
}

/* Results Info */
.results-info {
  text-align: center;
  color: #6c757d;
  font-size: 0.95rem;
}

/* Responsive */
@media (max-width: 1200px) {
  .blogs-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 768px) {
  .hero-section {
    padding: 70px 0 60px;
  }

  .hero-title {
    font-size: 2.8rem;
  }

  .hero-subtitle {
    font-size: 1.2rem;
  }

  .blogs-grid-section {
    padding: 60px 0 80px;
  }

  .container {
    padding: 0 20px;
  }

  .blogs-grid {
    grid-template-columns: 1fr;
    gap: 24px;
    margin-bottom: 40px;
  }

  .card-title {
    min-height: auto;
    font-size: 1.3rem;
  }

  .card-excerpt {
    min-height: 60px;
  }

  .pagination {
    flex-wrap: wrap;
    gap: 12px;
  }

  .pagination-btn {
    padding: 10px 20px;
    font-size: 0.9rem;
  }

  .page-number {
    width: 40px;
    height: 40px;
  }
}

@media (max-width: 480px) {
  .hero-title {
    font-size: 2.2rem;
  }

  .hero-subtitle {
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

  .pagination-numbers {
    gap: 6px;
  }

  .page-number {
    width: 36px;
    height: 36px;
    font-size: 0.85rem;
  }
}
</style>