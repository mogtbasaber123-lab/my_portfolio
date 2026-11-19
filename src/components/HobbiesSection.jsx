import React from 'react';
import { Radio, BookOpen, Terminal, Compass, HeartHandshake } from 'lucide-react';
import { portfolioData } from '../data/portfolioData';

const iconMap = {
  Radio: Radio,
  BookOpen: BookOpen,
  Terminal: Terminal,
  Compass: Compass,
  HeartHandshake: HeartHandshake,
};

export const HobbiesSection = () => {
  return (
    <section id="hobbies" className="py-20 relative">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">

        {/* Section Header */}
        <div className="text-center max-w-3xl mx-auto mb-16">
          <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-accent/10 border border-accent/30 text-accent text-xs font-semibold uppercase tracking-wider mb-3">
            Personal Interests
          </div>
          <h2 className="text-3xl sm:text-4xl font-bold text-textPrimary tracking-tight">
            Hobbies & Activities
          </h2>
          <p className="mt-4 text-textSecondary text-sm sm:text-base">
            What keeps me curious, inspired, and continuously growing outside of formal engineering work.
          </p>
        </div>

        {/* Hobbies Grid */}
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-6">
          {portfolioData.hobbies.map((hobby, idx) => {
            const IconComponent = iconMap[hobby.iconName] || Terminal;
            return (
              <div
                key={idx}
                className="glass-card rounded-3xl p-6 flex flex-col items-start justify-between group hover:border-accent/40"
              >
                <div>
                  <div
                    className="w-12 h-12 rounded-2xl flex items-center justify-center text-white mb-5 shadow-lg group-hover:scale-110 transition-transform"
                    style={{ backgroundColor: hobby.accentColor }}
                  >
                    <IconComponent className="w-6 h-6" />
                  </div>

                  <h3 className="text-base font-bold text-textPrimary mb-2 group-hover:text-accent transition-colors">
                    {hobby.title}
                  </h3>

                  <p className="text-xs text-textSecondary leading-relaxed">
                    {hobby.description}
                  </p>
                </div>
              </div>
            );
          })}
        </div>

      </div>
    </section>
  );
};
