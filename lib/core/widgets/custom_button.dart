import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum CustomButtonVariant {
  primary,
  secondary,
  outlined,
  text,
  dark,
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final CustomButtonVariant variant;
  final IconData? icon;
  final Widget? iconWidget;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool isLoading;
  final bool isDisabled;
  final EdgeInsetsGeometry? padding;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = CustomButtonVariant.primary,
    this.icon,
    this.iconWidget,
    this.height,
    this.width,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.fontSize,
    this.fontWeight,
    this.isLoading = false,
    this.isDisabled = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveHeight = height ?? 44.h;
    final effectiveRadius = borderRadius ?? 8.r;

    Color bg;
    Color fg;
    BorderSide borderSide = BorderSide.none;

    switch (variant) {
      case CustomButtonVariant.primary:
        bg = backgroundColor ?? AppColors.primary600;
        fg = textColor ?? AppColors.white;
        break;
      case CustomButtonVariant.secondary:
        bg = backgroundColor ?? AppColors.primary50;
        fg = textColor ?? AppColors.primary600;
        break;
      case CustomButtonVariant.outlined:
        bg = backgroundColor ?? Colors.transparent;
        fg = textColor ?? AppColors.primary600;
        borderSide = BorderSide(
          color: borderColor ?? AppColors.primary600,
          width: 1.2.w,
        );
        break;
      case CustomButtonVariant.text:
        bg = backgroundColor ?? Colors.transparent;
        fg = textColor ?? AppColors.primary600;
        break;
      case CustomButtonVariant.dark:
        bg = backgroundColor ?? AppColors.primary950;
        fg = textColor ?? AppColors.white;
        break;
    }

    if (isDisabled) {
      bg = AppColors.neutral200;
      fg = AppColors.neutral400;
      borderSide = BorderSide.none;
    }

    final Widget labelWidget = Text(
      text,
      style: AppTypography.smallText.copyWith(
        color: fg,
        fontWeight: fontWeight ?? FontWeight.w600,
        fontSize: fontSize ?? 14.sp,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );

    Widget content;
    if (isLoading) {
      content = SizedBox(
        height: 20.sp,
        width: 20.sp,
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          valueColor: AlwaysStoppedAnimation<Color>(fg),
        ),
      );
    } else {
      final leadingIcon = iconWidget ??
          (icon != null
              ? Icon(
                  icon,
                  size: (fontSize ?? 14.sp) + 2.sp,
                  color: fg,
                )
              : null);

      if (leadingIcon != null) {
        content = Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            leadingIcon,
            SizedBox(width: 8.w),
            Flexible(child: labelWidget),
          ],
        );
      } else {
        content = labelWidget;
      }
    }

    Widget buttonWidget = SizedBox(
      height: effectiveHeight,
      width: width,
      child: Material(
        color: bg,
        borderRadius: BorderRadius.circular(effectiveRadius),
        child: InkWell(
          onTap: (isDisabled || isLoading) ? null : onPressed,
          borderRadius: BorderRadius.circular(effectiveRadius),
          child: Container(
            padding: padding ??
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(effectiveRadius),
              border: borderSide != BorderSide.none
                  ? Border.all(
                      color: borderSide.color, width: borderSide.width)
                  : null,
            ),
            alignment: Alignment.center,
            child: content,
          ),
        ),
      ),
    );

    return buttonWidget;
  }
}
