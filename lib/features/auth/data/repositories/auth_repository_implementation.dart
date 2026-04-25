import 'package:fpdart/fpdart.dart';
import 'package:learn/core/error/exceptions.dart';
import 'package:learn/core/error/failures.dart';
import 'package:learn/features/auth/data/data sources/auth_remote_data_source.dart';
import 'package:learn/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImplementation implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  const AuthRepositoryImplementation(this.remoteDataSource);

  @override
  Future<Either<Failure, String>> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userId = await remoteDataSource.signInWithEmailPassword(
        email: email,
        password: password,
      );
      return right(userId);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } on NetworkException catch (e) {
      return left(Failure(e.message));
    } on ValidationException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure('An unexpected error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userId = await remoteDataSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password,
      );
      return right(userId);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } on NetworkException catch (e) {
      return left(Failure(e.message));
    } on ValidationException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure('An unexpected error occurred: ${e.toString()}'));
    }
  }
}
