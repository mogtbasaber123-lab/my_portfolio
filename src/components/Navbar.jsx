import React, { useState, useEffect } from 'react';
import { Menu, X, Code2 } from 'lucide-react';
import { portfolioData } from '../data/portfolioData';

export const navItems = [
  { name: 'Home', sectionId: 'hero' },
  { name: 'Education', sectionId: 'education' },
  { name: 'Courses & Tech', sectionId: 'courses' },
  { name: 'Books Read', sectionId: 'books' },
  { name: 'Skills', sectionId: 'skills' },
  { name: 'Projects', sectionId: 'projects' },
  { name: 'Volunteering', sectionId: 'volunteering' },
  { name: 'Hobbies', sectionId: 'hobbies' },
  { name: 'Contact', sectionId: 'contact' },
];

export const Navbar = ({ activeSection, onNavigate }) => {
  const [isScrolled, setIsScrolled] = useState(false);
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

  useEffect(() => {
    const handleScroll = () => {
      if (window.scrollY > 20) {
        setIsScrolled(true);
      } else {
        setIsScrolled(false);
      }
    };
    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  const handleLinkClick = (sectionId) => {
    onNavigate(sectionId);
    setMobileMenuOpen(false);
  };

  return (
    <header
      className={`fixed top-0 left-0 right-0 z-50 transition-all duration-300 ${
        isScrolled
          ? 'bg-surface/80 backdrop-blur-md border-b border-accent/20 py-3 shadow-lg shadow-black/20'
          : 'bg-transparent py-5'
      }`}
    >
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex items-center justify-between">
        {/* Logo / Name */}
        <button
          onClick={() => handleLinkClick('hero')}
          className="flex items-center gap-3 group text-left focus:outline-none"
        >
          <div className="w-10 h-10 rounded-xl bg-gradient-to-br from-primary to-secondary p-0.5 flex items-center justify-center shadow-md shadow-primary/30 group-hover:scale-105 transition-transform">
            <div className="w-full h-full bg-background/90 rounded-[10px] flex items-center justify-center">
              <Code2 className="w-5 h-5 text-accent" />
            </div>
          </div>
          <div>
            <span className="text-lg font-bold text-textPrimary tracking-tight block group-hover:text-accent transition-colors">
              {portfolioData.developerName}
            </span>
            <span className="text-xs text-textSecondary font-medium hidden sm:block">
              Flutter & Software Engineer
            </span>
          </div>
        </button>

        {/* Desktop Navigation Links */}
        <nav className="hidden lg:flex items-center gap-1 xl:gap-2 bg-surface/40 backdrop-blur-md px-4 py-1.5 rounded-full border border-accent/15">
          {navItems.map((item) => {
            const isActive = activeSection === item.sectionId;
            return (
              <button
                key={item.sectionId}
                onClick={() => handleLinkClick(item.sectionId)}
                className={`px-3 py-1.5 rounded-full text-xs font-semibold transition-all duration-200 ${
                  isActive
                    ? 'bg-accent/20 text-accent border border-accent/40 shadow-sm shadow-accent/10'
                    : 'text-textSecondary hover:text-textPrimary hover:bg-surface-light/50'
                }`}
              >
                {item.name}
              </button>
            );
          })}
        </nav>

        {/* Action Button */}
        <div className="hidden lg:block">
          <button
            onClick={() => handleLinkClick('contact')}
            className="px-5 py-2.5 rounded-xl bg-gradient-to-r from-primary to-secondary text-white font-semibold text-xs tracking-wide shadow-md shadow-primary/30 hover:shadow-accent/40 hover:scale-105 transition-all"
          >
            Get In Touch
          </button>
        </div>

        {/* Mobile menu toggle button */}
        <div className="lg:hidden flex items-center">
          <button
            onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
            className="p-2 rounded-xl bg-surface/80 border border-accent/20 text-textPrimary hover:text-accent focus:outline-none"
            aria-label="Toggle menu"
          >
            {mobileMenuOpen ? <X className="w-6 h-6" /> : <Menu className="w-6 h-6" />}
          </button>
        </div>
      </div>

      {/* Mobile Drawer Menu */}
      {mobileMenuOpen && (
        <div className="lg:hidden bg-surface/95 backdrop-blur-xl border-b border-accent/20 px-4 pt-3 pb-6 shadow-2xl transition-all">
          <div className="flex flex-col gap-2 max-w-md mx-auto">
            {navItems.map((item) => {
              const isActive = activeSection === item.sectionId;
              return (
                <button
                  key={item.sectionId}
                  onClick={() => handleLinkClick(item.sectionId)}
                  className={`w-full text-left px-4 py-2.5 rounded-xl text-sm font-semibold transition-all flex items-center justify-between ${
                    isActive
                      ? 'bg-accent/20 text-accent border border-accent/40'
                      : 'text-textSecondary hover:text-textPrimary hover:bg-surface-light/60'
                  }`}
                >
                  <span>{item.name}</span>
                  {isActive && <div className="w-2 h-2 rounded-full bg-accent animate-pulse" />}
                </button>
              );
            })}
            <div className="pt-3 mt-2 border-t border-accent/10">
              <button
                onClick={() => handleLinkClick('contact')}
                className="w-full py-3 rounded-xl bg-gradient-to-r from-primary to-secondary text-white font-semibold text-sm shadow-lg text-center"
              >
                Get In Touch
              </button>
            </div>
          </div>
        </div>
      )}
    </header>
  );
};
