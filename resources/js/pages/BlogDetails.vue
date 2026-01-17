<template>
  <div class="blog-detail-page">
    <!-- Loading State -->
    <div v-if="loading" class="loading-container">
      <div class="spinner"></div>
      <p>Loading article...</p>
    </div>

    <!-- Blog Content -->
    <div v-else-if="blog" class="blog-container">
      <div class="container">
        <div class="blog-layout">
          <!-- Main Content -->
          <article class="blog-main">
            <!-- Breadcrumb -->
            <nav class="breadcrumb">
              <a href="/">Home</a>
              <span class="separator">/</span>
              <a href="/blogs">Blog</a>
              <span class="separator">/</span>
              <span class="current">{{ blog.name }}</span>
            </nav>

            <!-- Category Badge -->
            <div v-if="blog.category" class="category-badge">
              {{ blog.category.name }}
            </div>

            <!-- Title -->
            <h1 class="blog-title">{{ blog.name }}</h1>

            <!-- Meta Information -->
            <div class="blog-meta">
              <div class="meta-item">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <circle cx="12" cy="12" r="10"></circle>
                  <polyline points="12 6 12 12 16 14"></polyline>
                </svg>
                <span>{{ formatDate(blog.created_at) }}</span>
              </div>
              <div v-if="blog.author" class="meta-item">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                  <circle cx="12" cy="7" r="4"></circle>
                </svg>
                <span>{{ blog.author }}</span>
              </div>
            </div>

            <!-- Featured Image -->
            <div v-if="blog.image" class="featured-image">
              <img :src="blog.image" :alt="blog.name" />
            </div>

            <!-- Blog Content -->
            <div class="blog-content" v-html="blog.description"></div>

            <!-- Tags -->
            <div v-if="blog.category" class="blog-tags">
              <h4>Category:</h4>
              <div class="tags-list">
                <span class="tag">
                  {{ blog.category.name }}
                </span>
              </div>
            </div>

            <!-- Share Section -->
            <div class="share-section">
              <h4>Share this article:</h4>
              <div class="share-buttons">
                <button class="share-btn twitter" @click="shareOnTwitter">
                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="currentColor">
                    <path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/>
                  </svg>
                </button>
                <button class="share-btn facebook" @click="shareOnFacebook">
                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="currentColor">
                    <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/>
                  </svg>
                </button>
                <button class="share-btn linkedin" @click="shareOnLinkedIn">
                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="currentColor">
                    <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/>
                  </svg>
                </button>
                <button class="share-btn copy" @click="copyLink">
                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"></path>
                    <path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"></path>
                  </svg>
                </button>
              </div>
              <span v-if="linkCopied" class="copy-message">Link copied!</span>
            </div>
          </article>

          <!-- Sidebar -->
          <aside class="blog-sidebar">
            <!-- Recent Posts -->
            <div class="sidebar-widget">
              <h3 class="widget-title">Recent Articles</h3>
              
              <div v-if="loadingRecent" class="widget-loading">
                <div class="mini-spinner"></div>
              </div>
              
              <div v-else-if="recentPosts.length > 0" class="recent-posts">
                <a 
                  v-for="post in recentPosts" 
                  :key="post.id"
                  :href="`/blog/${post.slug}`"
                  class="recent-post-item"
                >
                  <div class="recent-post-image">
                    <img :src="post.image || '/images/blog/default.jpg'" :alt="post.name" />
                  </div>
                  <div class="recent-post-content">
                    <h4 class="recent-post-title">{{ post.name }}</h4>
                    <span class="recent-post-date">{{ formatDate(post.created_at) }}</span>
                  </div>
                </a>
              </div>
            </div>

            <!-- Categories Widget -->
            <div v-if="categories.length > 0" class="sidebar-widget">
              <h3 class="widget-title">Categories</h3>
              
              <div v-if="loadingCategories" class="widget-loading">
                <div class="mini-spinner"></div>
              </div>
              
              <div v-else class="categories-list">
                <a 
                  v-for="category in categories" 
                  :key="category.id"
                  :href="`/blogs?category=${category.slug}`"
                  class="category-item"
                >
                  {{ category.name }}
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <polyline points="9 18 15 12 9 6"></polyline>
                  </svg>
                </a>
              </div>
            </div>
          </aside>
        </div>
      </div>
    </div>

    <!-- Error State -->
    <div v-else class="error-state">
      <svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
        <circle cx="12" cy="12" r="10"></circle>
        <line x1="12" y1="8" x2="12" y2="12"></line>
        <line x1="12" y1="16" x2="12.01" y2="16"></line>
      </svg>
      <h2>Article Not Found</h2>
      <p>The article you're looking for doesn't exist or has been removed.</p>
      <a href="/blogs" class="back-link">Back to All Articles</a>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'

