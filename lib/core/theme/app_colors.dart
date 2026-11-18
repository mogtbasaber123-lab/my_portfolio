import 'package:flutter/material.dart';

/// App color palette designed specifically for high-contrast, modern
/// Flutter Web UI/UX with glassmorphism support.
class AppColors {
  AppColors._();

  // Dark Theme Base Colors
  static const Color background = Color(0xFF0A0E17);
  static const Color surface = Color(0xFF121B2D);
  static const Color surfaceLight = Color(0xFF1A2640);
  static const Color cardBg = Color(0xFF0F172A);

  // Brand Accents
  static const Color primary = Color(0xFF02569B);      // Flutter Deep Blue
  static const Color secondary = Color(0xFF54C5F8);    // Flutter Light Cyan
  static const Color accent = Color(0xFF38BDF8);       // Electric Sky Cyan
  static const Color accentPurple = Color(0xFF818CF8); // Indigo / Violet Accent

  // Text Colors
  static const Color textPrimary = Color(0xFFF8FAFC);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textMuted = Color(0xFF64748B);

  // Glassmorphism Overlays
  static const Color glassFill = Color(0x1A0F172A);
  static const Color glassBorder = Color(0x3338BDF8);
  static const Color glassHighlight = Color(0x1FFFFFFF);

  // Status & Tags
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFBF59E0B);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF02569B), Color(0xFF54C5F8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFF38BDF8), Color(0xFF818CF8)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient glassGradient = LinearGradient(
    colors: [
      Color(0x26FFFFFF),
      Color(0x05FFFFFF),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
