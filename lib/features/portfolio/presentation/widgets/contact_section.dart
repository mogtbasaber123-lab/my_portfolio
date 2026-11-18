import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_layout.dart';
import '../../../../core/widgets/brand_icons.dart';
import '../../../../core/widgets/glassmorphic_container.dart';
import '../../../../core/widgets/section_header.dart';
import '../../data/portfolio_data.dart';

/// Interactive Contact Section featuring direct links and a contact message form.
class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  bool isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => isSubmitting = true);

      // Simulate quick transmission
      Future.delayed(const Duration(milliseconds: 1000), () {
        if (!mounted) return;
        setState(() => isSubmitting = false);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.surface,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: AppColors.secondary)),
            content: Row(
              children: const [
                Icon(Icons.check_circle, color: AppColors.success),
                SizedBox(width: 12),
                Text(
                  'Message sent successfully! I will get back to you soon.',
                  style: TextStyle(color: AppColors.textPrimary),
                ),
              ],
            ),
          ),
        );

        _nameController.clear();
        _emailController.clear();
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              const SectionHeader(
                tag: "// GET IN TOUCH",
                title: "Let's Build Something Exceptional",
                subtitle:
                    "Have a project in mind, an architectural query, or interested in collaborating? Drop me a line below.",
              ),
              const SizedBox(height: 50),

              isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: _buildContactInfo(context),
                        ),
                        const SizedBox(width: 40),
                        Expanded(
                          flex: 6,
                          child: _buildContactForm(context),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        _buildContactInfo(context),
                        const SizedBox(height: 40),
                        _buildContactForm(context),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return GlassmorphicContainer(
      blur: 16,
      opacity: 0.08,
      borderRadius: BorderRadius.circular(24),
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Contact Details",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Feel free to reach out directly via email, social networks, or WhatsApp.",
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 28),

          // Email Tile
          _ContactDetailTile(
            iconWidget: const Icon(Icons.email_rounded, color: AppColors.secondary, size: 20),
            title: "Email (Click to copy / mailto)",
            value: PortfolioData.email,
            onTap: () => _launchUrl("mailto:${PortfolioData.email}"),
          ),
          const SizedBox(height: 16),

          // WhatsApp Tile
          _ContactDetailTile(
            iconWidget: BrandIcons.whatsapp(size: 20, color: AppColors.success),
            title: "WhatsApp",
            value: "Direct Chat",
            onTap: () => _launchUrl(PortfolioData.whatsappUrl),
          ),
          const SizedBox(height: 16),

          // LinkedIn Tile
          _ContactDetailTile(
            iconWidget: BrandIcons.linkedin(size: 20, color: AppColors.secondary),
            title: "LinkedIn",
            value: "mogtaba-saber-135304383",
            onTap: () => _launchUrl(PortfolioData.linkedinUrl),
          ),
          const SizedBox(height: 16),

          // GitHub Tile
          _ContactDetailTile(
            iconWidget: BrandIcons.github(size: 20, color: Colors.white),
            title: "GitHub Profile",
            value: "github.com",
            onTap: () => _launchUrl(PortfolioData.githubUrl),
          ),
          const SizedBox(height: 16),

          // Facebook Tile
          _ContactDetailTile(
            iconWidget: BrandIcons.facebook(size: 20),
            title: "Facebook",
            value: "facebook.com",
            onTap: () => _launchUrl(PortfolioData.facebookUrl),
          ),
        ],
      ),
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return GlassmorphicContainer(
      blur: 16,
      opacity: 0.08,
      borderRadius: BorderRadius.circular(24),
      padding: const EdgeInsets.all(32),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Send a Message",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
            ),
            const SizedBox(height: 24),

            // Name Field
            TextFormField(
              controller: _nameController,
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Please enter your name' : null,
              style: const TextStyle(color: AppColors.textPrimary),
              decoration: _inputDecoration("Your Name", Icons.person_outline),
            ),
            const SizedBox(height: 20),

            // Email Field
            TextFormField(
              controller: _emailController,
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return 'Please enter your email';
                }
                if (!v.contains('@') || !v.contains('.')) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
              style: const TextStyle(color: AppColors.textPrimary),
              decoration: _inputDecoration("Your Email", Icons.email_outlined),
            ),
            const SizedBox(height: 20),

            // Message Field
            TextFormField(
              controller: _messageController,
              maxLines: 5,
              validator: (v) => (v == null || v.trim().isEmpty)
                  ? 'Please write a message'
                  : null,
              style: const TextStyle(color: AppColors.textPrimary),
              decoration: _inputDecoration("Project details / Message", Icons.chat_bubble_outline),
            ),
            const SizedBox(height: 28),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: isSubmitting ? null : _submitForm,
                icon: isSubmitting
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.send_rounded, size: 18),
                label: Text(
                  isSubmitting ? 'Sending Message...' : 'Send Message',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String labelText, IconData icon) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(color: AppColors.textSecondary),
      prefixIcon: Icon(icon, color: AppColors.secondary, size: 20),
      filled: true,
      fillColor: AppColors.surfaceLight.withValues(alpha: 0.5),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.glassBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.secondary, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
      ),
    );
  }
}

class _ContactDetailTile extends StatelessWidget {
  final Widget iconWidget;
  final String title;
  final String value;
  final VoidCallback onTap;

  const _ContactDetailTile({
    required this.iconWidget,
    required this.title,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.surfaceLight.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.glassBorder),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: iconWidget,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textMuted,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded,
                color: AppColors.textMuted, size: 14),
          ],
        ),
      ),
    );
  }
}
