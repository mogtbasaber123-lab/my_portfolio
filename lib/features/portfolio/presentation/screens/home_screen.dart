import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/books_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/courses_section.dart';
import '../widgets/education_section.dart';
import '../widgets/footer.dart';
import '../widgets/hero_section.dart';
import '../widgets/hobbies_section.dart';
import '../widgets/navbar.dart';
import '../widgets/projects_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/volunteering_section.dart';

/// Core Home Screen managing section GlobalKeys for smooth section scrolling
/// across all 9 exact sections in order.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  // 9 Section GlobalKeys for smooth section jumping using Scrollable.ensureVisible
  final List<GlobalKey> _sectionKeys = List.generate(9, (_) => GlobalKey());

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(int index) {
    if (index >= 0 && index < _sectionKeys.length) {
      final keyContext = _sectionKeys[index].currentContext;
      if (keyContext != null) {
        Scrollable.ensureVisible(
          keyContext,
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOutCubic,
        );
      }
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: PortfolioDrawer(
        onNavTap: _scrollToSection,
      ),
      body: Stack(
        children: [
          // Background Gradient Orbs (Decorative Blurs)
          Positioned.fill(
            child: RepaintBoundary(
              child: Stack(
                children: [
                  Positioned(
                    top: -100,
                    left: -100,
                    child: Container(
                      width: 500,
                      height: 500,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary.withValues(alpha: 0.15),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 1200,
                    right: -150,
                    child: Container(
                      width: 600,
                      height: 600,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.secondary.withValues(alpha: 0.08),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 300,
                    left: -100,
                    child: Container(
                      width: 500,
                      height: 500,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.accentPurple.withValues(alpha: 0.1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Main Scrollable Body
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              // Sticky Glass Navbar
              SliverToBoxAdapter(
                child: SafeArea(
                  child: NavBar(
                    onNavTap: _scrollToSection,
                    onOpenDrawer: () => _scaffoldKey.currentState?.openDrawer(),
                  ),
                ),
              ),

              // 1. Hero Section (Index 0)
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _sectionKeys[0],
                  child: HeroSection(
                    onExploreProjectsTap: () => _scrollToSection(5),
                    onContactTap: () => _scrollToSection(8),
                  ),
                ),
              ),

              // 2. Education Section (Index 1)
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _sectionKeys[1],
                  child: const EducationSection(),
                ),
              ),

              // 3. Courses & Technologies Section (Index 2)
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _sectionKeys[2],
                  child: const CoursesSection(),
                ),
              ),

              // 4. Books Read Section (Index 3)
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _sectionKeys[3],
                  child: const BooksSection(),
                ),
              ),

              // 5. Skills Section (Index 4)
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _sectionKeys[4],
                  child: const SkillsSection(),
                ),
              ),

              // 6. Projects Showcase Section (Index 5)
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _sectionKeys[5],
                  child: const ProjectsSection(),
                ),
              ),

              // 7. Volunteering & Leadership Section (Index 6)
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _sectionKeys[6],
                  child: const VolunteeringSection(),
                ),
              ),

              // 8. Hobbies & Interests Section (Index 7)
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _sectionKeys[7],
                  child: const HobbiesSection(),
                ),
              ),

              // 9. Contact & Social Links Section (Index 8)
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _sectionKeys[8],
                  child: const ContactSection(),
                ),
              ),

              // Footer
              SliverToBoxAdapter(
                child: PortfolioFooter(
                  onScrollToTop: _scrollToTop,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
