<template>
  <section id="about" class="about-section">
    <div class="container">
      <div class="about-content">
        <!-- Left Side: Branded Illustration -->
        <div class="about-left">
          <div class="about-image-wrapper">
            <div class="floating-element element-1">
              <div class="element-icon">⚡</div>
            </div>
            <div class="floating-element element-2">
              <div class="element-icon">🎯</div>
            </div>
            <div class="floating-element element-3">
              <div class="element-icon">✨</div>
            </div>
            <div class="about-illustration">
              <svg viewBox="0 0 500 500" xmlns="http://www.w3.org/2000/svg">
                <!-- Background Shapes -->
                <circle cx="250" cy="250" r="180" fill="url(#aboutGradient1)" opacity="0.1"/>
                <circle cx="150" cy="150" r="80" fill="#60a5fa" opacity="0.15"/>
                <circle cx="350" cy="350" r="100" fill="#fbbf24" opacity="0.15"/>
                
                <!-- Central Device/Dashboard -->
                <rect x="120" y="120" width="260" height="260" rx="30" fill="white" opacity="0.95"/>
                <rect x="135" y="135" width="230" height="230" rx="20" fill="url(#aboutGradient2)"/>
                
                <!-- Dashboard Elements -->
                <rect x="160" y="160" width="80" height="60" rx="8" fill="white" opacity="0.9"/>
                <rect x="260" y="160" width="80" height="60" rx="8" fill="white" opacity="0.7"/>
                <rect x="160" y="240" width="180" height="40" rx="8" fill="white" opacity="0.8"/>
                <rect x="160" y="300" width="120" height="40" rx="8" fill="white" opacity="0.6"/>
                
                <!-- Decorative Lines -->
                <line x1="100" y1="100" x2="150" y2="150" stroke="#0369a1" stroke-width="3" opacity="0.3"/>
                <line x1="400" y1="100" x2="350" y2="150" stroke="#fbbf24" stroke-width="3" opacity="0.3"/>
                <line x1="100" y1="400" x2="150" y2="350" stroke="#60a5fa" stroke-width="3" opacity="0.3"/>
                
                <!-- Tech Icons -->
                <text x="50" y="250" font-size="40" fill="#1e3a8a" opacity="0.2" font-family="monospace">01</text>
                <text x="400" y="250" font-size="40" fill="#0369a1" opacity="0.2" font-family="monospace">10</text>
                
                <!-- Gradients -->
                <defs>
                  <linearGradient id="aboutGradient1" x1="0%" y1="0%" x2="100%" y2="100%">
                    <stop offset="0%" style="stop-color:#0369a1;stop-opacity:1" />
                    <stop offset="100%" style="stop-color:#1e3a8a;stop-opacity:1" />
                  </linearGradient>
                  <linearGradient id="aboutGradient2" x1="0%" y1="0%" x2="100%" y2="100%">
                    <stop offset="0%" style="stop-color:#1e3a8a;stop-opacity:1" />
                    <stop offset="50%" style="stop-color:#0369a1;stop-opacity:1" />
                    <stop offset="100%" style="stop-color:#60a5fa;stop-opacity:1" />
                  </linearGradient>
                </defs>
              </svg>
            </div>
          </div>
        </div>

        <!-- Right Side: Text Content -->
        <div class="about-right">
          <div class="about-text">
            <div class="section-label">Who We Are</div>
            <h2 class="section-title">
              Crafting Digital Excellence
              <span class="gradient-text">Since Day One</span>
            </h2>
            <p class="section-description">
              We are a <span class="text-highlight">full-stack digital solutions company</span> specializing in automation, system development, and smart technology. Whether you're a startup or an enterprise, we craft tools that connect your operations, streamline workflows, and secure your environment.
            </p>
            <p class="section-description-secondary">
              Our mission is simple: transform complex business challenges into elegant, scalable solutions that drive real results. We don't just build software — we build partnerships that last.
            </p>
          </div>

          <div class="features-badges">
            <div class="badge-item">
              <div class="badge-icon">📊</div>
              <div class="badge-text">10+ Years</div>
            </div>
            <div class="badge-item">
              <div class="badge-icon">🤝</div>
              <div class="badge-text">Trusted Partner</div>
            </div>
            <div class="badge-item">
              <div class="badge-icon">🚀</div>
              <div class="badge-text">Fast & Secure</div>
            </div>
          </div>

          <div class="about-cta">
            <a href="/about" class="learn-more-button">
              <span class="button-text">Learn More About Us</span>
              <svg class="button-icon" width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M7.5 15L12.5 10L7.5 5" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>
            </a>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: 'AboutSection'
}
</script>

