import React, { useState } from 'react';
import { Coffee, Code, Smartphone, Flame, Database, CheckCircle2, ChevronRight, X, Info } from 'lucide-react';
import { portfolioData } from '../data/portfolioData';
import { getAssetUrl } from '../utils/getAssetUrl';

const iconMap = {
  Coffee: Coffee,
  Code: Code,
  Smartphone: Smartphone,
  Flame: Flame,
  Database: Database,
};

export const CoursesSection = () => {
  const [selectedModalCourse, setSelectedModalCourse] = useState(null);
  const [activeCourseId, setActiveCourseId] = useState(null);

  const toggleCourseCard = (id) => {
    setActiveCourseId(activeCourseId === id ? null : id);
  };

  return (
    <section id="courses" className="py-20 relative">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">

        {/* Section Header */}
        <div className="text-center max-w-3xl mx-auto mb-16">
          <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-secondary/10 border border-secondary/30 text-secondary text-xs font-semibold uppercase tracking-wider mb-3">
            Core Skillset & Stack
          </div>
          <h2 className="text-3xl sm:text-4xl font-bold text-textPrimary tracking-tight">
            Courses & Technologies Learned
          </h2>
          <p className="mt-4 text-textSecondary text-sm sm:text-base">
            Hover or tap on any technology card to reveal its detailed overview and core concepts.
          </p>
        </div>

        {/* Courses Cards Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {portfolioData.courses.map((course) => {
            const IconComponent = iconMap[course.iconName] || Code;
            const isSelected = activeCourseId === course.id;

            return (
              <div
                key={course.id}
                onClick={() => toggleCourseCard(course.id)}
                className={`glass-card rounded-3xl p-6 flex flex-col justify-between group cursor-pointer relative overflow-hidden transition-all duration-300 min-h-[300px] ${
                  isSelected ? 'border-accent/60 shadow-glow' : 'hover:border-accent/40'
                }`}
              >
                {/* Background Image Overlay */}
                <div
                  className="absolute inset-0 bg-cover bg-center opacity-10 group-hover:opacity-20 transition-opacity duration-500 pointer-events-none"
                  style={{ backgroundImage: `url(${course.backgroundImageUrl})` }}
                />

                {/* Default Front View */}
                <div className="relative z-10 flex flex-col justify-between h-full">
                  <div>
                    {/* Top Bar: Icon / Logo & Badge */}
                    <div className="flex items-center justify-between mb-5">
                      <div className="w-12 h-12 rounded-2xl bg-surface/80 border border-accent/20 p-2 flex items-center justify-center shadow-lg group-hover:scale-110 transition-transform">
                        {course.logoUrl ? (
                          <img
                            src={getAssetUrl(course.logoUrl)}
                            alt={course.title}
                            className="w-full h-full object-contain"
                          />
                        ) : (
                          <IconComponent className="w-6 h-6 text-accent" />
                        )}
                      </div>
                      <span
                        className="text-xs font-bold px-3 py-1 rounded-full bg-surface/90 border"
                        style={{ borderColor: course.themeColor, color: course.themeColor }}
                      >
                        {course.title}
                      </span>
                    </div>

                    {/* Title & Subtitle */}
                    <h3 className="text-xl font-bold text-textPrimary mb-1 group-hover:text-accent transition-colors">
                      {course.title}
                    </h3>
                    <h4 className="text-xs font-semibold text-textSecondary mb-3">
                      {course.subtitle}
                    </h4>

                    {/* Description preview */}
                    <p className="text-xs text-textSecondary line-clamp-3 leading-relaxed mb-4">
                      {course.description}
                    </p>
                  </div>

                  {/* Hint Bar */}
                  <div className="pt-3 border-t border-accent/10 flex items-center justify-between text-xs font-semibold text-accent group-hover:text-secondary">
                    <span className="flex items-center gap-1.5 text-[11px] font-medium text-textMuted group-hover:text-accent">
                      <Info className="w-3.5 h-3.5" />
                      <span>Hover or tap for key concepts</span>
                    </span>
                    <ChevronRight className="w-4 h-4 group-hover:translate-x-1 transition-transform" />
                  </div>
                </div>

                {/* Hover / Touch Revealing Overlay */}
                <div
                  onClick={(e) => {
                    e.stopPropagation();
                    toggleCourseCard(course.id);
                  }}
                  className={`absolute inset-0 bg-surface/95 backdrop-blur-md p-6 flex flex-col justify-between border-2 border-accent/40 rounded-3xl transition-all duration-300 z-20 ${
                    isSelected
                      ? 'opacity-100 translate-y-0 pointer-events-auto'
                      : 'opacity-0 translate-y-4 group-hover:opacity-100 group-hover:translate-y-0 pointer-events-none group-hover:pointer-events-auto'
                  }`}
                >
                  <div>
                    <div className="flex items-center justify-between mb-3">
                      <div className="flex items-center gap-2">
                        <div className="w-8 h-8 rounded-xl bg-surface border border-accent/20 p-1 flex items-center justify-center">
                          <img src={getAssetUrl(course.logoUrl)} alt={course.title} className="w-full h-full object-contain" />
                        </div>
                        <span className="text-sm font-bold text-textPrimary">{course.title} Overview</span>
                      </div>
                      <button
                        onClick={(e) => {
                          e.stopPropagation();
                          toggleCourseCard(course.id);
                        }}
                        className="p-1 rounded-lg bg-surface border border-accent/20 text-textSecondary hover:text-textPrimary"
                        aria-label="Close card"
                      >
                        <X className="w-4 h-4" />
                      </button>
                    </div>

                    <p className="text-xs text-textSecondary leading-relaxed mb-4">
                      {course.description}
                    </p>

                    <h5 className="text-[11px] font-bold uppercase tracking-wider text-accent mb-2">
                      Key Concepts ({course.keyConcepts.length}):
                    </h5>
                    <ul className="space-y-1.5">
                      {course.keyConcepts.map((concept, i) => (
                        <li key={i} className="flex items-start gap-2 text-[11px] text-textPrimary">
                          <CheckCircle2 className="w-3.5 h-3.5 text-emerald-400 shrink-0 mt-0.5" />
                          <span className="line-clamp-1">{concept}</span>
                        </li>
                      ))}
                    </ul>
                  </div>

                  <div className="pt-3 border-t border-accent/15 flex items-center justify-between text-[11px]">
                    <button
                      onClick={(e) => {
                        e.stopPropagation();
                        setSelectedModalCourse(course);
                      }}
                      className="text-accent font-semibold hover:underline"
                    >
                      Open Full Dialog
                    </button>
                    <button
                      onClick={(e) => {
                        e.stopPropagation();
                        toggleCourseCard(course.id);
                      }}
                      className="text-textSecondary font-semibold px-2 py-0.5 rounded bg-surface border border-accent/20 hover:text-textPrimary"
                    >
                      Close ✕
                    </button>
                  </div>
                </div>

              </div>
            );
          })}
        </div>

        {/* Detailed Full Modal Dialog */}
        {selectedModalCourse && (
          <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/80 backdrop-blur-md animate-fade-in">
            <div className="glass-panel max-w-lg w-full rounded-3xl p-6 sm:p-8 relative border-2 border-accent/40 shadow-2xl">
              <button
                onClick={() => setSelectedModalCourse(null)}
                className="absolute top-4 right-4 p-2 rounded-xl bg-surface/80 border border-accent/20 text-textSecondary hover:text-textPrimary"
                aria-label="Close dialog"
              >
                <X className="w-5 h-5" />
              </button>

              <div className="flex items-center gap-4 mb-4">
                <div className="w-12 h-12 rounded-2xl bg-surface/90 border border-accent/20 p-2 flex items-center justify-center">
                  <img src={getAssetUrl(selectedModalCourse.logoUrl)} alt={selectedModalCourse.title} className="w-full h-full object-contain" />
                </div>
                <div>
                  <h3 className="text-2xl font-bold text-textPrimary">{selectedModalCourse.title}</h3>
                  <span className="text-xs font-medium text-textSecondary">{selectedModalCourse.subtitle}</span>
                </div>
              </div>

              <p className="text-sm text-textSecondary mb-6 leading-relaxed">
                {selectedModalCourse.description}
              </p>

              <h4 className="text-xs font-bold uppercase tracking-wider text-accent mb-3">
                Key Concepts Covered
              </h4>
              <ul className="space-y-3 mb-6">
                {selectedModalCourse.keyConcepts.map((concept, i) => (
                  <li key={i} className="flex items-start gap-3 text-xs sm:text-sm text-textPrimary">
                    <CheckCircle2 className="w-4 h-4 text-emerald-400 shrink-0 mt-0.5" />
                    <span>{concept}</span>
                  </li>
                ))}
              </ul>

              <button
                onClick={() => setSelectedModalCourse(null)}
                className="w-full py-3 rounded-xl bg-gradient-to-r from-primary to-secondary text-white font-semibold text-sm shadow-lg text-center"
              >
                Close Dialog
              </button>
            </div>
          </div>
        )}

      </div>
    </section>
  );
};
