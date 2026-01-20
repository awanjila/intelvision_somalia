<template>
  <section class="about-section">
    <div class="container">
      <div class="about-content">
        <!-- Left Side: Image -->
        <div class="about-image-wrapper" data-aos="fade-right">
          <div class="image-container">
            <img 
              src="/images/about/security-team.jpeg" 
              alt="Intelvision Technologies Security Solutions" 
              class="about-image"
            />
            <div class="image-overlay"></div>
            
            <!-- Stats Badge -->
            <div class="stats-badge">
              <div class="stat-item">
                <div class="stat-number">15+</div>
                <div class="stat-label">Years Experience</div>
              </div>
              <div class="stat-divider"></div>
              <div class="stat-item">
                <div class="stat-number">1000+</div>
                <div class="stat-label">Happy Clients</div>
              </div>
            </div>

            <!-- Decorative Elements -->
            <div class="decorative-circle circle-1"></div>
            <div class="decorative-circle circle-2"></div>
          </div>
        </div>

        <!-- Right Side: Content -->
        <div class="about-text-wrapper" data-aos="fade-left">
          <div class="section-label">About Intelvision</div>
          <h2 class="section-title">
            Leading the Way in 
            <span class="gradient-text">Security Solutions</span>
          </h2>
          
          <p class="about-description">
            Intelvision Technologies was established in 2010 with a clear mission: to provide the best security solutions for our clients by leveraging today's modern technology. We form strong partnerships with our clients to ensure they realize maximum value in terms of expert advice and cost-effectiveness.
          </p>

        
          <div class="cta-buttons">
            <a href="/about" class="btn-primary">
              Learn More About Us
              <i class="fas fa-arrow-right"></i>
            </a>
            <a href="/contact" class="btn-secondary">
              <i class="fas fa-phone-alt"></i>
              Get In Touch
            </a>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { onMounted } from 'vue'

onMounted(() => {
  // Initialize AOS (Animate On Scroll) if available
  if (typeof AOS !== 'undefined') {
    AOS.init({
      duration: 800,
      once: true,
      offset: 100
    })
  }
})
</script>

<style scoped>
/* ===== DESIGN SYSTEM ===== */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 24px;
}

