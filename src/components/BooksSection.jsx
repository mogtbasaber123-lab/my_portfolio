import React, { useState } from 'react';
import { BookOpen, GraduationCap, Monitor, Lightbulb, Info, X } from 'lucide-react';
import { portfolioData } from '../data/portfolioData';
import { getAssetUrl } from '../utils/getAssetUrl';

const iconMap = {
  Monitor: Monitor,
  GraduationCap: GraduationCap,
  BookOpen: BookOpen,
  Lightbulb: Lightbulb,
};

export const BooksSection = () => {
  const [activeBookId, setActiveBookId] = useState(null);

  const toggleBook = (id) => {
    setActiveBookId(activeBookId === id ? null : id);
  };

  return (
    <section id="books" className="py-20 relative">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">

        {/* Section Header */}
        <div className="text-center max-w-3xl mx-auto mb-16">
          <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-accent-purple/10 border border-accent-purple/30 text-accent-purple text-xs font-semibold uppercase tracking-wider mb-3">
            Continuous Learning
          </div>
          <h2 className="text-3xl sm:text-4xl font-bold text-textPrimary tracking-tight">
            Books Read & Studied
          </h2>
          <p className="mt-4 text-textSecondary text-sm sm:text-base">
            Hover or tap on any book card to reveal its detailed summary and key insights.
          </p>
        </div>

        {/* Books Grid */}
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
          {portfolioData.books.map((book) => {
            const IconComponent = iconMap[book.iconName] || BookOpen;
            const isSelected = activeBookId === book.id;

            return (
              <div
                key={book.id}
                onClick={() => toggleBook(book.id)}
                className={`glass-card rounded-3xl p-6 flex flex-col justify-between group relative overflow-hidden cursor-pointer transition-all duration-300 min-h-[340px] ${
                  isSelected ? 'border-accent/60 shadow-glow' : 'hover:border-accent/40'
                }`}
              >
                {/* Default Main View */}
                <div className="flex flex-col h-full justify-between">
                  <div>
                    {/* Book Cover Image Container */}
                    <div className="w-full h-44 rounded-2xl overflow-hidden mb-4 bg-surface-light/40 border border-accent/20 flex items-center justify-center p-3 relative group-hover:scale-105 transition-transform duration-300">
                      <img
                        src={getAssetUrl(book.coverUrl)}
                        alt={book.title}
                        className="max-h-full max-w-full object-contain rounded shadow-lg"
                      />
                      <div
                        className="absolute top-2 right-2 w-8 h-8 rounded-xl flex items-center justify-center text-white text-xs shadow-md"
                        style={{ backgroundColor: book.coverColor }}
                      >
                        <IconComponent className="w-4 h-4" />
                      </div>
                    </div>

                    {/* Title & Author */}
                    <h3 className="text-base font-bold text-textPrimary mb-1 line-clamp-2 group-hover:text-accent transition-colors">
                      {book.title}
                    </h3>
                    <h4 className="text-xs font-semibold text-secondary line-clamp-1 mb-2">
                      By {book.author}
                    </h4>
                  </div>

                  {/* Hint indicator */}
                  <div className="pt-2 border-t border-accent/10 flex items-center justify-between text-[11px] font-medium text-textMuted group-hover:text-accent">
                    <span className="flex items-center gap-1">
                      <Info className="w-3.5 h-3.5" />
                      <span>Click or tap for summary</span>
                    </span>
                  </div>
                </div>

                {/* Click / Tap Revealed Summary Overlay Layer */}
                <div
                  onClick={(e) => {
                    e.stopPropagation();
                    toggleBook(book.id);
                  }}
                  className={`absolute inset-0 bg-surface/95 backdrop-blur-md p-6 flex flex-col justify-between border-2 border-accent/40 rounded-3xl transition-all duration-300 z-20 ${
                    isSelected
                      ? 'opacity-100 translate-y-0 pointer-events-auto shadow-2xl'
                      : 'opacity-0 translate-y-4 pointer-events-none'
                  }`}
                >
                  <div>
                    <div className="flex items-center justify-between mb-3">
                      <span
                        className="text-xs font-bold px-2.5 py-1 rounded-lg text-white"
                        style={{ backgroundColor: book.coverColor }}
                      >
                        Book Summary
                      </span>
                      <button
                        onClick={(e) => {
                          e.stopPropagation();
                          toggleBook(book.id);
                        }}
                        className="p-1 rounded-lg bg-surface border border-accent/20 text-textSecondary hover:text-textPrimary"
                        aria-label="Close book overlay"
                      >
                        <X className="w-4 h-4" />
                      </button>
                    </div>

                    <h4 className="text-sm font-bold text-textPrimary mb-2 leading-snug">
                      {book.title}
                    </h4>

                    <p className="text-xs text-textSecondary leading-relaxed">
                      {book.summary}
                    </p>
                  </div>

                  <div className="pt-3 border-t border-accent/15 text-[11px] font-semibold text-accent flex items-center justify-between">
                    <span>Author: {book.author.split(',')[0]}</span>
                    <button
                      onClick={(e) => {
                        e.stopPropagation();
                        toggleBook(book.id);
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

      </div>
    </section>
  );
};
