import 'package:flutter/material.dart';

class CustomPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageChanged;

  const CustomPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // سهم السابقة
        IconButton(
          onPressed: currentPage > 1
              ? () => onPageChanged(currentPage - 1)
              : null,
          icon: const Icon(Icons.chevron_left, size: 20),
          color: Colors.grey[600],
        ),

        // أرقام الصفحات
        ..._buildPageNumbers(),

        // سهم التالية
        IconButton(
          onPressed: currentPage < totalPages
              ? () => onPageChanged(currentPage + 1)
              : null,
          icon: const Icon(Icons.chevron_right, size: 20),
          color: Colors.grey[600],
        ),
      ],
    );
  }

  List<Widget> _buildPageNumbers() {
    List<Widget> pages = [];

    // استراتيجية عرض الأرقام مثل الصورة الأولى (1, 2, 3, ..., 9, 10)
    List<int> pagesToShow = [];
    if (totalPages <= 5) {
      pagesToShow = List.generate(totalPages, (i) => i + 1);
    } else {
      if (currentPage <= 3) {
        pagesToShow = [1, 2, 3];
      } else if (currentPage >= totalPages - 2) {
        pagesToShow = [totalPages - 2, totalPages - 1, totalPages];
      } else {
        pagesToShow = [currentPage - 1, currentPage, currentPage + 1];
      }
    }

    // إضافة الرقم 1 إذا لم يكن ضمن القائمة
    if (!pagesToShow.contains(1)) {
      pages.add(_buildPageButton(1));
      if (!pagesToShow.contains(2)) {
        pages.add(_buildDots());
      }
    }

    // إضافة الأرقام الأساسية
    for (int page in pagesToShow) {
      pages.add(_buildPageButton(page));
    }

    // إضافة الرقم الأخير إذا لم يكن ضمن القائمة
    if (!pagesToShow.contains(totalPages)) {
      if (!pagesToShow.contains(totalPages - 1)) {
        pages.add(_buildDots());
      }
      pages.add(_buildPageButton(totalPages));
    }

    return pages;
  }

  Widget _buildPageButton(int page) {
    final isSelected = page == currentPage;

    return GestureDetector(
      onTap: () => onPageChanged(page),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: 36,
        height: 36,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: isSelected
              ? Border.all(color: Colors.grey[400]!, width: 1.5)
              : null,
        ),
        child: Text(
          '$page',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildDots() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Text('...', style: TextStyle(color: Colors.grey, fontSize: 14)),
    );
  }
}
