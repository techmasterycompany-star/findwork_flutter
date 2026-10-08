import 'package:findwork_flutter/features/auth/data/models/auth_request.dart';
import 'package:findwork_flutter/features/auth/data/models/user.dart';

abstract class AuthRepository {
  Future<AuthResponse> login(LoginRequest request);
  Future<AuthResponse> register(RegisterRequest request);
  Future<void> forgotPassword(ForgotPasswordRequest request);
  Future<void> resetPassword(ResetPasswordRequest request);
  Future<void> changePassword(ChangePasswordRequest request);
  Future<User> getCurrentUser();
  Future<void> logout();
  Future<void> saveTokens(AuthTokens tokens);
  Future<AuthTokens?> getTokens();
  Future<void> clearTokens();
}