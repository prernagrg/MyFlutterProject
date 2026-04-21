import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn/bloc/counter_bloc.dart';
import 'package:learn/bloc/password_bloc.dart';
import 'package:learn/core/secrets/app_secrets.dart';
import 'package:learn/cubit/counter_cubit.dart';
import 'package:learn/features/auth/data/data%20sources/auth_remote_data_source.dart';
import 'package:learn/features/auth/data/repositories/auth_repository_implementation.dart';
import 'package:learn/features/auth/domain/usecases/user_sign_up.dart';
import 'package:learn/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:learn/features/auth/presentation/pages/sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.subabaseAnonKey,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterCubit()),
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => PasswordBloc()),
        BlocProvider(
          create: (_) => AuthBloc(
            userSignUp: UserSignUp(
              AuthRepositoryImplementation(
                AuthRemoteDataSourceImplement(Supabase.instance.client),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        ),
        home: SignInPage(),
      ),
    );
  }
}
