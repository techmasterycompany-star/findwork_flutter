import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostJobStepper extends StatelessWidget {
  final int currentStep;

  const PostJobStepper({
    super.key,
    this.currentStep = 3,
  });

  static const List<String> _labels = [
    'Details',
    'Description',
    'Comp.',
    'Info',
    'Review',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(_labels.length * 2 - 1, (i) {
        if (i.isOdd) {
          final stepBefore = (i ~/ 2) + 1;
          final isCompleted = stepBefore < currentStep;
          return Expanded(
            child: Container(
              height: 2.h,
              color: isCompleted ? AppColors.success500 : AppColors.neutral200,
            ),
          );
        }

        final stepIndex = i ~/ 2 + 1;
        final isActive = stepIndex == currentStep;
        final isCompleted = stepIndex < currentStep;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 22.w,
              height: 22.h,
              decoration: BoxDecoration(
                color: isCompleted
                    ? AppColors.success500
                    : isActive
                        ? AppColors.primary600
                        : AppColors.neutral50,
                borderRadius: BorderRadius.circular(11.r),
                border: (isActive || isCompleted)
                    ? null
                    : Border.all(color: AppColors.neutral300),
              ),
              alignment: Alignment.center,
              child: isCompleted
                  ? Icon(
                      Icons.check_rounded,
                      size: 13.sp,
                      color: AppColors.white,
                    )
                  : Text(
                      '$stepIndex',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: isActive ? AppColors.white : AppColors.neutral600,
                      ),
                    ),
            ),
            SizedBox(height: 4.h),
            Text(
              _labels[stepIndex - 1],
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: isActive
                    ? AppColors.primary600
                    : isCompleted
                        ? AppColors.neutral800
                        : AppColors.neutral400,
              ),
            ),
          ],
        );
      }),
    );
  }
}
