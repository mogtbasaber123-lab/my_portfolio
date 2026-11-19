import React, { useState } from 'react';
import { ShoppingBag, Home, ExternalLink, ArrowRight, Layers } from 'lucide-react';
import { portfolioData } from '../data/portfolioData';
import { GithubIcon } from './BrandIcons';
import { ProjectDetailModal } from './ProjectDetailModal';

const iconMap = {
  ShoppingBag: ShoppingBag,
  Home: Home,
};

export const ProjectsSection = () => {
  const [activeProject, setActiveProject] = useState(null);

  return (
    <section id="projects" className="py-20 relative">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">

        {/* Section Header */}
        <div className="text-center max-w-3xl mx-auto mb-16">
          <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-secondary/10 border border-secondary/30 text-secondary text-xs font-semibold uppercase tracking-wider mb-3">
            Portfolio Showcase
          </div>
          <h2 className="text-3xl sm:text-4xl font-bold text-textPrimary tracking-tight">
            Featured Mobile Applications
          </h2>
          <p className="mt-4 text-textSecondary text-sm sm:text-base">
            Real-world mobile apps built with clean architecture, state management, and modern UI/UX design.
          </p>
        </div>

        {/* Projects Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-8 max-w-5xl mx-auto">
          {portfolioData.projects.map((project) => {
            const IconComponent = iconMap[project.iconName] || Layers;
            return (
              <div
                key={project.id}
                className="glass-card rounded-3xl p-6 sm:p-8 flex flex-col justify-between group cursor-pointer relative overflow-hidden"
                onClick={() => setActiveProject(project)}
              >
                <div>
                  {/* Category & Icon */}
                  <div className="flex items-center justify-between mb-6">
                    <div className="w-14 h-14 rounded-2xl bg-gradient-to-br from-primary/30 to-secondary/30 border border-accent/30 flex items-center justify-center text-accent group-hover:scale-110 transition-transform">
                      <IconComponent className="w-7 h-7" />
                    </div>
                    <span className="text-xs font-bold px-3 py-1.5 rounded-full bg-primary/20 text-accent border border-accent/30">
                      {project.category}
                    </span>
                  </div>

                  {/* Title & Subtitle */}
                  <h3 className="text-2xl font-bold text-textPrimary mb-1 group-hover:text-accent transition-colors">
                    {project.title}
                  </h3>
                  <h4 className="text-xs font-semibold text-secondary mb-4">
                    {project.subtitle}
                  </h4>

                  {/* Description */}
                  <p className="text-xs sm:text-sm text-textSecondary leading-relaxed mb-6">
                    {project.shortDescription}
                  </p>

                  {/* Tech Tags */}
                  <div className="flex flex-wrap gap-2 mb-6">
                    {project.techStack.map((tech, i) => (
                      <span
                        key={i}
                        className="px-2.5 py-1 rounded-xl bg-surface-light/60 text-textSecondary text-[11px] font-medium border border-accent/15"
                      >
                        {tech}
                      </span>
                    ))}
                  </div>
                </div>

                {/* Footer Action Links */}
                <div className="pt-4 border-t border-accent/15 flex items-center justify-between">
                  <span className="inline-flex items-center gap-2 text-xs font-semibold text-accent group-hover:text-secondary">
                    <span>View Architecture Details</span>
                    <ArrowRight className="w-4 h-4 group-hover:translate-x-1 transition-transform" />
                  </span>

                  <div className="flex items-center gap-2" onClick={(e) => e.stopPropagation()}>
                    <a
                      href={project.githubUrl}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="p-2 rounded-xl glass-button text-textSecondary hover:text-accent"
                      aria-label="GitHub Repository"
                    >
                      <GithubIcon className="w-4 h-4" />
                    </a>
                    <a
                      href={project.liveUrl}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="p-2 rounded-xl glass-button text-textSecondary hover:text-accent"
                      aria-label="Live Demo"
                    >
                      <ExternalLink className="w-4 h-4" />
                    </a>
                  </div>
                </div>
              </div>
            );
          })}
        </div>

        {/* Project Detail Dialog Modal */}
        <ProjectDetailModal
          project={activeProject}
          onClose={() => setActiveProject(null)}
        />

      </div>
    </section>
  );
};
