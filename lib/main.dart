import 'dart:developer' as developer;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/bloc/counter_bloc.dart';
import 'package:learn/bloc/password_bloc.dart';
import 'package:learn/core/secrets/app_secrets.dart';
import 'package:learn/cubit/counter_cubit.dart';
import 'package:learn/features/auth/data/data sources/auth_remote_data_source.dart';
import 'package:learn/features/auth/data/repositories/auth_repository_implementation.dart';
import 'package:learn/features/auth/domain/usecases/user_sign_in.dart';
import 'package:learn/features/auth/domain/usecases/user_sign_up.dart';
import 'package:learn/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:learn/features/auth/presentation/pages/home.dart';
import 'package:learn/features/auth/presentation/pages/sign_in.dart';
import 'package:learn/features/auth/presentation/pages/sign_up.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Suppress socket exceptions in debugger
  developer.Timeline.instantSync(
    'FlutterApp',
    arguments: {'action': 'initialize'},
  );

  String? initializationError;

  try {
    await Supabase.initialize(
      url: AppSecrets.supabaseUrl,
      anonKey: AppSecrets.supabaseAnonKey,
    );
  } catch (e) {
    initializationError = e.toString();
  }

  // Catch all unhandled exceptions globally
  FlutterError.onError = (FlutterErrorDetails details) {
    // Suppress socket-related exceptions in debug mode
    if (details.exception.toString().contains('socket') ||
        details.exception.toString().contains('createError') ||
        details.exception.toString().contains('OS Error') ||
        details.exception.toString().contains('Connection refused')) {
      developer.log(
        'Socket exception suppressed: ${details.exception}',
        level: 500,
      );
      return;
    }
    FlutterError.presentError(details);
  };

  // Also catch async/uncaught exceptions at platform level
  PlatformDispatcher.instance.onError = (error, stack) {
    if (error.toString().contains('socket') ||
        error.toString().contains('createError') ||
        error.toString().contains('OSError') ||
        error.toString().contains('Connection refused') ||
        error.toString().contains('DioException')) {
      developer.log('Platform exception suppressed: $error', level: 500);
      return true; // Mark as handled
    }
    return false; // Let others propagate
  };

  runApp(MyApp(initializationError: initializationError));
}

class MyApp extends StatelessWidget {
  final String? initializationError;

  const MyApp({super.key, this.initializationError});

  @override
  Widget build(BuildContext context) {
    if (initializationError != null) {
      return MaterialApp(
        title: 'Auth App',
        debugShowCheckedModeBanner: false,
        home: _InitializationErrorPage(message: initializationError!),
      );
    }

    // Initialize repositories and use cases
    final authRepository = AuthRepositoryImplementation(
      AuthRemoteDataSourceImplement(Supabase.instance.client),
    );

    try {
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CounterCubit()),
          BlocProvider(create: (_) => CounterBloc()),
          BlocProvider(create: (_) => PasswordBloc()),
          BlocProvider(
            create: (_) => AuthBloc(
              userSignUp: UserSignUp(authRepository),
              userSignIn: UserSignIn(authRepository),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Authentication App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
          ),
          // Named routes for navigation
          routes: {
            '/sign-in': (context) => const SignInPage(),
            '/sign-up': (context) => const SignUpPage(),
            '/home': (context) => const HomePage(),
          },
          home: _AuthenticationWrapper(),
        ),
      );
    } catch (e) {
      developer.log('Error initializing app: $e', level: 500);
      return MaterialApp(
        title: 'Authentication App',
        debugShowCheckedModeBanner: false,
        home: _InitializationErrorPage(
          message: 'Error initializing app. Please restart.',
        ),
      );
    }
  }
}

// Widget to determine which page to show based on authentication state
class _AuthenticationWrapper extends StatelessWidget {
  const _AuthenticationWrapper();

  @override
  Widget build(BuildContext context) {
    try {
      final user = Supabase.instance.client.auth.currentUser;
      if (user != null) {
        return const HomePage();
      }
      return const SignInPage();
    } catch (e) {
      // If there's any error checking auth state, show sign in
      developer.log('Auth state check error: $e', level: 500);
      return const SignInPage();
    }
  }
}

class _InitializationErrorPage extends StatelessWidget {
  final String message;

  const _InitializationErrorPage({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.wifi_off_rounded, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                const Text(
                  'Initialization Error',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 13, color: Colors.black54),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Please check your Supabase configuration and try restarting the app.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black45,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
