import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class FooterSocialIconButton extends StatelessWidget {
  final String svgAsset;
  final VoidCallback onTap;

  const FooterSocialIconButton({
    super.key,
    required this.svgAsset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        width: 38.w,
        height: 38.w,
        decoration: BoxDecoration(
          color: const Color.fromARGB(122, 124, 58, 237),
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.neutral800, width: 1),
        ),
        alignment: Alignment.center,
        child: SvgPicture.asset(
          svgAsset,
          width: 18.w,
          height: 18.h,
          fit: BoxFit.contain,
          placeholderBuilder: (context) => Icon(
            Icons.link,
            color: AppColors.white,
            size: 16.sp,
          ),
        ),
      ),
    );
  }
}
