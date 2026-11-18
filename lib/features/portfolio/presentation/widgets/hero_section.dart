import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_layout.dart';
import '../../../../core/widgets/brand_icons.dart';
import '../../../../core/widgets/glassmorphic_container.dart';
import '../../data/portfolio_data.dart';

/// Hero Section showcasing developer introduction, exact bio text, CTAs, and profile photo.
class HeroSection extends StatelessWidget {
  final VoidCallback onExploreProjectsTap;
  final VoidCallback onContactTap;

  const HeroSection({
    super.key,
    required this.onExploreProjectsTap,
    required this.onContactTap,
  });

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return Container(
      constraints: const BoxConstraints(minHeight: 650),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: _buildTextContent(context),
                    ),
                    const SizedBox(width: 50),
                    Expanded(
                      flex: 5,
                      child: _buildGraphicCard(context),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildGraphicCard(context),
                    const SizedBox(height: 40),
                    _buildTextContent(context),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildTextContent(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Status Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.success.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: AppColors.success.withValues(alpha: 0.4),
              width: 1.2,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.success,
                  shape: BoxShape.circle,
                ),
              ).animate().scale(
                    duration: 800.ms,
                    begin: const Offset(0.8, 0.8),
                    end: const Offset(1.0, 1.0),
                  ),
              const SizedBox(width: 8),
              const Text(
                'Open to Internship & Junior Flutter Roles',
                style: TextStyle(
                  color: AppColors.success,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.2, end: 0),
        const SizedBox(height: 20),

        // Greeting & Name
        RichText(
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          text: TextSpan(
            children: [
              TextSpan(
                text: "Hi, I'm ",
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? 36 : 52,
                    ),
              ),
              TextSpan(
                text: PortfolioData.developerName,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? 36 : 52,
                      color: AppColors.secondary,
                    ),
              ),
            ],
          ),
        ).animate().fadeIn(delay: 150.ms, duration: 400.ms).slideY(begin: 0.2, end: 0),
        const SizedBox(height: 8),

        // Role Subtitle
        ShaderMask(
          shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
          child: Text(
            PortfolioData.title,
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
            style: TextStyle(
              fontSize: isMobile ? 20 : 26,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: -0.5,
            ),
          ),
        ).animate().fadeIn(delay: 300.ms, duration: 400.ms).slideY(begin: 0.2, end: 0),
        const SizedBox(height: 20),

        // Exact Bio Text Paragraphs
        Text(
          PortfolioData.bioParagraph1,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.5,
              ),
        ).animate().fadeIn(delay: 400.ms, duration: 400.ms),
        const SizedBox(height: 12),

        Text(
          PortfolioData.bioParagraph2,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
                fontSize: 14.5,
                height: 1.6,
              ),
        ).animate().fadeIn(delay: 500.ms, duration: 400.ms),
        const SizedBox(height: 12),

        Text(
          PortfolioData.bioParagraph3,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
                fontSize: 14.5,
                height: 1.6,
              ),
        ).animate().fadeIn(delay: 600.ms, duration: 400.ms),
        const SizedBox(height: 32),

        // Call to Action Buttons
        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 16,
          runSpacing: 16,
          children: [
            ElevatedButton.icon(
              onPressed: onExploreProjectsTap,
              icon: const Icon(Icons.rocket_launch_rounded, size: 18),
              label: const Text('Explore Projects'),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
              ),
            ),
            OutlinedButton.icon(
              onPressed: onContactTap,
              icon: const Icon(Icons.send_rounded, size: 18),
              label: const Text('Contact Me'),
              style: OutlinedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
              ),
            ),
          ],
        ).animate().fadeIn(delay: 700.ms, duration: 400.ms).slideY(begin: 0.2, end: 0),
        const SizedBox(height: 36),

        // Social Media Icon Links
        Row(
          mainAxisAlignment:
              isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            _SocialIconButton(
              iconWidget: BrandIcons.github(size: 20, color: Colors.white),
              tooltip: 'GitHub',
              onTap: () => _launchUrl(PortfolioData.githubUrl),
            ),
            const SizedBox(width: 12),
            _SocialIconButton(
              iconWidget: BrandIcons.linkedin(size: 20, color: AppColors.secondary),
              tooltip: 'LinkedIn',
              onTap: () => _launchUrl(PortfolioData.linkedinUrl),
            ),
            const SizedBox(width: 12),
            _SocialIconButton(
              iconWidget: BrandIcons.whatsapp(size: 20, color: AppColors.success),
              tooltip: 'WhatsApp',
              onTap: () => _launchUrl(PortfolioData.whatsappUrl),
            ),
            const SizedBox(width: 12),
            _SocialIconButton(
              iconWidget: BrandIcons.facebook(size: 20),
              tooltip: 'Facebook',
              onTap: () => _launchUrl(PortfolioData.facebookUrl),
            ),
            const SizedBox(width: 12),
            _SocialIconButton(
              iconWidget: const Icon(Icons.email_rounded, color: AppColors.textPrimary, size: 20),
              tooltip: 'Email',
              onTap: () => _launchUrl("mailto:${PortfolioData.email}"),
            ),
          ],
        ).animate().fadeIn(delay: 800.ms, duration: 400.ms),
      ],
    );
  }

  Widget _buildGraphicCard(BuildContext context) {
    return GlassmorphicContainer(
      blur: 24,
      opacity: 0.1,
      borderRadius: BorderRadius.circular(32),
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Framed Profile Photo Placeholder
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.secondary.withValues(alpha: 0.3),
                  AppColors.primary.withValues(alpha: 0.05),
                ],
              ),
              border: Border.all(
                color: AppColors.secondary,
                width: 2.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.secondary.withValues(alpha: 0.3),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipOval(
              child: PortfolioData.profileImageUrl.isNotEmpty
                  ? (PortfolioData.profileImageUrl.startsWith('http')
                      ? Image.network(
                          PortfolioData.profileImageUrl,
                          width: 160,
                          height: 160,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Center(child: FlutterLogo(size: 80)),
                        )
                      : Image.asset(
                          PortfolioData.profileImageUrl,
                          width: 160,
                          height: 160,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Center(child: FlutterLogo(size: 80)),
                        ))
                  : const Center(child: FlutterLogo(size: 80)),
            ),
          )
              .animate()
              .moveY(begin: 12, end: 0, duration: 800.ms, curve: Curves.easeOutCubic),
          const SizedBox(height: 24),

          // Name badge tag under profile photo
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.secondary.withValues(alpha: 0.5)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.verified_rounded,
                  color: AppColors.secondary,
                  size: 16,
                ),
                const SizedBox(width: 8),
                const Text(
                  "Mogtaba Saber",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Quick Stats Grid Cards
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  number: "${PortfolioData.projectsCompleted}",
                  label: "Mobile Apps",
                  icon: Icons.phone_android_rounded,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  number: "${PortfolioData.technologiesLearned}",
                  label: "Tech Courses",
                  icon: Icons.code_rounded,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  number: "${PortfolioData.booksReadCount}",
                  label: "Books Read",
                  icon: Icons.auto_stories_rounded,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialIconButton extends StatelessWidget {
  final Widget iconWidget;
  final String tooltip;
  final VoidCallback onTap;

  const _SocialIconButton({
    required this.iconWidget,
    required this.tooltip,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      tooltip: tooltip,
      style: IconButton.styleFrom(
        backgroundColor: AppColors.surface,
        padding: const EdgeInsets.all(12),
        side: const BorderSide(color: AppColors.glassBorder),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      icon: iconWidget,
    );
  }
}

class _StatCard extends StatelessWidget {
  final String number;
  final String label;
  final IconData icon;

  const _StatCard({
    required this.number,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.secondary, size: 18),
          const SizedBox(height: 8),
          Text(
            number,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
