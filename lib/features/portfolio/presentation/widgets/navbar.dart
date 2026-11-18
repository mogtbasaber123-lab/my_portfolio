import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_layout.dart';
import '../../../../core/widgets/glassmorphic_container.dart';
import '../../data/portfolio_data.dart';

/// Ultra-sleek, modern Glassmorphic Top Navigation Bar & Responsive Mobile Drawer.
class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(int index) onNavTap;
  final VoidCallback onOpenDrawer;

  const NavBar({
    super.key,
    required this.onNavTap,
    required this.onOpenDrawer,
  });

  @override
  Size get preferredSize => const Size.fromHeight(80);

  Future<void> _downloadCV() async {
    final Uri uri = Uri.parse(PortfolioData.cvDownloadUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: GlassmorphicContainer(
        blur: 20,
        opacity: 0.12,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: AppColors.secondary.withValues(alpha: 0.35),
          width: 1.2,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Developer Logo / Name Badge
            InkWell(
              onTap: () => onNavTap(0),
              borderRadius: BorderRadius.circular(16),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.secondary.withValues(alpha: 0.4),
                          blurRadius: 12,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.code_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 14),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: PortfolioData.developerName,
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const TextSpan(
                          text: ".dev",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Desktop Navigation Links
            if (isDesktop)
              Row(
                children: [
                  _NavBarItem(label: 'About', onTap: () => onNavTap(0)),
                  _NavBarItem(label: 'Education', onTap: () => onNavTap(1)),
                  _NavBarItem(label: 'Courses', onTap: () => onNavTap(2)),
                  _NavBarItem(label: 'Books', onTap: () => onNavTap(3)),
                  _NavBarItem(label: 'Skills', onTap: () => onNavTap(4)),
                  _NavBarItem(label: 'Projects', onTap: () => onNavTap(5)),
                  _NavBarItem(label: 'Volunteering', onTap: () => onNavTap(6)),
                  _NavBarItem(label: 'Hobbies', onTap: () => onNavTap(7)),
                  _NavBarItem(label: 'Contact', onTap: () => onNavTap(8)),
                  const SizedBox(width: 16),

                  // Download CV Button
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.4),
                          blurRadius: 14,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: ElevatedButton.icon(
                      onPressed: _downloadCV,
                      icon: const Icon(Icons.file_download_rounded, size: 16),
                      label: const Text('Download CV'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                            color: AppColors.secondary.withValues(alpha: 0.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            else
              // Mobile / Tablet Hamburger Menu Button
              Container(
                decoration: BoxDecoration(
                  color: AppColors.surfaceLight,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.glassBorder),
                ),
                child: IconButton(
                  icon: const Icon(Icons.menu_rounded,
                      color: AppColors.secondary, size: 26),
                  onPressed: onOpenDrawer,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Navigation Bar Item widget with smooth hover capsule animations.
class _NavBarItem extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.label,
    required this.onTap,
  });

  @override
  State<_NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<_NavBarItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: isHovered
                ? AppColors.secondary.withValues(alpha: 0.15)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isHovered
                  ? AppColors.secondary.withValues(alpha: 0.4)
                  : Colors.transparent,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 14.5,
                  fontWeight: isHovered ? FontWeight.bold : FontWeight.w500,
                  color: isHovered ? AppColors.secondary : AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Mobile Navigation Drawer Widget.
class PortfolioDrawer extends StatelessWidget {
  final Function(int index) onNavTap;

  const PortfolioDrawer({
    super.key,
    required this.onNavTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.background,
      child: SafeArea(
        child: Column(
          children: [
            // Drawer Header
            Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: AppColors.surface,
                border: Border(
                  bottom: BorderSide(color: AppColors.glassBorder, width: 1),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.code_rounded,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          PortfolioData.developerName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          PortfolioData.title,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Navigation Items
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _DrawerItem(
                    icon: Icons.person_rounded,
                    label: 'About',
                    onTap: () {
                      Navigator.pop(context);
                      onNavTap(0);
                    },
                  ),
                  _DrawerItem(
                    icon: Icons.school_rounded,
                    label: 'Education',
                    onTap: () {
                      Navigator.pop(context);
                      onNavTap(1);
                    },
                  ),
                  _DrawerItem(
                    icon: Icons.code_rounded,
                    label: 'Courses & Technologies',
                    onTap: () {
                      Navigator.pop(context);
                      onNavTap(2);
                    },
                  ),
                  _DrawerItem(
                    icon: Icons.auto_stories_rounded,
                    label: 'Books Read',
                    onTap: () {
                      Navigator.pop(context);
                      onNavTap(3);
                    },
                  ),
                  _DrawerItem(
                    icon: Icons.account_tree_rounded,
                    label: 'Core Skills',
                    onTap: () {
                      Navigator.pop(context);
                      onNavTap(4);
                    },
                  ),
                  _DrawerItem(
                    icon: Icons.phone_android_rounded,
                    label: 'Projects Showcase',
                    onTap: () {
                      Navigator.pop(context);
                      onNavTap(5);
                    },
                  ),
                  _DrawerItem(
                    icon: Icons.volunteer_activism_rounded,
                    label: 'Volunteering & Leadership',
                    onTap: () {
                      Navigator.pop(context);
                      onNavTap(6);
                    },
                  ),
                  _DrawerItem(
                    icon: Icons.interests_rounded,
                    label: 'Hobbies & Passions',
                    onTap: () {
                      Navigator.pop(context);
                      onNavTap(7);
                    },
                  ),
                  _DrawerItem(
                    icon: Icons.email_rounded,
                    label: 'Contact',
                    onTap: () {
                      Navigator.pop(context);
                      onNavTap(8);
                    },
                  ),
                ],
              ),
            ),

            // Download CV Button in Mobile Drawer
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    Navigator.pop(context);
                    final Uri uri = Uri.parse(PortfolioData.cvDownloadUrl);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri, mode: LaunchMode.externalApplication);
                    }
                  },
                  icon: const Icon(Icons.file_download_rounded, size: 18),
                  label: const Text('Download CV'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: AppColors.secondary, size: 18),
      ),
      title: Text(
        label,
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
    );
  }
}
