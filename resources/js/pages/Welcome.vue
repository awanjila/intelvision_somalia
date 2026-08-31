<template>
  <div>
    <HeroSection />
    
    <ServicesSection />
    <BlogSection />
  </div>
</template>

<script setup>
import HeroSection from '@/components/HeroSection.vue'

import ServicesSection from '@/components/ServicesSection.vue'
import BlogSection from '@/components/BlogSection.vue'
import { faHotTubPerson } from '@fortawesome/free-solid-svg-icons'
</script>

<style scoped>
/* Optional page-level styling */
</style>
