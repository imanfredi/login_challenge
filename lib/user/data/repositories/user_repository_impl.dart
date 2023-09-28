import 'package:fpdart/fpdart.dart';
import 'package:login/core/error/exception.dart';
import 'package:login/core/error/failure.dart';
import 'package:login/user/data/datasources/user_data_source.dart';
import 'package:login/user/data/entities/app_user_entity.dart';
import 'package:login/user/domain/models/user.dart';
import 'package:login/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDatasource userDatasource;

  UserRepositoryImpl(this.userDatasource);

  @override
  Future<Either<Failure, AppUser>> getUserByEmail({
    required String email,
  }) async {
    try {
      final Option<AppUserEntity> userEntity =
          await userDatasource.getUserByEmail(email: email);

      if (userEntity.isNone()) {
        return Left(UserNotFoundFailure(email: email));
      }

      return Right(userEntity.toNullable()!.toModel());
    } on ServerException catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AppUser>> createUser({
    required String email,
    required String id,
  }) async {
    try {
      final AppUserEntity user =
          await userDatasource.createUser(email: email, id: id);
      return Right(user.toModel());
    } on ServerException catch (e) {
      return const Left(
          ServerFailure(description: 'Error while creating user'));
    }
  }

  @override
  Future<Either<Failure, AppUser>> getUserById({
    required String id,
  }) async {
    try {
      final Option<AppUserEntity> userEntity =
          await userDatasource.getUserById(id: id);

      if (userEntity.isNone()) {
        return const Left(UserNotFoundFailure());
      }

      return Right(userEntity.toNullable()!.toModel());
    } on ServerException catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<AppUser>>> getUsers() async {
    try {
      final List<AppUserEntity> users = await userDatasource.getUsers();
      return Right(users.map((u) => u.toModel()).toList());
    } on ServerException catch (e) {
      return const Left(ServerFailure());
    }
  }
}
