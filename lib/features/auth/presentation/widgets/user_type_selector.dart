import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/features/auth/data/models/user.dart';
import 'package:findwork_flutter/features/auth/presentation/constants/auth_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserTypeSelector extends StatelessWidget {
  final UserType selectedType;
  final ValueChanged<UserType> onChanged;
  final bool enabled;

  const UserTypeSelector({
    super.key,
    required this.selectedType,
    required this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: AuthConstants.userTypeOptions.map((option) {
        final isSelected = selectedType == option.type;
        return _UserTypeCard(
          option: option,
          isSelected: isSelected,
          onTap: enabled ? () => onChanged(option.type) : null,
        );
      }).toList(),
    );
  }
}

class _UserTypeCard extends StatelessWidget {
  final UserTypeOption option;
  final bool isSelected;
  final VoidCallback? onTap;

  const _UserTypeCard({
    required this.option,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      margin: EdgeInsets.only(bottom: 12.h),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
          child: Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
              border: Border.all(
                color: isSelected ? option.colorValue : AppColors.neutral200,
                width: isSelected ? 2 : 1,
              ),
              color: isSelected ? option.bgColorValue : AppColors.white,
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: option.colorValue.withValues(alpha: 0.15),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
            ),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: isSelected ? option.colorValue : option.bgColorValue,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
                  ),
                  child: Icon(
                    isSelected ? option.selectedIcon : option.icon,
                    size: 24.sp,
                    color: isSelected ? AppColors.white : option.colorValue,
                  ),
                ),
                AppSpacing.horizontal16,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        option.title,
                        style: AppTypography.cardTitle.copyWith(
                          color: isSelected
                              ? option.colorValue
                              : AppColors.neutral900,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      AppSpacing.vertical4,
                      Text(
                        option.subtitle,
                        style: AppTypography.smallText.copyWith(
                          color: AppColors.neutral500,
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? option.colorValue : AppColors.neutral300,
                      width: 2,
                    ),
                    color: isSelected ? option.colorValue : Colors.transparent,
                  ),
                  child: isSelected
                      ? Icon(
                          Icons.check,
                          size: 16.sp,
                          color: AppColors.white,
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserTypePillSelector extends StatelessWidget {
  final UserType selectedType;
  final ValueChanged<UserType> onChanged;
  final bool enabled;

  const UserTypePillSelector({
    super.key,
    required this.selectedType,
    required this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: AuthConstants.userTypeOptions.map((option) {
        final isSelected = selectedType == option.type;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: option.type == UserType.candidate ? 8.w : 0),
            child: _UserTypePill(
              option: option,
              isSelected: isSelected,
              onTap: enabled ? () => onChanged(option.type) : null,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _UserTypePill extends StatelessWidget {
  final UserTypeOption option;
  final bool isSelected;
  final VoidCallback? onTap;

  const _UserTypePill({
    required this.option,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
              border: Border.all(
                color: isSelected ? option.colorValue : AppColors.neutral200,
                width: isSelected ? 2 : 1,
              ),
              color: isSelected ? option.colorValue : AppColors.white,
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: option.colorValue.withValues(alpha: 0.15),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : null,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isSelected ? option.selectedIcon : option.icon,
                  size: 28.sp,
                  color: isSelected ? AppColors.white : option.colorValue,
                ),
                AppSpacing.vertical8,
                Text(
                  option.title,
                  style: AppTypography.smallText.copyWith(
                    color: isSelected ? AppColors.white : AppColors.neutral700,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                AppSpacing.vertical4,
                Text(
                  option.subtitle,
                  style: AppTypography.caption.copyWith(
                    color: isSelected
                        ? AppColors.white.withValues(alpha: 0.9)
                        : AppColors.neutral500,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}