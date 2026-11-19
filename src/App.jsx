import React, { useState, useEffect } from 'react';
import { Navbar, navItems } from './components/Navbar';
import { HeroSection } from './components/HeroSection';
import { EducationSection } from './components/EducationSection';
import { CoursesSection } from './components/CoursesSection';
import { BooksSection } from './components/BooksSection';
import { SkillsSection } from './components/SkillsSection';
import { ProjectsSection } from './components/ProjectsSection';
import { VolunteeringSection } from './components/VolunteeringSection';
import { HobbiesSection } from './components/HobbiesSection';
import { ContactSection } from './components/ContactSection';
import { Footer } from './components/Footer';

export function App() {
  const [activeSection, setActiveSection] = useState('hero');

  // Handle section scroll navigation
  const scrollToSection = (sectionId) => {
    setActiveSection(sectionId);
    const element = document.getElementById(sectionId);
    if (element) {
      element.scrollIntoView({ behavior: 'smooth' });
    }
  };

  const scrollToTop = () => {
    setActiveSection('hero');
    window.scrollTo({ top: 0, behavior: 'smooth' });
  };

  // Intersection Observer to highlight active navbar section during scroll
  useEffect(() => {
    const sectionIds = navItems.map((item) => item.sectionId);
    const observerOptions = {
      root: null,
      rootMargin: '-20% 0px -60% 0px',
      threshold: 0,
    };

    const handleIntersect = (entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          setActiveSection(entry.target.id);
        }
      });
    };

    const observer = new IntersectionObserver(handleIntersect, observerOptions);

    sectionIds.forEach((id) => {
      const el = document.getElementById(id);
      if (el) observer.observe(el);
    });

    return () => observer.disconnect();
  }, []);

  return (
    <div className="relative min-h-screen bg-background text-textPrimary selection:bg-accent selection:text-background">

      {/* Decorative Background Glowing Gradient Orbs matching Flutter HomeScreen */}
      <div className="fixed inset-0 pointer-events-none overflow-hidden z-0">
        <div className="absolute top-[-100px] left-[-100px] w-[500px] h-[500px] rounded-full bg-primary/15 blur-[120px]" />
        <div className="absolute top-[1200px] right-[-150px] w-[600px] h-[600px] rounded-full bg-secondary/10 blur-[150px]" />
        <div className="absolute bottom-[300px] left-[-100px] w-[500px] h-[500px] rounded-full bg-accent-purple/10 blur-[130px]" />
      </div>

      {/* Main Content Layer */}
      <div className="relative z-10">
        {/* Sticky Navbar */}
        <Navbar activeSection={activeSection} onNavigate={scrollToSection} />

        {/* 1. Hero Section */}
        <HeroSection
          onExploreProjects={() => scrollToSection('projects')}
          onContact={() => scrollToSection('contact')}
        />

        {/* 2. Education Section */}
        <EducationSection />

        {/* 3. Courses & Technologies Section */}
        <CoursesSection />

        {/* 4. Books Read Section */}
        <BooksSection />

        {/* 5. Skills Section */}
        <SkillsSection />

        {/* 6. Projects Showcase Section */}
        <ProjectsSection />

        {/* 7. Volunteering & Leadership Section */}
        <VolunteeringSection />

        {/* 8. Hobbies & Interests Section */}
        <HobbiesSection />

        {/* 9. Contact Section */}
        <ContactSection />

        {/* Footer */}
        <Footer onScrollToTop={scrollToTop} />
      </div>

    </div>
  );
}

export default App;
