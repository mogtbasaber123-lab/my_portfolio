import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_colors.dart';

/// Standardized section title header widget with tag badge and gradient line indicator.
class SectionHeader extends StatelessWidget {
  final String tag;
  final String title;
  final String subtitle;
  final bool isCentered;

  const SectionHeader({
    super.key,
    required this.tag,
    required this.title,
    required this.subtitle,
    this.isCentered = true,
  });

  @override
  Widget build(BuildContext context) {
    final crossAxisAlignment =
        isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start;
    final textAlign = isCentered ? TextAlign.center : TextAlign.start;

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        // Tag Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.secondary.withValues(alpha: 0.4),
              width: 1,
            ),
          ),
          child: Text(
            tag.toUpperCase(),
            style: const TextStyle(
              color: AppColors.secondary,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
            ),
          ),
        ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.3, end: 0),
        const SizedBox(height: 12),

        // Section Title
        Text(
          title,
          textAlign: textAlign,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
                letterSpacing: -0.5,
              ),
        ).animate().fadeIn(delay: 100.ms, duration: 400.ms).slideY(begin: 0.3, end: 0),
        const SizedBox(height: 10),

        // Subtitle
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 650),
          child: Text(
            subtitle,
            textAlign: textAlign,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
          ),
        ).animate().fadeIn(delay: 200.ms, duration: 400.ms).slideY(begin: 0.3, end: 0),
        const SizedBox(height: 16),

        // Gradient line indicator
        Container(
          width: 80,
          height: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            gradient: AppColors.primaryGradient,
          ),
        ).animate().scaleX(delay: 300.ms, duration: 500.ms, alignment: Alignment.center),
      ],
    );
  }
}
