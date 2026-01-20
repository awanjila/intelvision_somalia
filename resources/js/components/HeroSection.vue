<template>
  <section class="hero-section">
    <div class="slider-wrapper">

      <!-- Slides -->
      <transition-group
        name="slide-fade"
        tag="div"
        class="slides-container"
      >
        <div
          v-for="(slide, index) in slides"
          :key="index"
          v-show="currentSlide === index"
          class="slide"
          :style="{ backgroundImage: `url(${slide.image})` }"
        >
          <div class="slide-overlay"></div>

          <div class="container">
            <div class="slide-content">
              <h1 class="slide-title">{{ slide.title }}</h1>
              <p class="slide-description">
                {{ slide.description }}
              </p>

              <div class="slide-actions">
                <a href="/contact" class="btn btn-primary">Contact Us</a>
                <a href="/products" class="btn btn-secondary">Our Products</a>
              </div>
            </div>
          </div>
        </div>
      </transition-group>

      <!-- Navigation -->
      <button class="slider-nav prev" @click="prevSlide">
        ‹
      </button>

      <button class="slider-nav next" @click="nextSlide">
        ›
      </button>

      <!-- Dots -->
      <div class="slider-dots">
        <button
          v-for="(_, index) in slides"
          :key="index"
          :class="['dot', { active: currentSlide === index }]"
          @click="goToSlide(index)"
        />
      </div>

    </div>
  </section>
</template>

<script>
export default {
  name: 'HeroSection',
  data() {
    return {
      currentSlide: 0,
      autoplayInterval: null,
      slides: [
        {
          title: 'Professional CCTV Surveillance Systems',
          description:
            'High-definition cameras with remote monitoring, night vision, and cloud storage for complete property oversight.',
          image: '/images/hero/cctv-surveillance.jpg'
        },
        {
          title: 'Electric Fence & Perimeter Security',
          description:
            'Advanced energizer systems with alarm integration, ensuring maximum protection for residential and commercial properties.',
          image: '/images/hero/electric-fence.jpg'
        },
        {
          title: 'Access Control & Biometric Solutions',
          description:
            'Fingerprint scanners, card readers, and automated gate systems for secure and convenient entry management.',
          image: '/images/hero/residential-security.jpg'
        },
        {
          title: 'Automated Gates & Barrier Systems',
          description:
            'Automated gates and barriers for secure property access.',
          image: '/images/hero/automated-gates.jpg'
        }
      ]
    }
  },

  mounted() {
    this.startAutoplay()
  },

  beforeUnmount() {
    this.stopAutoplay()
  },

  methods: {
    startAutoplay() {
      this.autoplayInterval = setInterval(this.nextSlide, 5000)
    },
    stopAutoplay() {
      clearInterval(this.autoplayInterval)
    },
    nextSlide() {
      this.currentSlide =
        (this.currentSlide + 1) % this.slides.length
    },
    prevSlide() {
      this.currentSlide =
        this.currentSlide === 0
          ? this.slides.length - 1
          : this.currentSlide - 1
    },
    goToSlide(index) {
      this.currentSlide = index
      this.stopAutoplay()
      this.startAutoplay()
    }
  }
}
</script>

<style scoped>
/* =========================
   HERO LAYOUT (FIXED)
   ========================= */

.hero-section {
  position: relative;
  width: 100%;
  background: #02375f;
  overflow: hidden;

  /* Core fix */
  min-height: 420px;
  height: clamp(420px, 55vh, 640px);
}

.slider-wrapper,
.slides-container {
  width: 100%;
  height: 100%;
  position: relative;
}

/* =========================
   SLIDES
   ========================= */

.slide {
  position: absolute;
  inset: 0;
  background-size: cover;
  background-position: center;
  display: flex;
  align-items: center;
}

.slide-overlay {
  position: absolute;
  inset: 0;
  background: rgba(2, 55, 95, 0.25);
}

.container {
  position: relative;
  z-index: 2;
  max-width: 1200px;
  margin: auto;
  padding: 0 32px;
  width: 100%;
}

.slide-content {
  max-width: 680px;
  background: rgba(2, 55, 95, 0.92);
  padding: 36px 44px;
  backdrop-filter: blur(10px);
  border-left: 4px solid #01aeef;
}

.slide-title {
  font-size: 3rem;
  font-weight: 700;
  color: #fff;
  line-height: 1.15;
  margin-bottom: 20px;
}

.slide-description {
  font-size: 1.15rem;
  color: #fff;
  line-height: 1.6;
  margin-bottom: 32px;
}

/* =========================
   ACTIONS
   ========================= */

.slide-actions {
  display: flex;
  gap: 14px;
  flex-wrap: wrap;
}

.btn {
  padding: 14px 28px;
  font-size: 0.95rem;
  font-weight: 600;
  text-decoration: none;
  transition: all 0.25s ease;
}

.btn-primary {
  background: #01aeef;
  color: #fff;
}

.btn-primary:hover {
  background: #0398d4;
}

.btn-secondary {
  border: 2px solid #fff;
  color: #fff;
}

/* =========================
   NAVIGATION
   ========================= */

.slider-nav {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  width: 46px;
  height: 46px;
  border-radius: 50%;
  border: none;
  background: rgba(255, 255, 255, 0.15);
  color: #fff;
  cursor: pointer;
  z-index: 10;
}

.slider-nav.prev { left: 20px }
.slider-nav.next { right: 20px }

/* =========================
   DOTS
   ========================= */

.slider-dots {
  position: absolute;
  bottom: 24px;
  left: 50%;
  transform: translateX(-50%);
  display: flex;
  gap: 10px;
}

.dot {
  width: 10px;
  height: 10px;
  background: rgba(255,255,255,0.4);
  border: none;
}

.dot.active {
  width: 32px;
  background: #01aeef;
}

/* =========================
   TRANSITIONS
   ========================= */

.slide-fade-enter-active {
  transition: opacity 0.8s ease;
}
.slide-fade-leave-active {
  transition: opacity 0.4s ease;
}
.slide-fade-enter-from,
.slide-fade-leave-to {
  opacity: 0;
}

/* =========================
   MOBILE FIX (CRITICAL)
   ========================= */

@media (max-width: 768px) {
  .hero-section {
    height: auto;
    min-height: unset;
    padding: 80px 0;
  }

  .slide {
    position: relative;
  }

  .slide-content {
    padding: 28px 32px;
  }

  .slide-title {
    font-size: 2rem;
  }

  .slide-description {
    font-size: 1rem;
  }

  .slider-nav {
    display: none;
  }
}
</style>
