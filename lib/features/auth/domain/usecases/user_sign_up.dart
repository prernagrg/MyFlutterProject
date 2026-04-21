import 'package:fpdart/fpdart.dart';
import 'package:learn/core/error/failures.dart';
import 'package:learn/core/usecase/usecase.dart';
import 'package:learn/features/auth/domain/repository/auth_repository.dart';

class UserSignUp implements Usecase<String, UserSignUpParamaters> {
  final AuthRepository authRepository;
  const UserSignUp(this.authRepository);
  @override
  Future<Either<Failure, String>> call(UserSignUpParamaters params) async {
    return await authRepository.signUpWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParamaters {
  final String email;
  final String password;
  final String name;

  UserSignUpParamaters({
    required this.email,
    required this.password,
    required this.name,
  });
}
