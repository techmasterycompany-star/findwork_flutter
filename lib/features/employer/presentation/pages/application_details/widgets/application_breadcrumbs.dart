import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationBreadcrumbs extends StatelessWidget {
  final List<String> paths;

  const ApplicationBreadcrumbs({
    Key? key,
    required this.paths,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: paths.asMap().entries.map((entry) {
          final isLast = entry.key == paths.length - 1;
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                entry.value,
                style: AppTypography.caption.copyWith(
                  color: AppColors.primary600,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (!isLast) ...[
                SizedBox(width: 8.w),
                Icon(Icons.chevron_right, size: 14.sp, color: AppColors.primary600),
                SizedBox(width: 8.w),
              ]
            ],
          );
        }).toList(),
      ),
    );
  }
}