/* ===== ABOUT SECTION ===== */
.about-section {
  padding: 50px 0 30px 0;
  background: linear-gradient(to bottom, #ffffff 0%, #f8fafc 100%);
  position: relative;
  overflow: hidden;
  font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
}

.about-section::before {
  content: '';
  position: absolute;
  top: -50%;
  right: -10%;
  width: 600px;
  height: 600px;
  background: radial-gradient(circle, rgba(1, 174, 239, 0.08) 0%, transparent 70%);
  border-radius: 50%;
  pointer-events: none;
}

.about-content {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 80px;
  align-items: center;
  position: relative;
  z-index: 1;
}

/* ===== LEFT SIDE - IMAGE ===== */
.about-image-wrapper {
  position: relative;
}

.image-container {
  position: relative;
  border-radius: 20px;
  overflow: hidden;
  box-shadow: 0 20px 60px rgba(2, 55, 95, 0.15);
}

.about-image {
  width: 100%;
  height: auto;
  display: block;
  border-radius: 20px;
  transition: transform 0.5s ease;
}

.image-container:hover .about-image {
  transform: scale(1.05);
}

.image-overlay {
  position: absolute;
  inset: 0;
  background: linear-gradient(
    135deg,
    rgba(1, 174, 239, 0.1) 0%,
    rgba(2, 55, 95, 0.2) 100%
  );
  pointer-events: none;
}

/* ===== STATS BADGE ===== */
.stats-badge {
  position: absolute;
  bottom: 30px;
  left: 30px;
  right: 30px;
  background: rgba(255, 255, 255, 0.95);
  backdrop-filter: blur(10px);
  border-radius: 16px;
  padding: 24px;
  display: flex;
  align-items: center;
  justify-content: space-around;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
  border: 1px solid rgba(255, 255, 255, 0.5);
}

.stat-item {
  text-align: center;
}

.stat-number {
  font-size: 2rem;
  font-weight: 800;
  background: linear-gradient(135deg, #01aeef 0%, #0284c7 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  line-height: 1;
  margin-bottom: 8px;
}

.stat-label {
  font-size: 0.875rem;
  color: #64748b;
  font-weight: 600;
}

.stat-divider {
  width: 1px;
  height: 40px;
  background: linear-gradient(to bottom, transparent, #e2e8f0, transparent);
}

/* ===== DECORATIVE CIRCLES ===== */
.decorative-circle {
  position: absolute;
  border-radius: 50%;
  pointer-events: none;
  z-index: -1;
}

.circle-1 {
  width: 120px;
  height: 120px;
  background: linear-gradient(135deg, rgba(1, 174, 239, 0.15) 0%, rgba(2, 55, 95, 0.1) 100%);
  top: -30px;
  right: -30px;
  animation: float 6s ease-in-out infinite;
}

.circle-2 {
  width: 80px;
  height: 80px;
  background: linear-gradient(135deg, rgba(2, 55, 95, 0.1) 0%, rgba(1, 174, 239, 0.15) 100%);
  bottom: -20px;
  left: -20px;
  animation: float 8s ease-in-out infinite reverse;
}

@keyframes float {
  0%, 100% {
    transform: translateY(0) rotate(0deg);
  }
  50% {
    transform: translateY(-20px) rotate(180deg);
  }
}

/* ===== RIGHT SIDE - CONTENT ===== */
.about-text-wrapper {
  display: flex;
  flex-direction: column;
  gap: 24px;
}

.section-label {
  font-size: 0.875rem;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.1em;
  color: #01aeef;
  display: inline-block;
}

.section-title {
  font-size: 2.75rem;
  font-weight: 800;
  color: #02375f;
  line-height: 1.2;
  letter-spacing: -0.02em;
  margin-bottom: 8px;
}

.gradient-text {
  background: linear-gradient(135deg, #01aeef 0%, #0284c7 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  display: inline-block;
}

.about-description {
  font-size: 1.05rem;
  color: #64748b;
  line-height: 1.8;
  margin-bottom: 8px;
}

/* ===== FEATURE LIST ===== */
.feature-list {
  display: flex;
  flex-direction: column;
  gap: 20px;
  margin: 16px 0;
}

.feature-item {
  display: flex;
  gap: 16px;
  align-items: flex-start;
  padding: 20px;
  background: white;
  border-radius: 12px;
  border: 1px solid #e2e8f0;
  transition: all 0.3s ease;
}

.feature-item:hover {
  border-color: #01aeef;
  box-shadow: 0 8px 24px rgba(1, 174, 239, 0.15);
  transform: translateX(8px);
}

.feature-icon {
  width: 50px;
  height: 50px;
  background: linear-gradient(135deg, #01aeef 0%, #0284c7 100%);
  border-radius: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  transition: transform 0.3s ease;
}

.feature-item:hover .feature-icon {
  transform: scale(1.1) rotate(5deg);
}

.feature-icon i {
  font-size: 1.5rem;
  color: white;
}

.feature-content {
  flex: 1;
}

.feature-content h4 {
  font-size: 1.1rem;
  font-weight: 700;
  color: #02375f;
  margin-bottom: 6px;
}

.feature-content p {
  font-size: 0.95rem;
  color: #64748b;
  line-height: 1.6;
  margin: 0;
}

/* ===== CTA BUTTONS ===== */
.cta-buttons {
  display: flex;
  gap: 16px;
  margin-top: 16px;
  flex-wrap: wrap;
}

.btn-primary,
.btn-secondary {
  padding: 14px 28px;
  border-radius: 8px;
  font-size: 1rem;
  font-weight: 600;
  text-decoration: none;
  display: inline-flex;
  align-items: center;
  gap: 10px;
  transition: all 0.3s ease;
  white-space: nowrap;
}

.btn-primary {
  background: linear-gradient(135deg, #01aeef 0%, #0284c7 100%);
  color: white;
  box-shadow: 0 4px 16px rgba(1, 174, 239, 0.3);
}

.btn-primary:hover {
  transform: translateY(-2px);
  box-shadow: 0 8px 24px rgba(1, 174, 239, 0.4);
}

.btn-primary i {
  transition: transform 0.3s ease;
}

.btn-primary:hover i {
  transform: translateX(4px);
}

.btn-secondary {
  background: white;
  color: #01aeef;
  border: 2px solid #01aeef;
}

.btn-secondary:hover {
  background: #01aeef;
  color: white;
  transform: translateY(-2px);
  box-shadow: 0 4px 16px rgba(1, 174, 239, 0.2);
}

/* ===== RESPONSIVE DESIGN ===== */
@media (max-width: 1024px) {
  .about-content {
    grid-template-columns: 1fr;
    gap: 60px;
  }

  .section-title {
    font-size: 2.25rem;
  }

  .stats-badge {
    bottom: 20px;
    left: 20px;
    right: 20px;
    padding: 20px;
  }

  .stat-number {
    font-size: 1.75rem;
  }
}

@media (max-width: 768px) {
  .about-section {
    padding: 40px 0 25px 0;
  }

  .about-content {
    gap: 50px;
  }

  .section-title {
    font-size: 2rem;
  }

  .about-description {
    font-size: 1rem;
  }

  .feature-list {
    gap: 16px;
  }

  .feature-item {
    padding: 16px;
  }

  .feature-icon {
    width: 45px;
    height: 45px;
  }

  .feature-icon i {
    font-size: 1.25rem;
  }

  .cta-buttons {
    flex-direction: column;
  }

  .btn-primary,
  .btn-secondary {
    width: 100%;
    justify-content: center;
  }

  .stats-badge {
    position: static;
    margin-top: 20px;
  }
}

@media (max-width: 480px) {
  .about-section {
    padding: 35px 0 20px 0;
  }

  .section-title {
    font-size: 1.75rem;
  }

  .about-description {
    font-size: 0.95rem;
  }

  .feature-content h4 {
    font-size: 1rem;
  }

  .feature-content p {
    font-size: 0.9rem;
  }

  .btn-primary,
  .btn-secondary {
    padding: 12px 24px;
    font-size: 0.95rem;
  }

  .stats-badge {
    flex-direction: column;
    gap: 20px;
    padding: 20px;
  }

  .stat-divider {
    width: 100%;
    height: 1px;
  }

  .circle-1,
  .circle-2 {
    display: none;
  }
}
</style>