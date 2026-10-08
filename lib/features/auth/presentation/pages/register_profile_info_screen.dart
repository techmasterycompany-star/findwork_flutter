import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/features/auth/data/models/auth_request.dart';
import 'package:findwork_flutter/features/auth/data/models/user.dart';
import 'package:findwork_flutter/features/auth/business_logic/cubit/auth_bloc.dart';
import 'package:findwork_flutter/features/auth/presentation/widgets/auth_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class RegisterProfileInfoScreen extends StatefulWidget {
  final Map<String, dynamic> accountData;

  const RegisterProfileInfoScreen({super.key, required this.accountData});

  @override
  State<RegisterProfileInfoScreen> createState() => _RegisterProfileInfoScreenState();
}

class _RegisterProfileInfoScreenState extends State<RegisterProfileInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  late UserType _userType;

  final _companyNameController = TextEditingController();
  final _companySizeController = TextEditingController();
  final _industryController = TextEditingController();
  final _websiteController = TextEditingController();
  final _descriptionController = TextEditingController();

  final _jobTitleController = TextEditingController();
  final _skillsController = TextEditingController();
  final _experienceController = TextEditingController();
  final _educationController = TextEditingController();

  XFile? _avatarImage;
  XFile? _companyLogo;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _userType = widget.accountData['userType'] as UserType? ?? UserType.candidate;
  }

  @override
  void dispose() {
    _companyNameController.dispose();
    _companySizeController.dispose();
    _industryController.dispose();
    _websiteController.dispose();
    _descriptionController.dispose();
    _jobTitleController.dispose();
    _skillsController.dispose();
    _experienceController.dispose();
    _educationController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(bool isAvatar) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (picked != null) {
      setState(() {
        if (isAvatar) {
          _avatarImage = picked;
        } else {
          _companyLogo = picked;
        }
      });
    }
  }

  String? _validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  void _handleRegister() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);

      final request = RegisterRequest(
        email: widget.accountData['email'] as String,
        password: widget.accountData['password'] as String,
        confirmPassword: widget.accountData['confirmPassword'] as String,
        name: widget.accountData['name'] as String,
        userType: _userType,
        phone: widget.accountData['phone'] as String?,
        acceptTerms: widget.accountData['acceptTerms'] as bool? ?? false,
      );

      try {
        await context.read<AuthCubit>().register(request);
        if (mounted) {
          context.go('/congratulation');
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.toString()),
              backgroundColor: AppColors.error600,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
              ),
            ),
          );
        }
      } finally {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          context.go('/congratulation');
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.error600,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
              ),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, size: 20.sp),
            onPressed: () => context.go('/register/account-info', extra: _userType.name),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppSpacing.vertical8,
                  _buildHeader(),
                  AppSpacing.vertical40,
                  if (_userType == UserType.employer) ..._buildEmployerFields(),
                  if (_userType == UserType.candidate) ..._buildCandidateFields(),
                  AppSpacing.vertical32,
                  _buildRegisterButton(),
                  AppSpacing.vertical32,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Complete Profile',
          style: AppTypography.h2.copyWith(fontSize: 28.sp),
        ),
        AppSpacing.vertical8,
        Text(
          'Step 2 of 2: Profile Information',
          style: AppTypography.body.copyWith(color: AppColors.neutral600),
        ),
      ],
    );
  }

  List<Widget> _buildEmployerFields() {
    return [
      _buildSectionTitle('Company Information'),
      AppSpacing.vertical16,
      _buildAvatarPicker('Company Logo', _companyLogo, () => _pickImage(false)),
      AppSpacing.vertical20,
      AuthTextFormField(
        controller: _companyNameController,
        hintText: 'Enter company name',
        labelText: 'Company Name',
        prefixIcon: Icons.business_outlined,
        validator: (v) => _validateRequired(v, 'Company Name'),
      ),
      AppSpacing.vertical20,
      AuthTextFormField(
        controller: _companySizeController,
        hintText: 'e.g., 1-10, 11-50, 51-200, 201-500, 500+',
        labelText: 'Company Size',
        prefixIcon: Icons.people_outline,
        validator: (v) => _validateRequired(v, 'Company Size'),
      ),
      AppSpacing.vertical20,
      AuthTextFormField(
        controller: _industryController,
        hintText: 'e.g., Technology, Healthcare, Finance',
        labelText: 'Industry',
        prefixIcon: Icons.category_outlined,
        validator: (v) => _validateRequired(v, 'Industry'),
      ),
      AppSpacing.vertical20,
      AuthTextFormField(
        controller: _websiteController,
        hintText: 'https://company.com',
        labelText: 'Website (optional)',
        prefixIcon: Icons.language_outlined,
        keyboardType: TextInputType.url,
      ),
      AppSpacing.vertical20,
      AuthTextFormField(
        controller: _descriptionController,
        hintText: 'Describe your company...',
        labelText: 'Company Description',
        prefixIcon: Icons.description_outlined,
        maxLines: 4,
        validator: (v) => _validateRequired(v, 'Company Description'),
      ),
    ];
  }

  List<Widget> _buildCandidateFields() {
    return [
      _buildSectionTitle('Professional Information'),
      AppSpacing.vertical16,
      _buildAvatarPicker('Profile Photo', _avatarImage, () => _pickImage(true)),
      AppSpacing.vertical20,
      AuthTextFormField(
        controller: _jobTitleController,
        hintText: 'e.g., Software Engineer, Marketing Manager',
        labelText: 'Current Job Title',
        prefixIcon: Icons.work_outline,
        validator: (v) => _validateRequired(v, 'Job Title'),
      ),
      AppSpacing.vertical20,
      AuthTextFormField(
        controller: _skillsController,
        hintText: 'e.g., Flutter, Dart, Python, React',
        labelText: 'Skills (comma separated)',
        prefixIcon: Icons.star_outline,
        validator: (v) => _validateRequired(v, 'Skills'),
      ),
      AppSpacing.vertical20,
      AuthTextFormField(
        controller: _experienceController,
        hintText: 'e.g., 5 years in mobile development...',
        labelText: 'Experience Summary',
        prefixIcon: Icons.timeline_outlined,
        maxLines: 3,
        validator: (v) => _validateRequired(v, 'Experience'),
      ),
      AppSpacing.vertical20,
      AuthTextFormField(
        controller: _educationController,
        hintText: 'e.g., BS Computer Science, University',
        labelText: 'Education',
        prefixIcon: Icons.school_outlined,
      ),
    ];
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppTypography.cardTitle.copyWith(
        fontSize: 18.sp,
        color: AppColors.neutral900,
      ),
    );
  }

  Widget _buildAvatarPicker(String label, XFile? image, VoidCallback onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.smallText.copyWith(
            color: AppColors.neutral700,
            fontWeight: FontWeight.w500,
          ),
        ),
        AppSpacing.vertical8,
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 120.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
              border: Border.all(
                color: AppColors.neutral200,
                width: 1,
                style: BorderStyle.solid,
              ),
              color: AppColors.neutral50,
            ),
            child: image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
                    child: Image.file(
                      image.path as dynamic,
                      width: double.infinity,
                      height: 120.h,
                      fit: BoxFit.cover,
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.cloud_upload_outlined,
                        size: 32.sp,
                        color: AppColors.neutral400,
                      ),
                      AppSpacing.vertical8,
                      Text(
                        'Tap to upload $label',
                        style: AppTypography.body.copyWith(
                          color: AppColors.neutral500,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterButton() {
    return SizedBox(
      height: 56.h,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _handleRegister,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary600,
          foregroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
          ),
        ),
        child: _isLoading
            ? SizedBox(
                height: 20.sp,
                width: 20.sp,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                ),
              )
            : Text(
                'Create Account',
                style: AppTypography.body.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
      ),
    );
  }
}