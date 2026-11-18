import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_layout.dart';
import '../../../../core/widgets/glassmorphic_container.dart';
import '../../../../core/widgets/section_header.dart';
import '../../data/portfolio_data.dart';

/// Section 4: Books Read (Displays 4 books in a 4-column responsive grid with hover overlay).
class BooksSection extends StatelessWidget {
  const BooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final isTablet = ResponsiveLayout.isTablet(context);

    int crossAxisCount = 1;
    if (isDesktop) {
      crossAxisCount = 4;
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
                tag: "// CONTINUOUS LEARNING",
                title: "Books I've Read",
                subtitle:
                    "Foundational computer science and software engineering literature. Hover over any book cover to reveal the title, authors, and summary.",
              ),
              const SizedBox(height: 50),

              // 4-Column Responsive Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: PortfolioData.books.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 24,
                  mainAxisExtent: 430,
                ),
                itemBuilder: (context, index) {
                  final book = PortfolioData.books[index];
                  return _BookCoverHoverCard(book: book, index: index)
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

class _BookCoverHoverCard extends StatefulWidget {
  final BookModel book;
  final int index;

  const _BookCoverHoverCard({
    required this.book,
    required this.index,
  });

  @override
  State<_BookCoverHoverCard> createState() => _BookCoverHoverCardState();
}

class _BookCoverHoverCardState extends State<_BookCoverHoverCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final book = widget.book;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        transform: isHovered
            ? Matrix4.translationValues(0, -8, 0)
            : Matrix4.identity(),
        child: GlassmorphicContainer(
          blur: 16,
          opacity: isHovered ? 0.16 : 0.08,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: isHovered ? book.coverColor : AppColors.glassBorder,
            width: isHovered ? 1.5 : 1.0,
          ),
          padding: const EdgeInsets.all(0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Stack(
              children: [
                // 1. Default State: Full Book Cover Image (Fills the card)
                Positioned.fill(
                  child: Image.network(
                    book.coverUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        _buildFallbackCover(book),
                  ),
                ),

                // 2. Translucent Dark Hover Overlay (Slides up on Hover)
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeInOutCubic,
                  top: isHovered ? 0 : 430,
                  bottom: isHovered ? 0 : -430,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: AppColors.background.withValues(alpha: 0.95),
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: book.coverColor, width: 1.5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              book.icon,
                              color: book.coverColor,
                              size: 22,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                book.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                  height: 1.3,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),

                        Text(
                          "Author(s): ${book.author}",
                          style: TextStyle(
                            fontSize: 12.5,
                            color: book.coverColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Divider(color: AppColors.glassBorder, height: 1),
                        const SizedBox(height: 12),

                        const Text(
                          "SUMMARY:",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textMuted,
                            letterSpacing: 1.0,
                          ),
                        ),
                        const SizedBox(height: 6),

                        Expanded(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Text(
                              book.summary,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: AppColors.textSecondary,
                                    height: 1.5,
                                    fontSize: 13,
                                  ),
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
    );
  }

  /// Styled 3D Cover Fallback if network image is loading or unavailable
  Widget _buildFallbackCover(BookModel book) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            book.coverColor.withValues(alpha: 0.4),
            AppColors.surface,
            AppColors.background,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: book.coverColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: book.coverColor.withValues(alpha: 0.5),
                  ),
                ),
                child: const Text(
                  "RECOMMENDED BOOK",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              Icon(
                Icons.bookmark_rounded,
                color: book.coverColor,
                size: 24,
              ),
            ],
          ),
          const Spacer(),

          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: book.coverColor.withValues(alpha: 0.2),
                border: Border.all(
                  color: book.coverColor.withValues(alpha: 0.5),
                  width: 1.5,
                ),
              ),
              child: Icon(
                book.icon,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
          const Spacer(),

          Text(
            book.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 4),

          Text(
            "by ${book.author}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              color: book.coverColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
