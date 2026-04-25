part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final String userId;
  final String message;

  const AuthSuccess({
    required this.userId,
    this.message = 'Authentication successful',
  });
}

final class AuthFailure extends AuthState {
  final String message;

  const AuthFailure({required this.message});
}
