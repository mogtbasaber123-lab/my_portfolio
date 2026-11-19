/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        background: '#0A0E17',
        surface: {
          DEFAULT: '#121B2D',
          light: '#1A2640',
        },
        cardBg: '#0F172A',
        primary: {
          DEFAULT: '#02569B',
          light: '#0369a1',
        },
        secondary: '#54C5F8',
        accent: {
          DEFAULT: '#38BDF8',
          purple: '#818CF8',
        },
        textPrimary: '#F8FAFC',
        textSecondary: '#94A3B8',
        textMuted: '#64748B',
      },
      fontFamily: {
        sans: ['Poppins', 'sans-serif'],
      },
      boxShadow: {
        glass: '0 8px 32px 0 rgba(0, 0, 0, 0.37)',
        glow: '0 0 25px rgba(56, 189, 248, 0.25)',
      },
      backgroundImage: {
        'primary-gradient': 'linear-gradient(135deg, #02569B 0%, #54C5F8 100%)',
        'accent-gradient': 'linear-gradient(90deg, #38BDF8 0%, #818CF8 100%)',
        'glass-gradient': 'linear-gradient(135deg, rgba(255,255,255,0.08) 0%, rgba(255,255,255,0.02) 100%)',
      }
    },
  },
  plugins: [],
}
