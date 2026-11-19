import React from 'react';
import { Download, ArrowRight, Mail, FolderCode, Layers, BookOpen } from 'lucide-react';
import { portfolioData } from '../data/portfolioData';
import { GithubIcon, LinkedinIcon, WhatsappIcon, FacebookIcon } from './BrandIcons';
import { getAssetUrl } from '../utils/getAssetUrl';

export const HeroSection = ({ onExploreProjects, onContact }) => {
  return (
    <section id="hero" className="relative pt-32 pb-20 md:pt-40 md:pb-28 overflow-hidden">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-12 lg:gap-8 items-center">

          {/* Left Column: Bio & Text (Order 2 on Mobile, Order 1 on Desktop) */}
          <div className="order-2 lg:order-1 lg:col-span-7 flex flex-col items-start space-y-6">

            {/* Status Badge */}
            <div className="inline-flex items-center gap-2.5 px-4 py-2 rounded-full glass-panel border border-accent/30 text-accent text-xs font-semibold tracking-wide">
              <span>{portfolioData.title}</span>
            </div>

            {/* Main Greeting / Title */}
            <h1 className="text-4xl sm:text-5xl xl:text-6xl font-extrabold text-textPrimary leading-tight tracking-tight">
              Hello, I'm <span className="text-transparent bg-clip-text bg-gradient-to-r from-secondary via-accent to-accent-purple">{portfolioData.developerName}</span>
            </h1>

            {/* Detailed Bio Paragraphs */}
            <div className="space-y-4 text-textSecondary text-base sm:text-lg leading-relaxed font-normal">
              <p className="font-medium text-textPrimary">
                {portfolioData.bioParagraph1}
              </p>
              <p className="text-sm sm:text-base text-textSecondary">
                {portfolioData.bioParagraph2}
              </p>
              <p className="text-xs sm:text-sm text-textMuted italic border-l-2 border-accent/40 pl-4 py-1">
                {portfolioData.bioParagraph3}
              </p>
            </div>

            {/* Action Buttons */}
            <div className="flex flex-wrap items-center gap-4 pt-2">
              <button
                onClick={onExploreProjects}
                className="inline-flex items-center gap-2.5 px-6 py-3.5 rounded-xl bg-gradient-to-r from-primary to-secondary text-white font-semibold text-sm shadow-lg shadow-primary/30 hover:shadow-accent/40 hover:-translate-y-0.5 transition-all group"
              >
                <span>Explore Projects</span>
                <ArrowRight className="w-4 h-4 group-hover:translate-x-1 transition-transform" />
              </button>

              <button
                onClick={onContact}
                className="inline-flex items-center gap-2.5 px-6 py-3.5 rounded-xl glass-button text-accent font-semibold text-sm hover:-translate-y-0.5 transition-all"
              >
                <Mail className="w-4 h-4" />
                <span>Contact Me</span>
              </button>

              <a
                href={portfolioData.cvDownloadUrl}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-2 px-5 py-3.5 rounded-xl border border-accent/20 bg-surface/50 text-textSecondary hover:text-textPrimary hover:bg-surface-light/60 font-semibold text-sm transition-all"
              >
                <Download className="w-4 h-4" />
                <span>Download CV</span>
              </a>
            </div>

            {/* Social Links */}
            <div className="pt-4 flex items-center gap-4">
              <span className="text-xs font-semibold text-textMuted uppercase tracking-wider">Connect:</span>
              <div className="flex items-center gap-3">
                <a
                  href={portfolioData.githubUrl}
                  target="_blank"
                  rel="noopener noreferrer"
                  aria-label="GitHub"
                  className="w-10 h-10 rounded-xl glass-button flex items-center justify-center text-textSecondary hover:text-accent hover:border-accent/40 transition-all"
                >
                  <GithubIcon className="w-5 h-5" />
                </a>
                <a
                  href={portfolioData.linkedinUrl}
                  target="_blank"
                  rel="noopener noreferrer"
                  aria-label="LinkedIn"
                  className="w-10 h-10 rounded-xl glass-button flex items-center justify-center text-textSecondary hover:text-accent hover:border-accent/40 transition-all"
                >
                  <LinkedinIcon className="w-5 h-5" />
                </a>
                <a
                  href={portfolioData.whatsappUrl}
                  target="_blank"
                  rel="noopener noreferrer"
                  aria-label="WhatsApp"
                  className="w-10 h-10 rounded-xl glass-button flex items-center justify-center text-textSecondary hover:text-accent hover:border-accent/40 transition-all"
                >
                  <WhatsappIcon className="w-5 h-5" />
                </a>
                <a
                  href={portfolioData.facebookUrl}
                  target="_blank"
                  rel="noopener noreferrer"
                  aria-label="Facebook"
                  className="w-10 h-10 rounded-xl glass-button flex items-center justify-center text-textSecondary hover:text-accent hover:border-accent/40 transition-all"
                >
                  <FacebookIcon className="w-5 h-5" />
                </a>
              </div>
            </div>

          </div>

          {/* Right Column: Profile Picture & Stats (Order 1 on Mobile, Order 2 on Desktop) */}
          <div className="order-1 lg:order-2 lg:col-span-5 flex flex-col items-center">

            {/* Profile Frame */}
            <div className="relative group">
              {/* Outer Glow Halo */}
              <div className="absolute -inset-1 bg-gradient-to-r from-primary via-accent to-accent-purple rounded-3xl blur-xl opacity-40 group-hover:opacity-70 transition duration-500"></div>

              {/* Profile Glass Frame */}
              <div className="relative w-64 h-64 sm:w-80 sm:h-80 rounded-3xl overflow-hidden glass-panel border-2 border-accent/30 shadow-2xl p-2 bg-surface/80">
                <img
                  src={getAssetUrl(portfolioData.profileImageUrl)}
                  alt={portfolioData.developerName}
                  className="w-full h-full object-cover object-center rounded-2xl group-hover:scale-105 transition-transform duration-500"
                />
              </div>

              {/* Floating Status Pill */}
              <div className="absolute -bottom-4 right-4 glass-panel border border-accent/40 px-4 py-2 rounded-2xl shadow-xl flex items-center gap-2">
                <span className="w-3 h-3 rounded-full bg-emerald-500 animate-ping" />
                <span className="text-xs font-bold text-textPrimary">Open to Opportunities</span>
              </div>
            </div>

            {/* Quick Stats Grid */}
            <div className="grid grid-cols-3 gap-3 w-full mt-10">

              <div className="glass-card p-4 rounded-2xl flex flex-col items-center text-center">
                <div className="w-9 h-9 rounded-xl bg-primary/20 text-accent flex items-center justify-center mb-2">
                  <FolderCode className="w-5 h-5" />
                </div>
                <span className="text-2xl font-bold text-textPrimary">{portfolioData.projectsCompleted}+</span>
                <span className="text-[11px] font-medium text-textSecondary">Projects</span>
              </div>

              <div className="glass-card p-4 rounded-2xl flex flex-col items-center text-center">
                <div className="w-9 h-9 rounded-xl bg-secondary/20 text-secondary flex items-center justify-center mb-2">
                  <Layers className="w-5 h-5" />
                </div>
                <span className="text-2xl font-bold text-textPrimary">{portfolioData.technologiesLearned}+</span>
                <span className="text-[11px] font-medium text-textSecondary">Tech Stack</span>
              </div>

              <div className="glass-card p-4 rounded-2xl flex flex-col items-center text-center">
                <div className="w-9 h-9 rounded-xl bg-accent-purple/20 text-accent-purple flex items-center justify-center mb-2">
                  <BookOpen className="w-5 h-5" />
                </div>
                <span className="text-2xl font-bold text-textPrimary">{portfolioData.booksReadCount}</span>
                <span className="text-[11px] font-medium text-textSecondary">Books Read</span>
              </div>

            </div>

          </div>

        </div>
      </div>
    </section>
  );
};
