import React from 'react';
import { GraduationCap, BookOpen, History } from 'lucide-react';
import { portfolioData } from '../data/portfolioData';

const iconMap = {
  GraduationCap: GraduationCap,
  BookOpen: BookOpen,
  History: History,
};

export const EducationSection = () => {
  return (
    <section id="education" className="py-20 relative">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">

        {/* Section Header */}
        <div className="text-center max-w-3xl mx-auto mb-16">
          <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-primary/10 border border-primary/30 text-accent text-xs font-semibold uppercase tracking-wider mb-3">
            Academic Background
          </div>
          <h2 className="text-3xl sm:text-4xl font-bold text-textPrimary tracking-tight">
            Education Journey
          </h2>
          <p className="mt-4 text-textSecondary text-sm sm:text-base">
            Formal education laying the groundwork for algorithmic reasoning and software engineering discipline.
          </p>
        </div>

        {/* Education Timeline Cards */}
        <div className="space-y-6 max-w-4xl mx-auto">
          {portfolioData.educationList.map((item, idx) => {
            const IconComponent = iconMap[item.iconName] || GraduationCap;
            return (
              <div
                key={idx}
                className="glass-card p-6 sm:p-8 rounded-3xl relative overflow-hidden group hover:border-accent/40"
              >
                <div className="flex flex-col sm:flex-row items-start sm:items-center gap-5">
                  {/* Icon Badge */}
                  <div className="w-14 h-14 rounded-2xl bg-gradient-to-br from-primary/30 to-secondary/30 border border-accent/30 flex items-center justify-center shrink-0 group-hover:scale-110 transition-transform">
                    <IconComponent className="w-7 h-7 text-accent" />
                  </div>

                  {/* Main Content */}
                  <div className="flex-1">
                    <div className="flex flex-wrap items-center justify-between gap-2 mb-2">
                      <h3 className="text-xl font-bold text-textPrimary group-hover:text-accent transition-colors">
                        {item.degree}
                      </h3>
                      <span className="px-3 py-1 rounded-full text-xs font-semibold bg-accent/15 text-accent border border-accent/30">
                        {item.status}
                      </span>
                    </div>

                    <h4 className="text-sm font-semibold text-secondary mb-3">
                      {item.institution}
                    </h4>

                    <p className="text-sm text-textSecondary leading-relaxed">
                      {item.description}
                    </p>
                  </div>
                </div>
              </div>
            );
          })}
        </div>

      </div>
    </section>
  );
};
