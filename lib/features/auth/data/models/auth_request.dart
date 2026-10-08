import 'user.dart';

class LoginRequest {
  final String email;
  final String password;
  final UserType userType;
  final bool rememberMe;

  const LoginRequest({
    required this.email,
    required this.password,
    required this.userType,
    this.rememberMe = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'userType': userType.value,
      'rememberMe': rememberMe,
    };
  }

  LoginRequest copyWith({
    String? email,
    String? password,
    UserType? userType,
    bool? rememberMe,
  }) {
    return LoginRequest(
      email: email ?? this.email,
      password: password ?? this.password,
      userType: userType ?? this.userType,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }
}

class RegisterRequest {
  final String email;
  final String password;
  final String confirmPassword;
  final String name;
  final UserType userType;
  final String? phone;
  final bool acceptTerms;

  const RegisterRequest({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.name,
    required this.userType,
    this.phone,
    this.acceptTerms = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'name': name,
      'userType': userType.value,
      'phone': phone,
      'acceptTerms': acceptTerms,
    };
  }

  RegisterRequest copyWith({
    String? email,
    String? password,
    String? confirmPassword,
    String? name,
    UserType? userType,
    String? phone,
    bool? acceptTerms,
  }) {
    return RegisterRequest(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      name: name ?? this.name,
      userType: userType ?? this.userType,
      phone: phone ?? this.phone,
      acceptTerms: acceptTerms ?? this.acceptTerms,
    );
  }
}

class ForgotPasswordRequest {
  final String email;
  final UserType userType;

  const ForgotPasswordRequest({
    required this.email,
    required this.userType,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'userType': userType.value,
    };
  }
}

class ResetPasswordRequest {
  final String email;
  final String otp;
  final String newPassword;
  final String confirmPassword;
  final UserType userType;

  const ResetPasswordRequest({
    required this.email,
    required this.otp,
    required this.newPassword,
    required this.confirmPassword,
    required this.userType,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'otp': otp,
      'newPassword': newPassword,
      'confirmPassword': confirmPassword,
      'userType': userType.value,
    };
  }
}

class ChangePasswordRequest {
  final String currentPassword;
  final String newPassword;
  final String confirmPassword;

  const ChangePasswordRequest({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'currentPassword': currentPassword,
      'newPassword': newPassword,
      'confirmPassword': confirmPassword,
    };
  }
}