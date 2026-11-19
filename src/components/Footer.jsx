import React from 'react';
import { ArrowUp, Code2, Heart } from 'lucide-react';
import { portfolioData } from '../data/portfolioData';

export const Footer = ({ onScrollToTop }) => {
  return (
    <footer className="relative bg-surface/80 border-t border-accent/20 pt-12 pb-8">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">

        {/* Top Row: Brand & Back to Top */}
        <div className="flex flex-col sm:flex-row items-center justify-between gap-6 pb-8 border-b border-accent/10">

          <div className="flex items-center gap-3">
            <div className="w-10 h-10 rounded-xl bg-gradient-to-br from-primary to-secondary p-0.5 flex items-center justify-center shadow-md">
              <div className="w-full h-full bg-background/90 rounded-[10px] flex items-center justify-center">
                <Code2 className="w-5 h-5 text-accent" />
              </div>
            </div>
            <div>
              <span className="text-base font-bold text-textPrimary block">
                {portfolioData.developerName}
              </span>
              <span className="text-xs text-textSecondary">
                {portfolioData.title}
              </span>
            </div>
          </div>

          <button
            onClick={onScrollToTop}
            className="inline-flex items-center gap-2 px-4 py-2.5 rounded-xl glass-button text-accent text-xs font-semibold hover:border-accent/50 transition-all group"
          >
            <span>Back to Top</span>
            <ArrowUp className="w-4 h-4 group-hover:-translate-y-1 transition-transform" />
          </button>

        </div>

        {/* Bottom Row: Copyright */}
        <div className="pt-6 flex flex-col sm:flex-row items-center justify-between gap-4 text-xs text-textMuted">
          <p>© {new Date().getFullYear()} {portfolioData.developerName}. All rights reserved.</p>
          <p className="flex items-center gap-1">
            <span>Crafted with</span>
            <Heart className="w-3.5 h-3.5 text-rose-500 fill-rose-500" />
            <span>using React & Tailwind CSS</span>
          </p>
        </div>

      </div>
    </footer>
  );
};
