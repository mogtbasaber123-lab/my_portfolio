import React, { useState } from 'react';
import { Mail, Copy, Check, Send, Sparkles } from 'lucide-react';
import { portfolioData } from '../data/portfolioData';
import { GithubIcon, LinkedinIcon, WhatsappIcon, FacebookIcon } from './BrandIcons';

export const ContactSection = () => {
  const [copied, setCopied] = useState(false);

  const handleCopyEmail = () => {
    navigator.clipboard.writeText(portfolioData.email);
    setCopied(true);
    setTimeout(() => setCopied(false), 2500);
  };

  return (
    <section id="contact" className="py-20 relative">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">

        {/* Section Header */}
        <div className="text-center max-w-3xl mx-auto mb-16">
          <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-primary/10 border border-primary/30 text-accent text-xs font-semibold uppercase tracking-wider mb-3">
            Get In Touch
          </div>
          <h2 className="text-3xl sm:text-4xl font-bold text-textPrimary tracking-tight">
            Let's Build Something Together
          </h2>
          <p className="mt-4 text-textSecondary text-sm sm:text-base">
            I'm open to Junior Flutter Developer roles, internships, and collaborative software projects.
          </p>
        </div>

        <div className="max-w-4xl mx-auto grid grid-cols-1 md:grid-cols-12 gap-8 items-center">

          {/* Main Direct Email Card */}
          <div className="md:col-span-7 glass-card p-8 rounded-3xl relative overflow-hidden border-2 border-accent/30">
            <div className="flex items-center gap-3 mb-4">
              <div className="w-10 h-10 rounded-xl bg-primary/20 text-accent flex items-center justify-center">
                <Mail className="w-5 h-5" />
              </div>
              <h3 className="text-xl font-bold text-textPrimary">
                Direct Email Contact
              </h3>
            </div>

            <p className="text-sm text-textSecondary mb-6 leading-relaxed">
              Feel free to send an email for inquiry, project discussion, or job opportunity.
            </p>

            {/* Email Address & Copy Box */}
            <div className="flex flex-col sm:flex-row items-stretch sm:items-center gap-3 bg-surface-light/50 p-2.5 rounded-2xl border border-accent/20 mb-6">
              <span className="text-xs sm:text-sm font-semibold text-textPrimary truncate px-3 py-1 flex-1">
                {portfolioData.email}
              </span>
              <button
                onClick={handleCopyEmail}
                className="inline-flex items-center justify-center gap-2 px-4 py-2.5 rounded-xl bg-accent/20 text-accent font-semibold text-xs border border-accent/30 hover:bg-accent/30 transition-colors"
              >
                {copied ? (
                  <>
                    <Check className="w-4 h-4 text-emerald-400" />
                    <span className="text-emerald-400">Copied!</span>
                  </>
                ) : (
                  <>
                    <Copy className="w-4 h-4" />
                    <span>Copy Address</span>
                  </>
                )}
              </button>
            </div>

            <a
              href={`mailto:${portfolioData.email}`}
              className="w-full inline-flex items-center justify-center gap-2.5 px-6 py-3.5 rounded-xl bg-gradient-to-r from-primary to-secondary text-white font-semibold text-sm shadow-lg shadow-primary/30 hover:shadow-accent/40 transition-all"
            >
              <Send className="w-4 h-4" />
              <span>Send Mail Directly</span>
            </a>
          </div>

          {/* Social Profiles Grid */}
          <div className="md:col-span-5 space-y-4">
            <h4 className="text-xs font-bold uppercase tracking-wider text-textMuted mb-2 px-1">
              Social Channels
            </h4>

            <a
              href={portfolioData.linkedinUrl}
              target="_blank"
              rel="noopener noreferrer"
              className="glass-card p-4 rounded-2xl flex items-center justify-between group hover:border-accent/40"
            >
              <div className="flex items-center gap-3">
                <div className="w-10 h-10 rounded-xl bg-blue-600/20 text-blue-400 flex items-center justify-center">
                  <LinkedinIcon className="w-5 h-5" />
                </div>
                <div>
                  <h5 className="text-sm font-bold text-textPrimary group-hover:text-accent transition-colors">
                    LinkedIn Profile
                  </h5>
                  <span className="text-xs text-textSecondary">Professional Network</span>
                </div>
              </div>
              <Sparkles className="w-4 h-4 text-accent opacity-0 group-hover:opacity-100 transition-opacity" />
            </a>

            <a
              href={portfolioData.githubUrl}
              target="_blank"
              rel="noopener noreferrer"
              className="glass-card p-4 rounded-2xl flex items-center justify-between group hover:border-accent/40"
            >
              <div className="flex items-center gap-3">
                <div className="w-10 h-10 rounded-xl bg-purple-600/20 text-purple-400 flex items-center justify-center">
                  <GithubIcon className="w-5 h-5" />
                </div>
                <div>
                  <h5 className="text-sm font-bold text-textPrimary group-hover:text-accent transition-colors">
                    GitHub Profile
                  </h5>
                  <span className="text-xs text-textSecondary">Code Repositories</span>
                </div>
              </div>
              <Sparkles className="w-4 h-4 text-accent opacity-0 group-hover:opacity-100 transition-opacity" />
            </a>

            <a
              href={portfolioData.whatsappUrl}
              target="_blank"
              rel="noopener noreferrer"
              className="glass-card p-4 rounded-2xl flex items-center justify-between group hover:border-accent/40"
            >
              <div className="flex items-center gap-3">
                <div className="w-10 h-10 rounded-xl bg-emerald-600/20 text-emerald-400 flex items-center justify-center">
                  <WhatsappIcon className="w-5 h-5" />
                </div>
                <div>
                  <h5 className="text-sm font-bold text-textPrimary group-hover:text-accent transition-colors">
                    WhatsApp Chat
                  </h5>
                  <span className="text-xs text-textSecondary">Instant Messaging</span>
                </div>
              </div>
              <Sparkles className="w-4 h-4 text-accent opacity-0 group-hover:opacity-100 transition-opacity" />
            </a>

            <a
              href={portfolioData.facebookUrl}
              target="_blank"
              rel="noopener noreferrer"
              className="glass-card p-4 rounded-2xl flex items-center justify-between group hover:border-accent/40"
            >
              <div className="flex items-center gap-3">
                <div className="w-10 h-10 rounded-xl bg-blue-500/20 text-blue-400 flex items-center justify-center">
                  <FacebookIcon className="w-5 h-5" />
                </div>
                <div>
                  <h5 className="text-sm font-bold text-textPrimary group-hover:text-accent transition-colors">
                    Facebook Page
                  </h5>
                  <span className="text-xs text-textSecondary">Social Profile</span>
                </div>
              </div>
              <Sparkles className="w-4 h-4 text-accent opacity-0 group-hover:opacity-100 transition-opacity" />
            </a>
          </div>

        </div>

      </div>
    </section>
  );
};
