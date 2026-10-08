import 'package:bloc/bloc.dart';
import 'package:findwork_flutter/features/auth/data/models/auth_request.dart';
import 'package:findwork_flutter/features/auth/data/repositories/auth_repository.dart';
import 'package:findwork_flutter/features/auth/business_logic/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(const AuthInitial());

  Future<void> login(LoginRequest request) async {
    emit(const AuthLoading());
    try {
      final response = await _authRepository.login(request);
      await _authRepository.saveTokens(response.tokens);
      emit(AuthAuthenticated(response.user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> register(RegisterRequest request) async {
    emit(const AuthLoading());
    try {
      final response = await _authRepository.register(request);
      await _authRepository.saveTokens(response.tokens);
      emit(AuthAuthenticated(response.user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> forgotPassword(ForgotPasswordRequest request) async {
    emit(const AuthLoading());
    try {
      await _authRepository.forgotPassword(request);
      emit(const AuthForgotPasswordSent());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> resetPassword(ResetPasswordRequest request) async {
    emit(const AuthLoading());
    try {
      await _authRepository.resetPassword(request);
      emit(const AuthPasswordReset());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> changePassword(ChangePasswordRequest request) async {
    emit(const AuthLoading());
    try {
      await _authRepository.changePassword(request);
      emit(const AuthPasswordChanged());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> checkAuthStatus() async {
    emit(const AuthLoading());
    try {
      final tokens = await _authRepository.getTokens();
      if (tokens != null) {
        final user = await _authRepository.getCurrentUser();
        emit(AuthAuthenticated(user));
      } else {
        emit(const AuthUnauthenticated());
      }
    } catch (e) {
      await _authRepository.clearTokens();
      emit(const AuthUnauthenticated());
    }
  }

  Future<void> logout() async {
    emit(const AuthLoading());
    try {
      await _authRepository.logout();
      emit(const AuthUnauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void clearError() {
    if (state is AuthError) {
      emit(const AuthUnauthenticated());
    }
  }
}