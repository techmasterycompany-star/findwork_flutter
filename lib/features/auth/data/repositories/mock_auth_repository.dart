import 'package:findwork_flutter/features/auth/data/models/auth_request.dart';
import 'package:findwork_flutter/features/auth/data/models/user.dart';
import 'package:findwork_flutter/features/auth/data/repositories/auth_repository.dart';

class MockAuthRepository implements AuthRepository {

  // =========================================
  // ================ TESTING ================
  static const _mockUser = User(
    id: '1',
    email: 'test@example.com',
    name: 'John Doe',
    userType: UserType.candidate,
    avatarUrl: null,
    phone: '+1234567890',
    createdAt: null,
    isVerified: true,
  );

  static const _mockEmployerUser = User(
    id: '2',
    email: 'employer@example.com',
    name: 'Jane Smith',
    userType: UserType.employer,
    avatarUrl: null,
    phone: '+1234567890',
    createdAt: null,
    isVerified: true,
  );
  // ================ TESTING ================
  // =========================================

  static const _mockTokens = AuthTokens(
    accessToken: 'mock_access_token',
    refreshToken: 'mock_refresh_token',
    expiresIn: 3600,
  );

  @override
  Future<AuthResponse> login(LoginRequest request) async {
    await Future.delayed(const Duration(milliseconds: 1000));

    if (request.email == 'error@test.com') {
      throw Exception('Invalid credentials');
    }

    final user = request.userType == UserType.employer
        ? _mockEmployerUser
        : _mockUser.copyWith(email: request.email);

    return AuthResponse(user: user, tokens: _mockTokens);
  }

  @override
  Future<AuthResponse> register(RegisterRequest request) async {
    await Future.delayed(const Duration(milliseconds: 1000));

    if (request.email == 'error@test.com') {
      throw Exception('Email already exists');
    }

    final user = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      email: request.email,
      name: request.name,
      userType: request.userType,
      phone: request.phone,
      createdAt: DateTime.now(),
      isVerified: false,
    );

    return AuthResponse(user: user, tokens: _mockTokens);
  }

  @override
  Future<void> forgotPassword(ForgotPasswordRequest request) async {
    await Future.delayed(const Duration(milliseconds: 1000));

    if (request.email == 'error@test.com') {
      throw Exception('Email not found');
    }
  }

  @override
  Future<void> resetPassword(ResetPasswordRequest request) async {
    await Future.delayed(const Duration(milliseconds: 1000));

    if (request.otp != '123456') {
      throw Exception('Invalid OTP');
    }
  }

  @override
  Future<void> changePassword(ChangePasswordRequest request) async {
    await Future.delayed(const Duration(milliseconds: 500));

    if (request.currentPassword == 'wrong') {
      throw Exception('Current password is incorrect');
    }
  }

  @override
  Future<User> getCurrentUser() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockUser;
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 300));
  }

  @override
  Future<void> saveTokens(AuthTokens tokens) async {
    await Future.delayed(const Duration(milliseconds: 100));
  }

  @override
  Future<AuthTokens?> getTokens() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _mockTokens;
  }

  @override
  Future<void> clearTokens() async {
    await Future.delayed(const Duration(milliseconds: 100));
  }
}