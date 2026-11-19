import React, { useState } from 'react';
import { Smartphone, Code, GitBranch, MessageSquare, Info } from 'lucide-react';
import { portfolioData } from '../data/portfolioData';

const iconMap = {
  Smartphone: Smartphone,
  Code: Code,
  GitBranch: GitBranch,
  MessageSquare: MessageSquare,
};

export const SkillsSection = () => {
  const [activeSkillId, setActiveSkillId] = useState(null);

  const toggleSkill = (id) => {
    setActiveSkillId(activeSkillId === id ? null : id);
  };

  return (
    <section id="skills" className="py-20 relative">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">

        {/* Section Header */}
        <div className="text-center max-w-3xl mx-auto mb-16">
          <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-primary/10 border border-primary/30 text-accent text-xs font-semibold uppercase tracking-wider mb-3">
            Proficiency Overview
          </div>
          <h2 className="text-3xl sm:text-4xl font-bold text-textPrimary tracking-tight">
            Technical & Soft Skills
          </h2>
          <p className="mt-4 text-textSecondary text-sm sm:text-base">
            Hover or tap on any skill card to expand its technical overview & experience details.
          </p>
        </div>

        {/* Skills Cards Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6 max-w-5xl mx-auto">
          {portfolioData.skills.map((skill) => {
            const IconComponent = iconMap[skill.iconName] || Code;
            const isSelected = activeSkillId === skill.id;

            return (
              <div
                key={skill.id}
                onClick={() => toggleSkill(skill.id)}
                className={`glass-card p-6 rounded-3xl relative overflow-hidden group cursor-pointer transition-all duration-300 ${
                  isSelected ? 'border-accent/60 shadow-glow bg-surface/90' : 'hover:border-accent/40'
                }`}
              >
                {/* Header Row */}
                <div className="flex items-center justify-between mb-4">
                  <div className="flex items-center gap-3">
                    <div className="w-12 h-12 rounded-2xl bg-primary/20 border border-accent/30 flex items-center justify-center text-accent group-hover:scale-110 transition-transform">
                      <IconComponent className="w-6 h-6" />
                    </div>
                    <div>
                      <h3 className="text-base font-bold text-textPrimary group-hover:text-accent transition-colors">
                        {skill.name}
                      </h3>
                      <span className="text-xs font-semibold text-secondary">
                        {skill.levelTag}
                      </span>
                    </div>
                  </div>
                  <span className="text-lg font-bold text-accent">
                    {skill.proficiency}%
                  </span>
                </div>

                {/* Progress Bar Container */}
                <div className="w-full h-3 rounded-full bg-surface-light/60 overflow-hidden border border-accent/20 p-0.5 mb-3">
                  <div
                    className="h-full rounded-full bg-gradient-to-r from-primary via-accent to-secondary transition-all duration-1000"
                    style={{ width: `${skill.proficiency}%` }}
                  />
                </div>

                {/* Hover / Tap Revealed Description Drawer */}
                <div
                  className={`overflow-hidden transition-all duration-300 ${
                    isSelected
                      ? 'max-h-40 opacity-100 mt-4 pt-3 border-t border-accent/20'
                      : 'max-h-0 opacity-0 group-hover:max-h-40 group-hover:opacity-100 group-hover:mt-4 group-hover:pt-3 group-hover:border-t group-hover:border-accent/20'
                  }`}
                >
                  <div className="flex items-start gap-2 text-xs text-textSecondary leading-relaxed">
                    <p>{skill.description}</p>
                  </div>
                </div>

                {/* Hover Indicator Hint */}
                <div className="flex items-center justify-between text-[11px] font-medium text-textMuted pt-1 group-hover:text-accent">
                  <span className="flex items-center gap-1">
                    <Info className="w-3 h-3" />
                    <span>Hover or tap for details</span>
                  </span>
                </div>

              </div>
            );
          })}
        </div>

      </div>
    </section>
  );
};