// Accept slug as a prop
const props = defineProps({
  slug: {
    type: String,
    required: true
  }
})

const blog = ref(null)
const recentPosts = ref([])
const categories = ref([])
const loading = ref(true)
const loadingRecent = ref(true)
const loadingCategories = ref(true)
const linkCopied = ref(false)

// Format date
const formatDate = (date) => {
  if (!date) return 'Recent'
  const d = new Date(date)
  return d.toLocaleDateString('en-US', { year: 'numeric', month: 'long', day: 'numeric' })
}

// Share functions
const shareOnTwitter = () => {
  const url = window.location.href
  const text = blog.value.name
  window.open(`https://twitter.com/intent/tweet?url=${encodeURIComponent(url)}&text=${encodeURIComponent(text)}`, '_blank')
}

const shareOnFacebook = () => {
  const url = window.location.href
  window.open(`https://www.facebook.com/sharer/sharer.php?u=${encodeURIComponent(url)}`, '_blank')
}

const shareOnLinkedIn = () => {
  const url = window.location.href
  window.open(`https://www.linkedin.com/sharing/share-offsite/?url=${encodeURIComponent(url)}`, '_blank')
}

const copyLink = async () => {
  try {
    await navigator.clipboard.writeText(window.location.href)
    linkCopied.value = true
    setTimeout(() => {
      linkCopied.value = false
    }, 2000)
  } catch (err) {
    console.error('Failed to copy link:', err)
  }
}

// Fetch blog post
const fetchBlog = async () => {
  try {
    loading.value = true
    const res = await fetch(`/api/blog/${props.slug}`)
    if (res.ok) {
      blog.value = await res.json()
    } else {
      blog.value = null
    }
  } catch (error) {
    console.error('Error fetching blog:', error)
    blog.value = null
  } finally {
    loading.value = false
  }
}

// Fetch recent posts
const fetchRecentPosts = async () => {
  try {
    loadingRecent.value = true
    const res = await fetch('/api/blog?limit=5')
    const data = await res.json()
    // Filter out current post
    recentPosts.value = data.filter(post => post.slug !== props.slug).slice(0, 4)
  } catch (error) {
    console.error('Error fetching recent posts:', error)
    recentPosts.value = []
  } finally {
    loadingRecent.value = false
  }
}

// Fetch categories
const fetchCategories = async () => {
  try {
    loadingCategories.value = true
    const res = await fetch('/api/blog-categories')
    if (res.ok) {
      categories.value = await res.json()
    }
  } catch (error) {
    console.error('Error fetching categories:', error)
    categories.value = []
  } finally {
    loadingCategories.value = false
  }
}

onMounted(() => {
  fetchBlog()
  fetchRecentPosts()
  fetchCategories()
})
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.blog-detail-page {
  min-height: 100vh;
  background: #f8f9fa;
}

/* Loading State */
.loading-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  gap: 20px;
  color: #6c757d;
}

.spinner {
  width: 56px;
  height: 56px;
  border: 6px solid #f0f0f0;
  border-top-color: #02375f;
  border-radius: 50%;
  animation: spin 0.8s linear infinite;
}

.mini-spinner {
  width: 32px;
  height: 32px;
  border: 4px solid #f0f0f0;
  border-top-color: #02375f;
  border-radius: 50%;
  animation: spin 0.8s linear infinite;
  margin: 20px auto;
}

@keyframes spin {
  to { transform: rotate(360deg); }
}

/* Blog Container */
.blog-container {
  padding: 60px 0 100px;
}

.container {
  max-width: 1280px;
  margin: 0 auto;
  padding: 0 40px;
}

.blog-layout {
  display: grid;
  grid-template-columns: 1fr 350px;
  gap: 60px;
  align-items: start;
}

/* Main Content */
.blog-main {
  background: #ffffff;
  border-radius: 20px;
  padding: 50px;
  box-shadow: 0 4px 20px rgba(2, 55, 95, 0.08);
}

