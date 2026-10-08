import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final int? maxLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final bool enabled;
  final String? errorText;

  const AuthTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.maxLines,
    this.maxLength,
    this.textInputAction,
    this.onFieldSubmitted,
    this.enabled = true,
    this.errorText,
  });

  @override
  State<AuthTextFormField> createState() => _AuthTextFormFieldState();
}

class _AuthTextFormFieldState extends State<AuthTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final hasError = widget.errorText != null || (widget.validator?.call(widget.controller.text) != null);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...[
          Text(
            widget.labelText!,
            style: AppTypography.smallText.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.neutral700,
            ),
          ),
          AppSpacing.vertical8,
        ],
        TextFormField(
          controller: widget.controller,
          obscureText: _obscureText,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          maxLines: widget.maxLines ?? 1,
          maxLength: widget.maxLength,
          textInputAction: widget.textInputAction,
          onFieldSubmitted: widget.onFieldSubmitted,
          enabled: widget.enabled,
          style: AppTypography.body.copyWith(color: AppColors.neutral900),
          decoration: InputDecoration(
            counterText: '',
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            hintText: widget.hintText,
            hintStyle: AppTypography.body.copyWith(color: AppColors.neutral400),
            prefixIcon: widget.prefixIcon != null
                ? Padding(
                    padding: EdgeInsets.all(12.w),
                    child: Icon(
                      widget.prefixIcon,
                      size: 20.sp,
                      color: AppColors.neutral400,
                    ),
                  )
                : null,
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      size: 20.sp,
                      color: AppColors.neutral400,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : widget.suffixIcon,
            filled: true,
            fillColor: AppColors.neutral50,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
              borderSide: BorderSide(
                color: hasError ? AppColors.error500 : AppColors.neutral200,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
              borderSide: BorderSide(
                color: hasError ? AppColors.error500 : AppColors.primary600,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
              borderSide: BorderSide(color: AppColors.error500, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
              borderSide: BorderSide(color: AppColors.error500, width: 1.5),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
              borderSide: BorderSide(color: AppColors.neutral200, width: 1),
            ),
            errorText: widget.errorText,
            errorStyle: AppTypography.caption.copyWith(color: AppColors.error600),
          ),
        ),
      ],
    );
  }
}

class AuthPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final bool enabled;

  const AuthPasswordField({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.validator,
    this.textInputAction,
    this.onFieldSubmitted,
    this.enabled = true,
  });

  @override
  State<AuthPasswordField> createState() => _AuthPasswordFieldState();
}

class _AuthPasswordFieldState extends State<AuthPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return AuthTextFormField(
      controller: widget.controller,
      hintText: widget.hintText,
      labelText: widget.labelText,
      prefixIcon: Icons.lock_outline,
      obscureText: true,
      validator: widget.validator,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onFieldSubmitted,
      enabled: widget.enabled,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
          size: 20.sp,
          color: AppColors.neutral400,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      ),
    );
  }
}

class AuthCheckbox extends StatelessWidget {
  final bool value;
  final String label;
  final ValueChanged<bool?> onChanged;
  final Color? activeColor;
  final double size;

  const AuthCheckbox({
    super.key,
    required this.value,
    required this.label,
    required this.onChanged,
    this.activeColor,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: size.w,
          height: size.h,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: activeColor ?? AppColors.primary600,
            checkColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
            side: BorderSide(
              color: value ? AppColors.primary600 : AppColors.neutral300,
              width: 1.5,
            ),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
          ),
        ),
        AppSpacing.horizontal8,
        Expanded(
          child: GestureDetector(
            onTap: () => onChanged(!value),
            child: Text(
              label,
              style: AppTypography.smallText.copyWith(
                color: AppColors.neutral700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AuthRichText extends StatelessWidget {
  final String text;
  final String actionText;
  final VoidCallback onTap;
  final TextStyle? textStyle;
  final TextStyle? actionStyle;

  const AuthRichText({
    super.key,
    required this.text,
    required this.actionText,
    required this.onTap,
    this.textStyle,
    this.actionStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: textStyle ?? AppTypography.smallText.copyWith(
            color: AppColors.neutral600,
          ),
        ),
        AppSpacing.horizontal4,
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionText,
            style: actionStyle ?? AppTypography.smallText.copyWith(
              color: AppColors.primary600,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class AuthDivider extends StatelessWidget {
  final String text;

  const AuthDivider({
    super.key,
    this.text = 'Or continue with',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColors.neutral200,
            thickness: 1,
            height: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            text,
            style: AppTypography.caption.copyWith(color: AppColors.neutral500),
          ),
        ),
        Expanded(
          child: Divider(
            color: AppColors.neutral200,
            thickness: 1,
            height: 1,
          ),
        ),
      ],
    );
  }
}

class AuthSocialButton extends StatelessWidget {
  final String label;
  final Widget icon;
  final VoidCallback? onPressed;
  final bool isLoading;

  const AuthSocialButton({
    super.key,
    required this.label,
    required this.icon,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        side: BorderSide(color: AppColors.neutral300, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
        ),
        backgroundColor: AppColors.white,
      ),
      child: isLoading
          ? SizedBox(
              height: 20.sp,
              width: 20.sp,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary600),
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                AppSpacing.horizontal12,
                Text(
                  label,
                  style: AppTypography.body.copyWith(
                    color: AppColors.neutral700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
    );
  }
}