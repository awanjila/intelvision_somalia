<template>
  <section class="hero-section">
    <div class="slider-wrapper">
      
      <!-- Slides -->
      <transition-group name="slide-fade" tag="div" class="slides-container">
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
              <p class="slide-description">{{ slide.description }}</p>
              <div class="slide-actions">
                <a href="#contact" class="btn btn-primary">Request Site Visit</a>
                <a href="#solutions" class="btn btn-secondary">Our Solutions</a>
              </div>
            </div>
          </div>
        </div>
      </transition-group>

      <!-- Navigation Arrows -->
      <button class="slider-nav prev" @click="prevSlide" aria-label="Previous">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <polyline points="15 18 9 12 15 6"></polyline>
        </svg>
      </button>
      
      <button class="slider-nav next" @click="nextSlide" aria-label="Next">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <polyline points="9 18 15 12 9 6"></polyline>
        </svg>
      </button>

      <!-- Dots Indicator -->
      <div class="slider-dots">
        <button
          v-for="(slide, index) in slides"
          :key="`dot-${index}`"
          :class="['dot', { active: currentSlide === index }]"
          @click="goToSlide(index)"
          :aria-label="`Go to slide ${index + 1}`"
        ></button>
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
          description: 'High-definition cameras with remote monitoring, night vision, and cloud storage for complete property oversight.',
          image: '/images/hero/cctv-surveillance.jpg'
        },
	        {
	          title: 'Electric Fence & Perimeter Security',
	          description: 'Advanced energizer systems with alarm integration, ensuring maximum protection for residential and commercial properties.',
	          image: '/images/hero/electric-fence.jpg'
	        },
	        {
          title: 'Access Control & Biometric Solutions',
         description: 'Fingerprint scanners, card readers, and automated gate systems for secure and convenient entry management.',
          image: '/images/hero/residential-security.jpg'
        },
        {
          title: 'Automated Gates & Barrier Systems',
          description: 'Automated gates and barriers for secure property access.',
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
      this.autoplayInterval = setInterval(() => {
        this.nextSlide()
      }, 5000)
    },
    stopAutoplay() {
      if (this.autoplayInterval) {
        clearInterval(this.autoplayInterval)
      }
    },
    nextSlide() {
      this.currentSlide = (this.currentSlide + 1) % this.slides.length
    },
    prevSlide() {
      this.currentSlide = this.currentSlide === 0 ? this.slides.length - 1 : this.currentSlide - 1
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
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.hero-section {
  position: relative;
  width: 100%;
  height: 80vh;
  min-height: 550px;
  background: #02375f;
  overflow: hidden;
}

.slider-wrapper {
  position: relative;
  width: 100%;
  height: 100%;
}

.slides-container {
  position: relative;
  width: 100%;
  height: 100%;
}

.slide {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  display: flex;
  align-items: center;
}

.slide-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(2, 55, 95, 0.25);
}

.container {
  position: relative;
  z-index: 2;
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 40px;
  width: 100%;
}

.slide-content {
  max-width: 700px;
  background: rgba(2, 55, 95, 0.92);
  padding: 40px 50px;
  backdrop-filter: blur(12px);
  border-left: 4px solid #01aeef;
}

.slide-title {
  font-size: 3.5rem;
  font-weight: 700;
  color: #ffffff;
  margin-bottom: 24px;
  line-height: 1.15;
  letter-spacing: -0.02em;
}

.slide-description {
  font-size: 1.25rem;
  color: #ffffff;
  margin-bottom: 40px;
  line-height: 1.6;
  opacity: 0.95;
}

.slide-actions {
  display: flex;
  gap: 16px;
  flex-wrap: wrap;
}

.btn {
  display: inline-block;
  padding: 16px 32px;
  font-size: 1rem;
  font-weight: 600;
  text-decoration: none;
  border: none;
  cursor: pointer;
  transition: all 0.3s ease;
  text-align: center;
}

.btn-primary {
  background: #01aeef;
  color: #ffffff;
}

.btn-primary:hover {
  background: #0398d4;
  transform: translateY(-2px);
}

.btn-secondary {
  background: transparent;
  color: #ffffff;
  border: 2px solid #ffffff;
}

.btn-secondary:hover {
  background: rgba(255, 255, 255, 0.1);
}

/* Navigation Arrows */
.slider-nav {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  background: rgba(255, 255, 255, 0.15);
  border: none;
  width: 50px;
  height: 50px;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  z-index: 10;
  transition: all 0.3s ease;
  backdrop-filter: blur(4px);
}

.slider-nav:hover {
  background: rgba(1, 174, 239, 0.9);
}

.slider-nav svg {
  color: #ffffff;
}

.slider-nav.prev {
  left: 30px;
}

.slider-nav.next {
  right: 30px;
}

/* Dots */
.slider-dots {
  position: absolute;
  bottom: 40px;
  left: 50%;
  transform: translateX(-50%);
  display: flex;
  gap: 12px;
  z-index: 10;
}

.dot {
  width: 12px;
  height: 12px;
  background: rgba(255, 255, 255, 0.4);
  border: none;
  cursor: pointer;
  transition: all 0.3s ease;
  padding: 0;
}

.dot.active {
  background: #01aeef;
  width: 36px;
}

.dot:hover {
  background: rgba(255, 255, 255, 0.7);
}

/* Transitions */
.slide-fade-enter-active {
  transition: opacity 1s ease;
}

.slide-fade-leave-active {
  transition: opacity 0.5s ease;
}

.slide-fade-enter-from {
  opacity: 0;
}

.slide-fade-leave-to {
  opacity: 0;
}

/* Responsive */
@media (max-width: 1024px) {
  .slide-title {
    font-size: 2.5rem;
  }

  .slide-description {
    font-size: 1.1rem;
  }

  .container {
    padding: 0 30px;
  }

  .slider-nav {
    width: 45px;
    height: 45px;
  }

  .slider-nav.prev {
    left: 20px;
  }

  .slider-nav.next {
    right: 20px;
  }
}

@media (max-width: 768px) {
  .hero-section {
    height: 65vh;
    min-height: 500px;
  }

  .slide-content {
    padding: 30px 35px;
  }

  .slide-title {
    font-size: 2rem;
    margin-bottom: 16px;
  }

  .slide-description {
    font-size: 1rem;
    margin-bottom: 30px;
  }

  .slide-actions {
    flex-direction: column;
  }

  .btn {
    padding: 14px 28px;
    width: 100%;
    max-width: 300px;
  }

  .container {
    padding: 0 20px;
  }

  .slider-nav {
    width: 40px;
    height: 40px;
  }

  .slider-nav.prev {
    left: 15px;
  }

  .slider-nav.next {
    right: 15px;
  }

  .slider-dots {
    bottom: 30px;
  }

  .dot {
    width: 10px;
    height: 10px;
  }

  .dot.active {
    width: 30px;
  }
}

@media (max-width: 480px) {
  .slide-content {
    padding: 25px 30px;
  }

  .slide-title {
    font-size: 1.75rem;
  }

  .slide-description {
    font-size: 0.95rem;
  }

  .btn {
    font-size: 0.9rem;
    padding: 12px 24px;
  }

  .slider-nav {
    width: 36px;
    height: 36px;
  }

  .slider-nav.prev {
    left: 10px;
  }

  .slider-nav.next {
    right: 10px;
  }
}
</style>