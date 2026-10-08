import 'package:findwork_flutter/features/auth/data/models/user.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthAuthenticated extends AuthState {
  final User user;

  const AuthAuthenticated(this.user);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthAuthenticated && runtimeType == other.runtimeType && user == other.user;

  @override
  int get hashCode => user.hashCode;
}

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthError && runtimeType == other.runtimeType && message == other.message;

  @override
  int get hashCode => message.hashCode;
}

class AuthForgotPasswordSent extends AuthState {
  const AuthForgotPasswordSent();
}

class AuthPasswordReset extends AuthState {
  const AuthPasswordReset();
}

class AuthPasswordChanged extends AuthState {
  const AuthPasswordChanged();
}