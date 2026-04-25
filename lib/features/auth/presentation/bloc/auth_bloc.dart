import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/features/auth/domain/usecases/user_sign_in.dart';
import 'package:learn/features/auth/domain/usecases/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;

  AuthBloc({required UserSignUp userSignUp, required UserSignIn userSignIn})
    : _userSignUp = userSignUp,
      _userSignIn = userSignIn,
      super(AuthInitial()) {
    // Handle Sign Up Event
    on<AuthSignUp>((event, emit) async {
      try {
        emit(AuthLoading());
        final res = await _userSignUp(
          UserSignUpParamaters(
            email: event.email,
            password: event.password,
            name: event.name,
          ),
        );
        res.fold(
          (failure) => emit(AuthFailure(message: failure.message)),
          (userId) => emit(
            AuthSuccess(
              userId: userId,
              message: 'Account created successfully',
            ),
          ),
        );
      } catch (e) {
        emit(
          AuthFailure(message: 'An unexpected error occurred: ${e.toString()}'),
        );
      }
    });

    // Handle Sign In Event
    on<AuthSignIn>((event, emit) async {
      try {
        emit(AuthLoading());
        final res = await _userSignIn(
          UserSignInParameters(email: event.email, password: event.password),
        );
        res.fold(
          (failure) => emit(AuthFailure(message: failure.message)),
          (userId) => emit(
            AuthSuccess(userId: userId, message: 'Signed in successfully'),
          ),
        );
      } catch (e) {
        emit(
          AuthFailure(message: 'An unexpected error occurred: ${e.toString()}'),
        );
      }
    });
  }
}
