import 'package:learn/core/error/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<String> signInWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImplement implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImplement(this.supabaseClient);

  @override
  Future<String> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      // Validate inputs
      if (email.isEmpty || password.isEmpty) {
        throw ValidationException('Email and password are required');
      }

      if (!_isValidEmail(email)) {
        throw ValidationException('Invalid email format');
      }

      if (password.length < 6) {
        throw ValidationException('Password must be at least 6 characters');
      }

      // Attempt sign in
      final response = await supabaseClient.auth.signInWithPassword(
        email: email.trim(),
        password: password,
      );

      if (response.user == null) {
        throw ServerException('Sign in failed: User is null');
      }

      return response.user!.id;
    } on AuthApiException catch (e) {
      // Handle specific Supabase auth errors
      final message = _parseAuthError(e.message);
      throw ServerException(message);
    } on ValidationException {
      rethrow;
    } on ServerException {
      rethrow;
    } catch (e) {
      if (e.toString().contains('socket') || e.toString().contains('Network')) {
        throw NetworkException('Network error. Please check your connection');
      }
      throw ServerException('Unexpected error during sign in: ${e.toString()}');
    }
  }

  @override
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      // Validate inputs
      if (name.isEmpty || email.isEmpty || password.isEmpty) {
        throw ValidationException('All fields are required');
      }

      if (name.length < 2) {
        throw ValidationException('Name must be at least 2 characters');
      }

      if (!_isValidEmail(email)) {
        throw ValidationException('Invalid email format');
      }

      if (password.length < 6) {
        throw ValidationException('Password must be at least 6 characters');
      }

      if (!_isStrongPassword(password)) {
        throw ValidationException(
          'Password must contain uppercase, lowercase, and numbers',
        );
      }

      // Attempt sign up
      final response = await supabaseClient.auth.signUp(
        password: password,
        email: email.trim(),
        data: {'name': name.trim()},
      );

      if (response.user == null) {
        throw ServerException('Sign up failed: No user record returned');
      }

      return response.user!.id;
    } on AuthApiException catch (e) {
      // Handle specific Supabase auth errors
      final message = _parseAuthError(e.message);
      throw ServerException(message);
    } on ValidationException {
      rethrow;
    } on ServerException {
      rethrow;
    } catch (e) {
      if (e.toString().contains('socket') || e.toString().contains('Network')) {
        throw NetworkException('Network error. Please check your connection');
      }
      throw ServerException('Unexpected error during sign up: ${e.toString()}');
    }
  }

  /// Validate email format
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

  /// Validate password strength
  bool _isStrongPassword(String password) {
    final hasUppercase = password.contains(RegExp(r'[A-Z]'));
    final hasLowercase = password.contains(RegExp(r'[a-z]'));
    final hasNumbers = password.contains(RegExp(r'[0-9]'));
    return hasUppercase && hasLowercase && hasNumbers;
  }

  /// Parse Supabase auth errors to user-friendly messages
  String _parseAuthError(String error) {
    if (error.contains('Invalid login credentials')) {
      return 'Invalid email or password';
    } else if (error.contains('Email not confirmed')) {
      return 'Please verify your email before signing in';
    } else if (error.contains('User already registered')) {
      return 'This email is already registered';
    } else if (error.contains('Password is too short')) {
      return 'Password must be at least 6 characters';
    } else if (error.contains('rate limit')) {
      return 'Too many attempts. Please try again later';
    } else if (error.contains('invalid email')) {
      return 'Invalid email format';
    } else {
      return error.isEmpty ? 'Authentication failed' : error;
    }
  }
}
