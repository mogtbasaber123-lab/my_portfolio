import React from 'react';
import { HeartHandshake, ShieldCheck, Users, Globe } from 'lucide-react';
import { portfolioData } from '../data/portfolioData';

export const VolunteeringSection = () => {
  const { volunteering } = portfolioData;

  return (
    <section id="volunteering" className="py-20 relative">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">

        {/* Section Header */}
        <div className="text-center max-w-3xl mx-auto mb-16">
          <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-emerald-500/10 border border-emerald-500/30 text-emerald-400 text-xs font-semibold uppercase tracking-wider mb-3">
            Community Leadership
          </div>
          <h2 className="text-3xl sm:text-4xl font-bold text-textPrimary tracking-tight">
            Volunteering & Social Impact
          </h2>
          <p className="mt-4 text-textSecondary text-sm sm:text-base">
            Using technical skills to empower non-profits and community organizations.
          </p>
        </div>

        {/* Featured Leadership Card */}
        <div className="max-w-4xl mx-auto">
          <div className="glass-card rounded-3xl p-8 sm:p-10 relative overflow-hidden border-2 border-emerald-500/30">

            {/* Background Glow */}
            <div className="absolute top-0 right-0 -mt-10 -mr-10 w-60 h-60 rounded-full bg-emerald-500/10 blur-3xl pointer-events-none" />

            <div className="flex flex-col md:flex-row items-start gap-6 relative z-10">

              {/* Icon Badge */}
              <div className="w-16 h-16 rounded-2xl bg-gradient-to-br from-emerald-500/30 to-teal-500/30 border border-emerald-400/40 flex items-center justify-center text-emerald-400 shrink-0">
                <HeartHandshake className="w-8 h-8" />
              </div>

              {/* Details */}
              <div className="flex-1">
                <div className="flex flex-wrap items-center justify-between gap-2 mb-2">
                  <h3 className="text-2xl font-extrabold text-textPrimary">
                    {volunteering.organization}
                  </h3>
                  <span className="px-3.5 py-1 rounded-full text-xs font-bold bg-emerald-500/20 text-emerald-400 border border-emerald-500/40">
                    {volunteering.role}
                  </span>
                </div>

                <h4 className="text-sm font-semibold text-secondary mb-4">
                  {volunteering.subtitle}
                </h4>

                <p className="text-sm text-textSecondary leading-relaxed mb-6">
                  {volunteering.description}
                </p>

                {/* Highlights */}
                <div className="grid grid-cols-1 sm:grid-cols-3 gap-4 pt-4 border-t border-accent/15">
                  <div className="flex items-center gap-2.5 text-xs font-semibold text-textPrimary">
                    <ShieldCheck className="w-4 h-4 text-emerald-400" />
                    <span>Non-Profit Digitalization</span>
                  </div>
                  <div className="flex items-center gap-2.5 text-xs font-semibold text-textPrimary">
                    <Globe className="w-4 h-4 text-accent" />
                    <span>Sudanese Community Impact</span>
                  </div>
                  <div className="flex items-center gap-2.5 text-xs font-semibold text-textPrimary">
                    <Users className="w-4 h-4 text-secondary" />
                    <span>Youth Tech Empowerment</span>
                  </div>
                </div>

              </div>

            </div>

          </div>
        </div>

      </div>
    </section>
  );
};
