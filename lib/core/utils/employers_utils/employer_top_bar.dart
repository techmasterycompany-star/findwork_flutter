import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployerTopBar extends StatelessWidget implements PreferredSizeWidget {
 final void Function() darkmode;
  final void Function() languge;
  final void Function() notification;
  final void Function() menu;
  const EmployerTopBar({super.key, required this.darkmode, required this.languge, required this.notification, required this.menu});

  @override
  Size get preferredSize => Size.fromHeight(56.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleSpacing: 16.w,
      title: Image.asset(
        'assets/images/logo/logo_Job4u.png',
        height: 32.h,
        fit: BoxFit.contain,
      ),
      actions: [
        IconButton(
          visualDensity: VisualDensity.compact,
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          constraints: const BoxConstraints(),
          icon: Icon(
            Icons.dark_mode_outlined,
            color: AppColors.neutral800,
            size: 22.sp,
          ),
          onPressed: darkmode,
        ),
        SizedBox(width: 6.w),

        Center(
          child: InkWell(
            onTap: languge,
            borderRadius: BorderRadius.circular(4.r),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(color: AppColors.neutral800, width: 1.2.w),
              ),
              child: Text(
                'AR',
                style: AppTypography.caption.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.neutral800,
                  fontSize: 11.sp,
                  letterSpacing: 0.5,
                  height: 1.2,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 4.w),

        IconButton(
          visualDensity: VisualDensity.compact,
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          constraints: const BoxConstraints(),
          icon: Icon(
            Icons.notifications_none_rounded,
            color: AppColors.neutral800,
            size: 24.sp,
          ),
          onPressed: notification,
        ),

        IconButton(
          visualDensity: VisualDensity.compact,
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          constraints: const BoxConstraints(),
          icon: Icon(
            Icons.menu_rounded,
            color: AppColors.neutral800,
            size: 26.sp,
          ),
          onPressed: menu,
        ),
        SizedBox(width: 12.w),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1.h),
        child: Container(
          color: AppColors.neutral200,
          height: 1.h,
        ),
      ),
    );
  }
}
