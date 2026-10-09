import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostJobLogoUpload extends StatelessWidget {
  final VoidCallback? onTap;

  const PostJobLogoUpload({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Company Logo',
              style: AppTypography.cardTitle.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.neutral800,
              ),
            ),
            Text(
              ' *',
              style: AppTypography.cardTitle.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.error500,
              ),
            ),
          ],
        ),
        SizedBox(height: 6.h),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.r),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
            decoration: BoxDecoration(
              color: AppColors.primary50.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: AppColors.primary300,
                width: 1.5,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 44.w,
                  height: 44.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white,
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.cloud_upload_outlined,
                    color: AppColors.primary600,
                    size: 24.sp,
                  ),
                ),
                SizedBox(height: 12.h),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: AppTypography.body.copyWith(
                      color: AppColors.neutral700,
                      fontWeight: FontWeight.w500,
                    ),
                    children: const [
                      TextSpan(text: 'Drag and drop your logo here, or '),
                      TextSpan(
                        text: 'browse',
                        style: TextStyle(
                          color: AppColors.primary600,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Supported files: PNG or JPG (Min 200×200 px)',
                  style: AppTypography.caption.copyWith(
                    color: AppColors.neutral500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          'Upload high-res PNG or JPG (Min 200×200 px)',
          style: AppTypography.caption.copyWith(
            color: AppColors.neutral500,
          ),
        ),
      ],
    );
  }
}
