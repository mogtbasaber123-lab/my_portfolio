import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_layout.dart';
import '../../../../core/widgets/brand_icons.dart';
import '../../../../core/widgets/glassmorphic_container.dart';
import '../../../../core/widgets/section_header.dart';
import '../../data/portfolio_data.dart';

/// Section 3: Courses & Technologies Learned (5 Interactive Hover Cards with Tech Backgrounds).
class CoursesSection extends StatelessWidget {
  const CoursesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final isTablet = ResponsiveLayout.isTablet(context);

    int crossAxisCount = 1;
    if (isDesktop) {
      crossAxisCount = 3;
    } else if (isTablet) {
      crossAxisCount = 2;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              const SectionHeader(
                tag: "// TECHNICAL CURRICULUM",
                title: "Courses & Core Technologies Learned",
                subtitle:
                    "Interactive overview of technologies I have mastered through structured coursework, self-study, and practical software engineering application.",
              ),
              const SizedBox(height: 50),

              // 5 Courses Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: PortfolioData.courses.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  mainAxisExtent: 380,
                ),
                itemBuilder: (context, index) {
                  final course = PortfolioData.courses[index];
                  return _CourseHoverCard(course: course)
                      .animate()
                      .fadeIn(delay: (100 * index).ms, duration: 400.ms)
                      .slideY(begin: 0.2, end: 0);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CourseHoverCard extends StatefulWidget {
  final CourseModel course;

  const _CourseHoverCard({required this.course});

  @override
  State<_CourseHoverCard> createState() => _CourseHoverCardState();
}

class _CourseHoverCardState extends State<_CourseHoverCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final course = widget.course;

    return GestureDetector(
      onTap: () => setState(() => isHovered = !isHovered),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        transform: isHovered
            ? Matrix4.translationValues(0, -6, 0)
            : Matrix4.identity(),
        child: GlassmorphicContainer(
          blur: 16,
          opacity: isHovered ? 0.16 : 0.08,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isHovered ? course.themeColor : AppColors.glassBorder,
            width: isHovered ? 1.5 : 1.0,
          ),
          padding: const EdgeInsets.all(0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Stack(
              children: [
                // 1. Background Technology Image
                Positioned.fill(
                  child: Image.network(
                    course.backgroundImageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: AppColors.surface,
                    ),
                  ),
                ),

                // 2. Dark Translucent Overlay Gradient
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.background.withValues(alpha: 0.88),
                          AppColors.background.withValues(alpha: 0.96),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),

                // 3. Base Card Content (Title, Subtitle & Icon)
                Padding(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Brand Logo Badge
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: course.themeColor.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: course.themeColor.withValues(alpha: 0.5),
                            width: 1.2,
                          ),
                        ),
                        child: _buildCourseBrandLogo(course),
                      ),
                      const SizedBox(height: 24),

                      // Technology Title
                      Text(
                        course.title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                              fontSize: 26,
                            ),
                      ),
                      const SizedBox(height: 6),

                      // Subtitle
                      Text(
                        course.subtitle,
                        style: TextStyle(
                          color: course.themeColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),

                      // Hover prompt
                      Row(
                        children: [
                          const Text(
                            "Tap or hover to explore concepts",
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textMuted,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 14,
                            color: course.themeColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // 4. Smooth Hover Slide-up Details Panel
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 320),
                  curve: Curves.easeInOutCubic,
                  top: isHovered ? 0 : 380,
                  bottom: isHovered ? 0 : -380,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColors.surface.withValues(alpha: 0.97),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: course.themeColor, width: 1.5),
                    ),
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                course.title,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: course.themeColor,
                                ),
                              ),
                              Icon(
                                course.icon,
                                color: course.themeColor,
                                size: 20,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            course.description,
                            style: const TextStyle(
                              fontSize: 12.5,
                              color: AppColors.textPrimary,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 14),
                          const Text(
                            "KEY CONCEPTS LEARNED:",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textMuted,
                              letterSpacing: 1.0,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ...course.keyConcepts.map(
                            (concept) => Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.check_circle_rounded,
                                    color: course.themeColor,
                                    size: 14,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      concept,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: AppColors.textSecondary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

  Widget _buildCourseBrandLogo(CourseModel course) {
    if (course.logoUrl.isNotEmpty) {
      if (course.logoUrl.startsWith('http')) {
        return Image.network(
          course.logoUrl,
          width: 32,
          height: 32,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) =>
              _fallbackBrandIcon(course),
        );
      } else {
        return Image.asset(
          course.logoUrl,
          width: 32,
          height: 32,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) =>
              _fallbackBrandIcon(course),
        );
      }
    }
    return _fallbackBrandIcon(course);
  }

  Widget _fallbackBrandIcon(CourseModel course) {
    switch (course.id) {
      case 'java':
        return BrandIcons.java(size: 32);
      case 'dart':
        return BrandIcons.dart(size: 32);
      case 'flutter':
        return BrandIcons.flutter(size: 32);
      case 'firebase':
        return BrandIcons.firebase(size: 32);
      case 'hive':
        return BrandIcons.hive(size: 32);
      default:
        return Icon(
          course.icon,
          color: course.themeColor,
          size: 30,
        );
    }
  }
}
