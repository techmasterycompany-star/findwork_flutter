import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class AppPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageChanged;

  const AppPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (totalPages <= 1) return const SizedBox.shrink();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
          icon: const Icon(Icons.chevron_left),
        ),
        ..._buildPageNumbers(colorTheme, textTheme),
        IconButton(
          onPressed: currentPage < totalPages ? () => onPageChanged(currentPage + 1) : null,
          icon: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }

  List<Widget> _buildPageNumbers(ColorScheme colorTheme, TextTheme textTheme) {
    final List<Widget> pages = [];
    final Set<int> visiblePages = _getVisiblePages();

    final sortedPages = visiblePages.toList()..sort();

    for (int i = 0; i < sortedPages.length; i++) {
      final page = sortedPages[i];

      if (i > 0 && sortedPages[i] - sortedPages[i - 1] > 1) {
        pages.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text('...', style: textTheme.bodySmall),
          ),
        );
      }

      final isSelected = page == currentPage;
      pages.add(
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: InkWell(
            onTap: () => onPageChanged(page),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary600 : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  '$page',
                  style: textTheme.bodySmall?.copyWith(
                    color: isSelected ? AppColors.white : colorTheme.onSurface,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return pages;
  }

  Set<int> _getVisiblePages() {
    final Set<int> pages = {};
    pages.add(1);
    pages.add(totalPages);

    for (int i = currentPage - 1; i <= currentPage + 1; i++) {
      if (i >= 1 && i <= totalPages) pages.add(i);
    }

    if (currentPage <= 3) {
      for (int i = 1; i <= 4; i++) {
        if (i <= totalPages) pages.add(i);
      }
    }

    if (currentPage >= totalPages - 2) {
      for (int i = totalPages - 3; i <= totalPages; i++) {
        if (i >= 1) pages.add(i);
      }
    }

    return pages;
  }
}
