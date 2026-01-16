<template>
  <div class="about-page">
    <!-- Hero Section -->
    <section class="hero-section">
      <div class="container">
        <h1 class="hero-title">About Wabe Studio</h1>
        <p class="hero-subtitle">We build systems that work — so you can grow.</p>
        <div class="button-group">
          <a :href="whatsappLink" target="_blank" rel="noopener noreferrer" class="cta-button whatsapp">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path>
            </svg>
            Let's Talk on WhatsApp
          </a>
          <a href="/contact" class="cta-button contact">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M21.21 15.89A10 10 0 1 1 8 2.83"></path>
              <path d="M22 12A10 10 0 0 0 12 2v10z"></path>
            </svg>
            Tell Us About Your Project
          </a>
        </div>
      </div>
    </section>

    <!-- Who We Are & What We Do -->
    <section class="content-section">
      <div class="container">
        <div class="two-column-grid">
          <div class="column-card">
            <h2 class="section-title">Who We Are</h2>
            <p class="section-text">
              Wabe Studio is a <strong>digital systems company</strong> based in Kenya, serving businesses across East Africa and Africa. We help companies simplify operations, improve efficiency, and grow through <strong>connected digital solutions</strong> that bring clarity and control to everyday business.
            </p>
          </div>
          <div class="column-card">
            <h2 class="section-title">What We Do</h2>
            <p class="section-text">
              We design <strong>business systems that scale</strong> — from sales and payments to inventory, security, and customer experience. We create digital environments where teams can see everything clearly, act faster, and make better decisions.
            </p>
          </div>
        </div>
      </div>
    </section>

    <!-- Mission & Vision -->
    <section class="content-section alt-bg">
      <div class="container">
        <div class="mission-vision-grid">
          <div class="mission-card">
            <div class="icon-circle">
              <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <circle cx="12" cy="12" r="10"></circle>
                <circle cx="12" cy="12" r="6"></circle>
                <circle cx="12" cy="12" r="2"></circle>
              </svg>
            </div>
            <h3>Our Mission</h3>
            <p>To empower African businesses with smart, reliable systems that remove friction, unlock data, and drive sustainable growth.</p>
          </div>
          <div class="vision-card">
            <div class="icon-circle">
              <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M2 12s3-7 10-7 10 7 10 7-3 7-10 7-10-7-10-7Z"></path>
                <circle cx="12" cy="12" r="3"></circle>
              </svg>
            </div>
            <h3>Our Vision</h3>
            <p>An Africa where every business runs on connected, efficient, and trustworthy technology built for local realities and global standards.</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Our Edge -->
    <section class="content-section">
      <div class="container">
        <h2 class="main-title">Our Edge</h2>
        <div class="edge-grid">
          <div class="edge-card">
            <div class="edge-icon">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="m7 11 2-2-2-2"></path>
                <path d="M11 13h4"></path>
                <rect width="18" height="18" x="3" y="3" rx="2" ry="2"></rect>
              </svg>
            </div>
            <h4>Connected Thinking</h4>
            <p>Systems that work together seamlessly.</p>
          </div>
          <div class="edge-card">
            <div class="edge-icon">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M22 12h-2.48a2 2 0 0 0-1.93 1.46l-2.35 8.36a.25.25 0 0 1-.48 0L9.24 2.18a.25.25 0 0 0-.48 0l-2.35 8.36A2 2 0 0 1 4.49 12H2"></path>
              </svg>
            </div>
            <h4>Built for Growth</h4>
            <p>Solutions designed to scale with your business.</p>
          </div>
          <div class="edge-card">
            <div class="edge-icon">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <line x1="12" x2="12" y1="20" y2="10"></line>
                <line x1="18" x2="18" y1="20" y2="4"></line>
                <line x1="6" x2="6" y1="20" y2="16"></line>
              </svg>
            </div>
            <h4>Data-Driven Clarity</h4>
            <p>Know what's happening, when, and why.</p>
          </div>
          <div class="edge-card">
            <div class="edge-icon">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10"></path>
              </svg>
            </div>
            <h4>Partnership & Reliability</h4>
            <p>We deliver, support, and grow with our clients.</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Our Impact -->
    <section class="content-section alt-bg">
      <div class="container">
        <h2 class="main-title">Our Impact</h2>
        <p class="section-text centered">
          Wabe Studio has supported organizations across retail, healthcare, education, and service industries to digitize operations, automate payments, and strengthen business visibility.
        </p>
        <div class="impact-grid">
          <div class="impact-item">
            <span class="impact-bullet">→</span>
            <span>Save time and reduce errors</span>
          </div>
          <div class="impact-item">
            <span class="impact-bullet">→</span>
            <span>Improve accountability and performance</span>
          </div>
          <div class="impact-item">
            <span class="impact-bullet">→</span>
            <span>Build data-backed decision-making cultures</span>
          </div>
        </div>
      </div>
    </section>

    <!-- Testimonials Carousel -->
    <section class="testimonials-section">
      <div class="container">
        <h2 class="main-title">What Our Clients Say</h2>
        <div class="testimonial-carousel">
          <button @click="prevTestimonial" class="carousel-btn prev" aria-label="Previous testimonial">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="m15 18-6-6 6-6"/>
            </svg>
          </button>
          
          <div class="testimonial-card">
            <div class="quote-icon">
              <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 24 24" fill="currentColor">
                <path d="M6 17h3l2-4V7H5v6h3zm8 0h3l2-4V7h-6v6h3z"/>
              </svg>
            </div>
            <p class="testimonial-text">{{ testimonials[currentTestimonial].text }}</p>
            <div class="testimonial-author">
              <p class="author-name">{{ testimonials[currentTestimonial].name }}</p>
              <p class="author-title">{{ testimonials[currentTestimonial].title }}</p>
            </div>
          </div>

          <button @click="nextTestimonial" class="carousel-btn next" aria-label="Next testimonial">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="m9 18 6-6-6-6"/>
            </svg>
          </button>
        </div>
        
        <div class="carousel-dots">
          <button 
            v-for="(testimonial, index) in testimonials" 
            :key="index"
            @click="currentTestimonial = index"
            :class="['dot', { active: currentTestimonial === index }]"
            :aria-label="`Go to testimonial ${index + 1}`"
          ></button>
        </div>
      </div>
    </section>

    <!-- Final CTA -->
    <section class="cta-section">
      <div class="container">
        <h2 class="cta-title">Let's Build What Works</h2>
        <p class="cta-text">
          Whether you're modernizing operations, improving customer experience, or preparing to scale, we help you design systems that work — so your business can grow.
        </p>
        <div class="button-group">
          <a :href="whatsappLink" target="_blank" rel="noopener noreferrer" class="cta-button large whatsapp">
            <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path>
            </svg>
            Start a Conversation
          </a>
          <a href="/contact" class="cta-button large contact">
            <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M21.21 15.89A10 10 0 1 1 8 2.83"></path>
              <path d="M22 12A10 10 0 0 0 12 2v10z"></path>
            </svg>
            Tell Us About Your Project
          </a>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
