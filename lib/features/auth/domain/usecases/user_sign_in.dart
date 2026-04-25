import 'package:fpdart/fpdart.dart';
import 'package:learn/core/error/failures.dart';
import 'package:learn/core/usecase/usecase.dart';
import 'package:learn/features/auth/domain/repository/auth_repository.dart';

class UserSignIn implements Usecase<String, UserSignInParameters> {
  final AuthRepository authRepository;
  const UserSignIn(this.authRepository);

  @override
  Future<Either<Failure, String>> call(UserSignInParameters params) async {
    return await authRepository.signInWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignInParameters {
  final String email;
  final String password;

  UserSignInParameters({required this.email, required this.password});
}
