import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login/auth/data/datasources/auth_data_source.dart';
import 'package:login/auth/domain/repositories/auth_repository.dart';
import 'package:login/core/error/failure.dart';
import 'package:login/user/domain/models/user.dart';
import 'package:login/user/domain/repositories/user_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDatasource;
  final UserRepository userRepository;

  AuthRepositoryImpl(this.authDatasource, this.userRepository);

  @override
  Future<Either<Failure, AppUser>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      User? user = await authDatasource.signInWithEmailAndPassword(
          email: email, password: password);
      final userEither =
          await userRepository.getUserByEmail(email: user!.email!);

      return Right(userEither.getRight().toNullable()!);
    } on FirebaseAuthException catch (e) {
      return Left(
        FirebaseAuthFailure(
          message: e.code,
          description: e.message ?? '',
        ),
      );
    } on Exception catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await authDatasource.signOut();
      GoogleSignIn().signOut();
    } on FirebaseAuthException catch (e) {
      return Left(
        FirebaseAuthFailure(
          message: e.code,
          description: e.message ?? '',
        ),
      );
    }
    return const Right(null);
  }

  @override
  Future<Either<Failure, AppUser>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      User? user = await authDatasource.signUpWithEmailAndPassword(
          email: email, password: password);

      final userEither =
          await userRepository.createUser(email: user!.email!, id: user.uid);

      return Right(userEither.getRight().toNullable()!);
    } on FirebaseAuthException catch (e) {
      return Left(
        FirebaseAuthFailure(
          message: e.code,
          description: e.message ?? '',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AppUser?>> restoreSession() async {
    User? firebaseAuthUser = authDatasource.getCurrentUser();

    if (firebaseAuthUser != null) {
      try {
        /// Returns the current token if it has not expired. Otherwise, this will
        /// restore the token and return a new one.
        await firebaseAuthUser.getIdToken(true);

        final userEither =
            await userRepository.getUserById(id: firebaseAuthUser.uid);

        return Right(userEither.getRight().toNullable()!);
      } catch (e) {
        return const Right(null);
      }
    }
    return const Right(null);
  }

  @override
  Future<Either<Failure, AppUser>> signInWithGoogle() async {
    Either<Failure, AppUser>? userEither;
    try {
      User? user = await authDatasource.signInWithGoogle();

      userEither = await userRepository.getUserByEmail(email: user!.email!);

      if (userEither.isLeft()) {
        userEither =
            await userRepository.createUser(email: user.email!, id: user.uid);
      }
    } catch (e) {
      return const Left(ServerFailure());
    }

    return Right(userEither.getRight().toNullable()!);
  }
}
