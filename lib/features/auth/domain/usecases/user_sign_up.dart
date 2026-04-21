import 'package:fpdart/fpdart.dart';
import 'package:learn/core/error/failures.dart';
import 'package:learn/core/usecase/usecase.dart';
import 'package:learn/features/auth/domain/repository/auth_repository.dart';

class UserSignUp implements Usecase<String, userSignUpParamaters> {
  final AuthRepository authRepository;
  const UserSignUp(this.authRepository);
  @override
  Future<Either<Failure, String>> call(userSignUpParamaters params) async {
    return await authRepository.signInWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class userSignUpParamaters {
  final String email;
  final String password;
  final String name;

  userSignUpParamaters({
    required this.email,
    required this.password,
    required this.name,
  });
}
