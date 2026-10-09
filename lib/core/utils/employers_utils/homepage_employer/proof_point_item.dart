import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProofPointItem extends StatelessWidget {
  final String text;

  const ProofPointItem({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 6.w,
          height: 6.w,
          decoration: const BoxDecoration(
            color: AppColors.primary600,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 10.w),
        Text(
          text,
          style: AppTypography.caption.copyWith(
            color: AppColors.neutral600,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