export default {
  name: 'AboutPage',
  data() {
    return {
      whatsappNumber: '254781312070', // Replace with your actual WhatsApp number
      currentTestimonial: 0,
      testimonials: [
        {
          text: "Wabe Studio transformed our operations completely. The system they built reduced our processing time by 60% and gave us real-time visibility across all departments.",
          name: "Sarah Kimani",
          title: "Operations Director, RetailCo Kenya"
        },
        {
          text: "Working with Wabe Studio was seamless. They understood our challenges and delivered a solution that actually works for our team. Our efficiency has improved dramatically.",
          name: "David Omondi",
          title: "CEO, MediHealth Solutions"
        },
        {
          text: "The payment automation system Wabe built for us eliminated manual errors and saved us countless hours. Their support has been exceptional throughout.",
          name: "Grace Mwangi",
          title: "Finance Manager, EduLearn Africa"
        },
        {
          text: "From concept to deployment, Wabe Studio delivered beyond expectations. The inventory system they created gives us control we never had before.",
          name: "James Otieno",
          title: "Managing Director, Supply Chain Pro"
        }
      ]
    }
  },
  computed: {
    whatsappLink() {
      return `https://wa.me/${this.whatsappNumber}?text=Hi%20Wabe%20Studio%2C%20I'm%20interested%20in%20learning%20more%20about%20your%20services`
    }
  },
  methods: {
    nextTestimonial() {
      this.currentTestimonial = (this.currentTestimonial + 1) % this.testimonials.length
    },
    prevTestimonial() {
      this.currentTestimonial = this.currentTestimonial === 0 
        ? this.testimonials.length - 1 
        : this.currentTestimonial - 1
    }
  },
  mounted() {
    // Auto-rotate testimonials every 5 seconds
    this.testimonialInterval = setInterval(() => {
      this.nextTestimonial()
    }, 5000)
  },
  beforeUnmount() {
    if (this.testimonialInterval) {
      clearInterval(this.testimonialInterval)
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

.about-page {
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  color: #1e293b;
  line-height: 1.6;
  background: #ffffff;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 24px;
}

/* Hero Section */
.hero-section {
  background: linear-gradient(135deg, #1e3a8a 0%, #0369a1 100%);
  color: white;
  padding: 60px 24px;
  text-align: center;
}

.hero-title {
  font-size: 2.5rem;
  font-weight: 700;
  margin-bottom: 16px;
  letter-spacing: -0.01em;
}

.hero-subtitle {
  font-size: 1.2rem;
  font-weight: 300;
  max-width: 600px;
  margin: 0 auto 30px;
  opacity: 0.95;
}

.button-group {
  display: flex;
  flex-wrap: wrap;
  gap: 16px;
  justify-content: center;
  align-items: center;
}

.cta-button {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 12px 24px;
  border-radius: 6px;
  text-decoration: none;
  font-size: 0.95rem;
  font-weight: 600;
  transition: all 0.3s ease;
}

.cta-button.whatsapp {
  background: #25D366;
  color: white;
  box-shadow: 0 4px 12px rgba(37, 211, 102, 0.3);
}

.cta-button.whatsapp:hover {
  background: #20bd5a;
  transform: translateY(-2px);
  box-shadow: 0 6px 20px rgba(37, 211, 102, 0.4);
}

.cta-button.contact {
  background: white;
  color: #1e3a8a;
  box-shadow: 0 4px 12px rgba(30, 58, 138, 0.2);
  border: 2px solid #0369a1;
}

.cta-button.contact:hover {
  background: #f0f9ff;
  transform: translateY(-2px);
  box-shadow: 0 6px 20px rgba(30, 58, 138, 0.3);
}

.cta-button.large {
  padding: 14px 28px;
  font-size: 1rem;
}

/* Content Sections */
.content-section {
  padding: 50px 24px;
}

.content-section.alt-bg {
  background: linear-gradient(135deg, #f8fafc 0%, #e0f2fe 100%);
}

.main-title {
  font-size: 2rem;
  font-weight: 700;
  color: #1e3a8a;
  margin-bottom: 30px;
  text-align: center;
}

.section-title {
  font-size: 1.5rem;
  font-weight: 700;
  color: #1e3a8a;
  margin-bottom: 16px;
}

.section-text {
  font-size: 1rem;
  line-height: 1.7;
  color: #475569;
}

.section-text.centered {
  text-align: center;
  max-width: 800px;
  margin: 0 auto 30px;
}

.section-text strong {
  color: #0369a1;
  font-weight: 600;
}

/* Two Column Layout */
.two-column-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(450px, 1fr));
  gap: 40px;
}

.column-card {
  background: white;
  padding: 30px;
  border-radius: 8px;
  box-shadow: 0 2px 12px rgba(30, 58, 138, 0.08);
  border-left: 4px solid #0369a1;
}

/* Mission & Vision */
.mission-vision-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
  gap: 30px;
}

.mission-card,
.vision-card {
  background: white;
  padding: 30px;
  border-radius: 8px;
  border-left: 4px solid #0369a1;
  box-shadow: 0 2px 12px rgba(3, 105, 161, 0.08);
}

.icon-circle {
  width: 56px;
  height: 56px;
  background: #1e3a8a;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 16px;
}

.icon-circle svg {
  color: white;
}

.mission-card h3,
.vision-card h3 {
  font-size: 1.3rem;
  color: #1e3a8a;
  margin-bottom: 12px;
  font-weight: 700;
}

.mission-card p,
.vision-card p {
  font-size: 0.95rem;
  color: #475569;
  line-height: 1.6;
}

/* Our Edge */
.edge-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 24px;
}

.edge-card {
  background: white;
  padding: 24px 20px;
  border-radius: 8px;
  text-align: center;
  box-shadow: 0 2px 10px rgba(30, 58, 138, 0.08);
  transition: all 0.3s ease;
  border-top: 3px solid #0369a1;
}

.edge-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 6px 20px rgba(30, 58, 138, 0.12);
}

