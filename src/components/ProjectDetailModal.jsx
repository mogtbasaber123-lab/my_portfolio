import React from 'react';
import { X, ExternalLink, CheckCircle2, Layers, Cpu } from 'lucide-react';
import { GithubIcon } from './BrandIcons';

export const ProjectDetailModal = ({ project, onClose }) => {
  if (!project) return null;

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/80 backdrop-blur-md overflow-y-auto animate-fade-in">
      <div className="glass-panel max-w-2xl w-full rounded-3xl p-6 sm:p-8 relative border-2 border-accent/40 shadow-2xl max-h-[90vh] overflow-y-auto my-8">

        {/* Close Button */}
        <button
          onClick={onClose}
          className="absolute top-4 right-4 p-2 rounded-xl bg-surface/80 border border-accent/20 text-textSecondary hover:text-textPrimary hover:border-accent/40 transition-colors"
          aria-label="Close dialog"
        >
          <X className="w-5 h-5" />
        </button>

        {/* Modal Header */}
        <div className="mb-6">
          <span className="inline-block px-3 py-1 rounded-full text-xs font-bold bg-primary/20 text-accent border border-accent/30 mb-2">
            {project.category}
          </span>
          <h3 className="text-2xl sm:text-3xl font-extrabold text-textPrimary">
            {project.title}
          </h3>
          <p className="text-sm font-semibold text-secondary mt-1">
            {project.subtitle}
          </p>
        </div>

        {/* Tech Stack Badges */}
        <div className="flex flex-wrap gap-2 mb-6">
          {project.techStack.map((tech, i) => (
            <span
              key={i}
              className="px-3 py-1 rounded-xl bg-surface-light/70 text-textPrimary text-xs font-semibold border border-accent/20"
            >
              {tech}
            </span>
          ))}
        </div>

        {/* Full Description */}
        <div className="mb-6">
          <h4 className="text-xs font-bold uppercase tracking-wider text-accent mb-2">
            Project Overview
          </h4>
          <p className="text-sm text-textSecondary leading-relaxed">
            {project.fullDescription}
          </p>
        </div>

        {/* Features List */}
        <div className="mb-6">
          <h4 className="text-xs font-bold uppercase tracking-wider text-accent mb-3 flex items-center gap-2">
            <Layers className="w-4 h-4 text-secondary" />
            <span>Key User Features</span>
          </h4>
          <ul className="space-y-2.5">
            {project.features.map((feature, i) => (
              <li key={i} className="flex items-start gap-2.5 text-xs sm:text-sm text-textPrimary">
                <CheckCircle2 className="w-4 h-4 text-emerald-400 shrink-0 mt-0.5" />
                <span>{feature}</span>
              </li>
            ))}
          </ul>
        </div>

        {/* Architecture & Engineering Highlights */}
        <div className="mb-8">
          <h4 className="text-xs font-bold uppercase tracking-wider text-accent mb-3 flex items-center gap-2">
            <Cpu className="w-4 h-4 text-accent-purple" />
            <span>Architecture & Engineering Design</span>
          </h4>
          <ul className="space-y-2.5">
            {project.architecturePoints.map((point, i) => (
              <li key={i} className="flex items-start gap-2.5 text-xs sm:text-sm text-textSecondary">
                <div className="w-1.5 h-1.5 rounded-full bg-accent shrink-0 mt-2" />
                <span>{point}</span>
              </li>
            ))}
          </ul>
        </div>

        {/* Action Links */}
        <div className="flex flex-wrap items-center gap-4 pt-4 border-t border-accent/15">
          <a
            href={project.githubUrl}
            target="_blank"
            rel="noopener noreferrer"
            className="flex-1 inline-flex items-center justify-center gap-2 px-5 py-3 rounded-xl glass-button text-textPrimary font-semibold text-xs hover:border-accent/40"
          >
            <GithubIcon className="w-4 h-4" />
            <span>GitHub Repository</span>
          </a>

          <a
            href={project.liveUrl}
            target="_blank"
            rel="noopener noreferrer"
            className="flex-1 inline-flex items-center justify-center gap-2 px-5 py-3 rounded-xl bg-gradient-to-r from-primary to-secondary text-white font-semibold text-xs shadow-lg shadow-primary/30 hover:shadow-accent/40"
          >
            <ExternalLink className="w-4 h-4" />
            <span>Live Project Demo</span>
          </a>
        </div>

      </div>
    </div>
  );
};
