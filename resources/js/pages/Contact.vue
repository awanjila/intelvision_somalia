<template>
  <div class="main-content">
    <!-- Breadcrumbs -->
    <div class="rs-breadcrumbs img3">
      <div class="breadcrumbs-inner text-center">
        <h1 class="page-title">Contact Us</h1>
        <ul>
          <li>
            <a href="/">Home</a>
          </li>
          <li>Contact</li>
        </ul>
      </div>
    </div>

    <!-- Contact Section Component -->
    <ContactSection />

    <!-- Google Map Section -->
    <section class="map-section">
      <div class="container">
        <div class="map-header">
          <h2 class="map-title">Find Us on the Map</h2>
          <p class="map-description">Visit our office in Nairobi, Kenya</p>
        </div>
        <div class="map-wrapper">
          <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3988.8587858865117!2d36.80878337496547!3d-1.2566086987314193!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x182f171bdb51d753%3A0x1ba101f21acf2aca!2sIntelvision%20Technologies%20Limited!5e0!3m2!1sen!2ske!4v1768636773651!5m2!1sen!2ske" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
import ContactSection from '../components/ContactSection.vue'
</script>

<style scoped>
/* ===== BREADCRUMBS ===== */
.rs-breadcrumbs {
  padding: 50px 0 40px;
  background: linear-gradient(135deg, #1e3a8a 0%, #0369a1 100%);
  position: relative;
}

.breadcrumbs-inner {
  color: white;
}

.page-title {
  font-size: 3rem;
  font-weight: 800;
  margin-bottom: 20px;
  color: white;
}

.breadcrumbs-inner ul {
  list-style: none;
  padding: 0;
  display: flex;
  justify-content: center;
  gap: 10px;
}

.breadcrumbs-inner ul li {
  color: rgba(255, 255, 255, 0.8);
}

.breadcrumbs-inner ul li a {
  color: #fbbf24;
  text-decoration: none;
  transition: color 0.3s;
}

.breadcrumbs-inner ul li a:hover {
  color: white;
}

/* ===== MAP SECTION ===== */
.map-section {
  padding: 80px 24px;
  background: linear-gradient(135deg, #f8fafc 0%, #e0f2fe 100%);
}

.container {
  max-width: 1280px;
  margin: 0 auto;
  padding: 0 24px;
}

.map-header {
  text-align: center;
  margin-bottom: 40px;
}

.map-title {
  font-size: 2.5rem;
  font-weight: 800;
  color: #1e3a8a;
  margin-bottom: 12px;
  font-family: 'Segoe UI', system-ui, sans-serif;
}

.map-description {
  font-size: 1.05rem;
  color: #64748b;
  font-family: 'Segoe UI', system-ui, sans-serif;
}

.map-wrapper {
  border-radius: 20px;
  overflow: hidden;
  box-shadow: 0 10px 40px rgba(30, 58, 138, 0.15);
  border: 4px solid white;
}

.map-wrapper iframe {
  display: block;
  width: 100%;
}

/* ===== RESPONSIVE DESIGN ===== */
@media (max-width: 768px) {
  .map-section {
    padding: 60px 20px;
  }

  .map-title {
    font-size: 2rem;
  }

  .map-description {
    font-size: 1rem;
  }

  .map-wrapper iframe {
    height: 350px;
  }

  .page-title {
    font-size: 2.5rem;
  }
}

@media (max-width: 480px) {
  .map-section {
    padding: 40px 16px;
  }

  .map-title {
    font-size: 1.75rem;
  }

  .map-description {
    font-size: 0.95rem;
  }

  .map-wrapper iframe {
    height: 300px;
  }

  .page-title {
    font-size: 2rem;
  }
}
</style>