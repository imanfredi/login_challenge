import 'package:fpdart/fpdart.dart';
import 'package:login/core/error/failure.dart';
import 'package:login/user/models/app_user.dart';

abstract class AuthRepository {
  Future<Either<Failure, AppUser>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, AppUser>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, AppUser?>> restoreSession();

  Future<Either<Failure, AppUser>> signInWithGoogle();
}
