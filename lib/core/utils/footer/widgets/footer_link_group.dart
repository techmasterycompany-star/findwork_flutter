import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FooterLinkGroup extends StatelessWidget {
  final String title;
  final List<String> links;

  const FooterLinkGroup({
    super.key,
    required this.title,
    required this.links,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.smallText.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.white,
            letterSpacing: 0.3,
          ),
        ),
        SizedBox(height: 12.h),
        ...links.map(
          (link) => Padding(
            padding: EdgeInsets.symmetric(vertical: 6.h),
            child: InkWell(
              onTap: () {},
              child: Text(
                link,
                style: AppTypography.smallText.copyWith(
                  color: AppColors.neutral400,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