/* Breadcrumb */
.breadcrumb {
  display: flex;
  align-items: center;
  gap: 12px;
  margin-bottom: 30px;
  font-size: 0.9rem;
  color: #6c757d;
}

.breadcrumb a {
  color: #02375f;
  text-decoration: none;
  transition: color 0.3s ease;
}

.breadcrumb a:hover {
  color: #01aeef;
}

.breadcrumb .separator {
  color: #cbd5e0;
}

.breadcrumb .current {
  color: #6c757d;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  max-width: 300px;
}

/* Category Badge */
.category-badge {
  display: inline-block;
  background: linear-gradient(135deg, #01aeef 0%, #0398d4 100%);
  color: #ffffff;
  padding: 8px 20px;
  border-radius: 20px;
  font-size: 0.85rem;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  margin-bottom: 24px;
}

/* Title */
.blog-title {
  font-size: 3rem;
  font-weight: 800;
  color: #02375f;
  line-height: 1.2;
  margin-bottom: 24px;
  letter-spacing: -0.02em;
}

/* Meta */
.blog-meta {
  display: flex;
  flex-wrap: wrap;
  gap: 24px;
  margin-bottom: 40px;
  padding-bottom: 30px;
  border-bottom: 2px solid #e9ecef;
}

.meta-item {
  display: flex;
  align-items: center;
  gap: 8px;
  color: #6c757d;
  font-size: 0.95rem;
}

.meta-item svg {
  color: #01aeef;
}

/* Featured Image */
.featured-image {
  width: 100%;
  height: 500px;
  border-radius: 16px;
  overflow: hidden;
  margin-bottom: 40px;
  box-shadow: 0 8px 24px rgba(2, 55, 95, 0.1);
}

.featured-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

/* Blog Content */
.blog-content {
  font-size: 1.1rem;
  line-height: 1.8;
  color: #333;
  margin-bottom: 50px;
}

.blog-content :deep(h2) {
  font-size: 2rem;
  font-weight: 700;
  color: #02375f;
  margin: 40px 0 20px;
}

.blog-content :deep(h3) {
  font-size: 1.5rem;
  font-weight: 700;
  color: #02375f;
  margin: 30px 0 15px;
}

.blog-content :deep(p) {
  margin-bottom: 20px;
}

.blog-content :deep(ul),
.blog-content :deep(ol) {
  margin: 20px 0 20px 30px;
}

.blog-content :deep(li) {
  margin-bottom: 10px;
}

.blog-content :deep(a) {
  color: #01aeef;
  text-decoration: underline;
}

.blog-content :deep(img) {
  max-width: 100%;
  height: auto;
  border-radius: 12px;
  margin: 30px 0;
}

.blog-content :deep(blockquote) {
  border-left: 4px solid #01aeef;
  padding: 20px 30px;
  margin: 30px 0;
  background: #f8f9fa;
  font-style: italic;
  border-radius: 8px;
}

/* Tags */
.blog-tags {
  margin-bottom: 40px;
  padding: 30px;
  background: #f8f9fa;
  border-radius: 12px;
}

.blog-tags h4 {
  font-size: 1.1rem;
  color: #02375f;
  margin-bottom: 15px;
}

.tags-list {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
}

.tag {
  background: #ffffff;
  color: #02375f;
  padding: 8px 16px;
  border-radius: 20px;
  font-size: 0.9rem;
  font-weight: 600;
  border: 2px solid #e9ecef;
  transition: all 0.3s ease;
}

.tag:hover {
  border-color: #01aeef;
  color: #01aeef;
}

/* Share Section */
.share-section {
  padding: 30px;
  background: #f8f9fa;
  border-radius: 12px;
  position: relative;
}

.share-section h4 {
  font-size: 1.1rem;
  color: #02375f;
  margin-bottom: 15px;
}

.share-buttons {
  display: flex;
  gap: 12px;
}

.share-btn {
  width: 48px;
  height: 48px;
  border: none;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  transition: all 0.3s ease;
  color: #ffffff;
}

.share-btn:hover {
  transform: translateY(-3px);
  box-shadow: 0 6px 16px rgba(0, 0, 0, 0.15);
}

.share-btn.twitter {
  background: #1DA1F2;
}

.share-btn.facebook {
  background: #1877F2;
}

.share-btn.linkedin {
  background: #0A66C2;
}

.share-btn.copy {
  background: #02375f;
}

.copy-message {
  position: absolute;
  bottom: -30px;
  left: 30px;
  background: #02375f;
  color: #ffffff;
  padding: 6px 12px;
  border-radius: 6px;
  font-size: 0.85rem;
  animation: fadeIn 0.3s ease;
}

@keyframes fadeIn {
  from { opacity: 0; transform: translateY(-5px); }
  to { opacity: 1; transform: translateY(0); }
}

/* Sidebar */
.blog-sidebar {
  position: sticky;
  top: 80px;
}

.sidebar-widget {
  background: #ffffff;
  border-radius: 16px;
  padding: 30px;
  margin-bottom: 30px;
  box-shadow: 0 4px 16px rgba(2, 55, 95, 0.06);
  border: 1px solid #e9ecef;
}

.widget-title {
  font-size: 1.4rem;
  font-weight: 700;
  color: #02375f;
  margin-bottom: 24px;
  padding-bottom: 16px;
  border-bottom: 3px solid #01aeef;
}

.widget-loading {
  text-align: center;
  padding: 20px;
}

/* Recent Posts */
.recent-posts {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.recent-post-item {
  display: flex;
  gap: 16px;
  text-decoration: none;
  transition: all 0.3s ease;
  padding: 12px;
  border-radius: 12px;
}

.recent-post-item:hover {
  background: #f8f9fa;
  transform: translateX(5px);
}

.recent-post-image {
  width: 80px;
  height: 80px;
  border-radius: 10px;
  overflow: hidden;
  flex-shrink: 0;
}

.recent-post-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.recent-post-content {
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: center;
  gap: 6px;
}

.recent-post-title {
  font-size: 0.95rem;
  font-weight: 600;
  color: #02375f;
  line-height: 1.4;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.recent-post-date {
  font-size: 0.8rem;
  color: #6c757d;
}

/* Categories List */
.categories-list {
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.category-item {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 12px 16px;
  background: #f8f9fa;
  border-radius: 10px;
  text-decoration: none;
  color: #02375f;
  font-weight: 600;
  transition: all 0.3s ease;
}

.category-item:hover {
  background: #02375f;
  color: #ffffff;
  transform: translateX(5px);
}

.category-item svg {
  transition: transform 0.3s ease;
}

.category-item:hover svg {
  transform: translateX(3px);
}

/* Error State */
.error-state {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  text-align: center;
  padding: 40px;
  color: #6c757d;
}

.error-state svg {
  margin-bottom: 24px;
  color: #02375f;
  opacity: 0.5;
}

.error-state h2 {
  font-size: 2.5rem;
  color: #02375f;
  margin-bottom: 16px;
}

.error-state p {
  font-size: 1.2rem;
  margin-bottom: 30px;
  max-width: 500px;
}

.back-link {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  background: linear-gradient(135deg, #02375f 0%, #01517a 100%);
  color: #ffffff;
  text-decoration: none;
  padding: 14px 32px;
  border-radius: 50px;
  font-weight: 700;
  transition: all 0.3s ease;
}

.back-link:hover {
  transform: translateY(-3px);
  box-shadow: 0 8px 24px rgba(2, 55, 95, 0.3);
}

/* Responsive */
@media (max-width: 1024px) {
  .blog-layout {
    grid-template-columns: 1fr;
    gap: 40px;
  }

  .blog-sidebar {
    position: static;
  }

  .sidebar-widget {
    max-width: 600px;
    margin: 0 auto 30px;
  }
}

@media (max-width: 768px) {
  .blog-container {
    padding: 40px 0 60px;
  }

  .container {
    padding: 0 20px;
  }

  .blog-main {
    padding: 30px;
    border-radius: 16px;
  }

  .blog-title {
    font-size: 2.2rem;
  }

  .featured-image {
    height: 300px;
  }

  .blog-content {
    font-size: 1rem;
  }

  .blog-meta {
    gap: 16px;
  }

  .share-buttons {
    gap: 10px;
  }

  .share-btn {
    width: 44px;
    height: 44px;
  }
}

@media (max-width: 480px) {
  .blog-main {
    padding: 24px;
  }

  .blog-title {
    font-size: 1.8rem;
  }

  .breadcrumb .current {
    max-width: 150px;
  }

  .featured-image {
    height: 250px;
  }

  .blog-content {
    font-size: 0.95rem;
  }

  .sidebar-widget {
    padding: 24px;
  }

  .recent-post-image {
    width: 70px;
    height: 70px;
  }
}
</style>