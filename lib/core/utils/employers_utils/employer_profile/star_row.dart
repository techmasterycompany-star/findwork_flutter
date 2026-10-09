import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StarRow extends StatelessWidget {
  final double rating;
  final double? iconSize;

  const StarRow({
    super.key,
    required this.rating,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final fill = (rating - index).clamp(0.0, 1.0);
        return Icon(
          fill >= 1.0
              ? Icons.star_rounded
              : fill > 0
                  ? Icons.star_half_rounded
                  : Icons.star_border_rounded,
          color: AppColors.warning400,
          size: iconSize ?? 18.sp,
        );
      }),
    );
  }
}
