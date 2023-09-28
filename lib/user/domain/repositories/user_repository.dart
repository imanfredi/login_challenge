import 'package:fpdart/fpdart.dart';
import 'package:login/core/error/failure.dart';
import 'package:login/user/domain/models/user.dart';

abstract class UserRepository {
  Future<Either<Failure, AppUser>> getUserByEmail({
    required String email,
  });

  Future<Either<Failure, AppUser>> createUser({
    required String email,
    required String id,
  });

  Future<Either<Failure, AppUser>> getUserById({
    required String id,
  });

  Future<Either<Failure, List<AppUser>>> getUsers();
}