<style scoped>
/* ===== DESIGN SYSTEM ===== */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.container {
  max-width: 1280px;
  margin: 0 auto;
  padding: 0 24px;
}

/* ===== ABOUT SECTION - SPLIT LAYOUT ===== */
.about-section {
  padding: 80px 24px;
  background: linear-gradient(135deg, #f8fafc 0%, #e0f2fe 50%, #dbeafe 100%);
  position: relative;
  overflow: hidden;
}

.about-section::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: radial-gradient(circle at 80% 20%, rgba(96, 165, 250, 0.1) 0%, transparent 50%),
              radial-gradient(circle at 20% 80%, rgba(251, 191, 36, 0.08) 0%, transparent 50%);
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

/* ===== LEFT SIDE - ILLUSTRATION ===== */
.about-left {
  position: relative;
  animation: fadeInLeft 1s ease-out;
}

.about-image-wrapper {
  position: relative;
  width: 100%;
  height: 400px;
}

.about-illustration {
  width: 100%;
  height: 100%;
  filter: drop-shadow(0 20px 60px rgba(30, 58, 138, 0.15));
}

.about-illustration svg {
  width: 100%;
  height: 100%;
}

/* ===== FLOATING ELEMENTS ===== */
.floating-element {
  position: absolute;
  background: linear-gradient(135deg, #ffffff 0%, #f0f9ff 100%);
  backdrop-filter: blur(10px);
  padding: 16px;
  border-radius: 50%;
  box-shadow: 0 10px 30px rgba(30, 58, 138, 0.15);
  animation: floatSlow 4s ease-in-out infinite;
  border: 2px solid rgba(96, 165, 250, 0.2);
}

.element-1 {
  top: 5%;
  right: 10%;
  animation-delay: 0s;
}

.element-2 {
  bottom: 20%;
  left: -5%;
  animation-delay: 1.5s;
}

.element-3 {
  top: 40%;
  right: -5%;
  animation-delay: 3s;
}

.element-icon {
  font-size: 2rem;
  line-height: 1;
}

/* ===== RIGHT SIDE - TEXT CONTENT ===== */
.about-right {
  display: flex;
  flex-direction: column;
  gap: 32px;
  animation: fadeInRight 1s ease-out;
}

.about-text {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.section-label {
  font-size: 0.875rem;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.1em;
  color: #0369a1;
  display: inline-block;
}

.section-title {
  font-size: 2.75rem;
  font-weight: 800;
  color: #1e3a8a;
  line-height: 1.2;
  letter-spacing: -0.02em;
  font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
}

.gradient-text {
  background: linear-gradient(135deg, #0369a1 0%, #60a5fa 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  display: inline-block;
}

.section-description {
  font-size: 1.125rem;
  color: #475569;
  line-height: 1.8;
  font-family: 'Segoe UI', system-ui, sans-serif;
}

.text-highlight {
  font-weight: 700;
  color: #1e3a8a;
  position: relative;
}

.section-description-secondary {
  font-size: 1.05rem;
  color: #64748b;
  line-height: 1.7;
  font-style: italic;
  padding-left: 20px;
  border-left: 4px solid #fbbf24;
}

/* ===== FEATURES BADGES (HORIZONTAL) ===== */
.features-badges {
  display: flex;
  gap: 16px;
  flex-wrap: wrap;
}

.badge-item {
  display: flex;
  align-items: center;
  gap: 10px;
  padding: 12px 20px;
  background: rgba(255, 255, 255, 0.8);
  backdrop-filter: blur(10px);
  border-radius: 50px;
  border: 2px solid rgba(3, 105, 161, 0.15);
  transition: all 0.3s ease;
  box-shadow: 0 2px 10px rgba(30, 58, 138, 0.08);
}

.badge-item:hover {
  background: white;
  border-color: rgba(251, 191, 36, 0.3);
  transform: translateY(-2px);
  box-shadow: 0 4px 15px rgba(30, 58, 138, 0.12);
}

.badge-icon {
  font-size: 1.5rem;
  line-height: 1;
}

.badge-text {
  font-size: 0.95rem;
  font-weight: 600;
  color: #1e3a8a;
  font-family: 'Segoe UI', system-ui, sans-serif;
  white-space: nowrap;
}

/* ===== ABOUT CTA BUTTON ===== */
.about-cta {
  margin-top: 8px;
}

.learn-more-button {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 14px 28px;
  background: linear-gradient(135deg, #1e3a8a 0%, #0369a1 100%);
  color: white;
  text-decoration: none;
  border-radius: 10px;
  font-size: 1rem;
  font-weight: 600;
  font-family: 'Segoe UI', system-ui, sans-serif;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  box-shadow: 0 4px 15px rgba(30, 58, 138, 0.3);
  position: relative;
  overflow: hidden;
}

.learn-more-button::before {
  content: '';
  position: absolute;
  top: 0;
  left: -100%;
  width: 100%;
  height: 100%;
  background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
  transition: left 0.5s;
}

.learn-more-button:hover::before {
  left: 100%;
}

.learn-more-button:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 25px rgba(30, 58, 138, 0.4);
}

.button-icon {
  transition: transform 0.3s ease;
}

.learn-more-button:hover .button-icon {
  transform: translateX(4px);
}

/* ===== ANIMATIONS ===== */
@keyframes fadeInLeft {
  from {
    opacity: 0;
    transform: translateX(-50px);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}

@keyframes fadeInRight {
  from {
    opacity: 0;
    transform: translateX(50px);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}

@keyframes floatSlow {
  0%, 100% {
    transform: translateY(0px) rotate(0deg);
  }
  50% {
    transform: translateY(-25px) rotate(5deg);
  }
}

/* ===== RESPONSIVE DESIGN ===== */
@media (max-width: 1024px) {
  .about-content {
    grid-template-columns: 1fr;
    gap: 60px;
  }

  .about-left {
    order: 2;
  }

  .about-right {
    order: 1;
  }

  .about-image-wrapper {
    height: 350px;
  }

  .section-title {
    font-size: 2.25rem;
  }

  .floating-element {
    display: none;
  }
}

@media (max-width: 768px) {
  .about-section {
    padding: 60px 20px;
  }

  .about-content {
    gap: 40px;
  }

  .section-title {
    font-size: 2rem;
  }

  .section-description {
    font-size: 1rem;
  }

  .section-description-secondary {
    font-size: 0.95rem;
  }

  .about-image-wrapper {
    height: 280px;
  }

  .features-badges {
    justify-content: center;
  }

  .badge-item {
    padding: 10px 18px;
  }

  .badge-icon {
    font-size: 1.25rem;
  }

  .badge-text {
    font-size: 0.875rem;
  }

  .learn-more-button {
    width: 100%;
    justify-content: center;
  }
}

@media (max-width: 480px) {
  .about-section {
    padding: 40px 16px;
  }

  .section-title {
    font-size: 1.75rem;
  }

  .section-description {
    font-size: 0.95rem;
  }

  .section-description-secondary {
    font-size: 0.875rem;
    padding-left: 16px;
  }

  .features-badges {
    flex-direction: column;
    align-items: stretch;
  }

  .badge-item {
    justify-content: center;
    padding: 12px 16px;
  }

  .badge-icon {
    font-size: 1.25rem;
  }

  .badge-text {
    font-size: 0.85rem;
  }
}
</style>