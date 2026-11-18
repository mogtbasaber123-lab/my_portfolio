import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_layout.dart';
import '../../../../core/widgets/glassmorphic_container.dart';
import '../../../../core/widgets/section_header.dart';
import '../../data/portfolio_data.dart';
import 'project_detail_dialog.dart';

/// Featured Projects Showcase Section with web hover animations and details dialog.
class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final isTablet = ResponsiveLayout.isTablet(context);

    int crossAxisCount = 1;
    if (isDesktop) {
      crossAxisCount = 2;
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
                tag: "// HANDS-ON PROJECTS",
                title: "Mobile Projects Showcase",
                subtitle:
                    "Practical mobile applications engineered with Flutter and Dart, demonstrating UI/UX precision, clean architecture, and local/cloud state management.",
              ),
              const SizedBox(height: 50),

              // Projects Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: PortfolioData.projects.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  mainAxisExtent: 440,
                ),
                itemBuilder: (context, index) {
                  final project = PortfolioData.projects[index];
                  return _ProjectCard(project: project)
                      .animate()
                      .fadeIn(delay: (120 * index).ms, duration: 400.ms)
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

class _ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool isHovered = false;

  Future<void> _launchUrl(String urlString) async {
    final Uri uri = Uri.parse(urlString);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _showDetailDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ProjectDetailDialog(project: widget.project),
    );
  }

  @override
  Widget build(BuildContext context) {
    final project = widget.project;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        transform: isHovered
            ? Matrix4.translationValues(0, -8, 0)
            : Matrix4.identity(),
        child: GlassmorphicContainer(
          blur: 16,
          opacity: isHovered ? 0.14 : 0.08,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isHovered
                ? AppColors.secondary
                : AppColors.glassBorder,
            width: isHovered ? 1.5 : 1.0,
          ),
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Card Top Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                          color: AppColors.secondary.withValues(alpha: 0.4)),
                    ),
                    child: Icon(
                      project.icon,
                      color: AppColors.secondary,
                      size: 24,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceLight,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.glassBorder),
                    ),
                    child: Text(
                      project.category,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Title & Subtitle
              Text(
                project.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                      fontSize: 20,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                project.subtitle,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),

              // Short Description
              Text(
                project.shortDescription,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
              ),
              const Spacer(),

              // Tech stack badges
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: project.techStack.take(4).map((tech) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.surface.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.glassBorder),
                    ),
                    child: Text(
                      tech,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              const Divider(color: AppColors.glassBorder, height: 1),
              const SizedBox(height: 16),

              // Card Bottom Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () => _showDetailDialog(context),
                    icon: const Icon(Icons.info_outline_rounded, size: 16),
                    label: const Text('View Details'),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.secondary,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => _launchUrl(project.githubUrl),
                        tooltip: 'Source Code',
                        icon: const Icon(Icons.code_rounded, size: 18),
                        style: IconButton.styleFrom(
                          foregroundColor: AppColors.textSecondary,
                        ),
                      ),
                      IconButton(
                        onPressed: () => _launchUrl(project.liveUrl),
                        tooltip: 'Live Demo',
                        icon: const Icon(
                            Icons.open_in_new_rounded,
                            size: 16),
                        style: IconButton.styleFrom(
                          foregroundColor: AppColors.secondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