.edge-icon {
  width: 50px;
  height: 50px;
  background: linear-gradient(135deg, #1e3a8a 0%, #0369a1 100%);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto 14px;
}

.edge-icon svg {
  color: white;
}

.edge-card h4 {
  font-size: 1.1rem;
  color: #1e3a8a;
  margin-bottom: 8px;
  font-weight: 700;
}

.edge-card p {
  font-size: 0.9rem;
  color: #64748b;
  line-height: 1.5;
}

/* Impact Section */
.impact-grid {
  max-width: 700px;
  margin: 0 auto;
  display: grid;
  gap: 12px;
}

.impact-item {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 14px 18px;
  background: white;
  border-radius: 6px;
  font-size: 0.95rem;
  color: #475569;
  box-shadow: 0 2px 8px rgba(3, 105, 161, 0.08);
}

.impact-bullet {
  color: #0369a1;
  font-size: 1.3rem;
  font-weight: 700;
  flex-shrink: 0;
}

/* Testimonials Carousel */
.testimonials-section {
  padding: 50px 24px;
  background: white;
}

.testimonial-carousel {
  position: relative;
  max-width: 900px;
  margin: 0 auto;
  display: flex;
  align-items: center;
  gap: 20px;
}

.testimonial-card {
  background: linear-gradient(135deg, #f0f9ff 0%, #e0f2fe 100%);
  padding: 40px;
  border-radius: 12px;
  box-shadow: 0 4px 20px rgba(3, 105, 161, 0.1);
  flex: 1;
  min-height: 250px;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.quote-icon {
  color: #0369a1;
  opacity: 0.3;
  margin-bottom: 16px;
}

.testimonial-text {
  font-size: 1.05rem;
  color: #475569;
  line-height: 1.7;
  margin-bottom: 24px;
  font-style: italic;
}

.testimonial-author {
  margin-top: auto;
}

.author-name {
  font-size: 1rem;
  font-weight: 700;
  color: #1e3a8a;
  margin-bottom: 4px;
}

.author-title {
  font-size: 0.9rem;
  color: #64748b;
}

.carousel-btn {
  width: 44px;
  height: 44px;
  border-radius: 50%;
  background: #1e3a8a;
  color: white;
  border: none;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: all 0.3s ease;
  flex-shrink: 0;
}

.carousel-btn:hover {
  background: #0369a1;
  transform: scale(1.1);
}

.carousel-dots {
  display: flex;
  justify-content: center;
  gap: 10px;
  margin-top: 24px;
}

.dot {
  width: 10px;
  height: 10px;
  border-radius: 50%;
  background: #cbd5e1;
  border: none;
  cursor: pointer;
  transition: all 0.3s ease;
  padding: 0;
}

.dot.active {
  background: #1e3a8a;
  width: 28px;
  border-radius: 5px;
}

/* Final CTA */
.cta-section {
  background: linear-gradient(135deg, #1e3a8a 0%, #0369a1 100%);
  color: white;
  padding: 60px 24px;
  text-align: center;
}

.cta-title {
  font-size: 2rem;
  font-weight: 700;
  margin-bottom: 16px;
}

.cta-text {
  font-size: 1.05rem;
  max-width: 700px;
  margin: 0 auto 30px;
  line-height: 1.6;
  opacity: 0.95;
}

/* Responsive */
@media (max-width: 768px) {
  .hero-title {
    font-size: 2rem;
  }
  
  .hero-subtitle {
    font-size: 1rem;
  }
  
  .button-group {
    flex-direction: column;
    width: 100%;
    gap: 12px;
  }
  
  .cta-button {
    width: 100%;
    justify-content: center;
  }
  
  .two-column-grid,
  .mission-vision-grid {
    grid-template-columns: 1fr;
  }
  
  .edge-grid {
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  }
  
  .testimonial-carousel {
    flex-direction: column;
  }
  
  .carousel-btn {
    display: none;
  }
  
  .testimonial-card {
    min-height: auto;
    padding: 30px 24px;
  }
  
  .main-title {
    font-size: 1.6rem;
  }
  
  .cta-title {
    font-size: 1.6rem;
  }
}

@media (max-width: 480px) {
  .hero-section,
  .content-section,
  .cta-section {
    padding: 40px 20px;
  }
  
  .column-card,
  .mission-card,
  .vision-card {
    padding: 24px;
  }
  
  .testimonial-card {
    padding: 24px 20px;
  }
}
</style>