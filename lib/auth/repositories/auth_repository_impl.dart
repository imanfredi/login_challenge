import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:login/auth/repositories/auth_repository.dart';
import 'package:login/core/error/failure.dart';
import 'package:login/user/models/app_user.dart';
import 'package:login/user/repositories/user_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final UserRepository userRepository;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Logger logger;

  AuthRepositoryImpl(this.userRepository, this.logger);

  @override
  Future<Either<Failure, AppUser>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    User? user;
    try {
      final userCredentials = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredentials.user;
    } on FirebaseAuthException catch (e) {
      logger.e("FirebaseAuthException: ${e.toString()}");
      return Left(
        FirebaseAuthFailure(
          message: e.code,
          description: e.message ?? '',
        ),
      );
    } on Exception catch (e) {
      logger.e("Exception: ${e.toString()}");
      return Left(ServerFailure(description: e.toString()));
    }

    final userEither =
        await userRepository.createUser(email: user!.email!, id: user.uid);

    if (userEither.isLeft()) {
      logger.e("Error while creating user");
    }
    return userEither;
  }

  @override
  Future<Either<Failure, AppUser>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    User? user;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      logger.e("FirebaseAuthException: ${e.toString()}");
      return Left(FirebaseAuthFailure(
        message: e.code,
        description: e.message ?? '',
      ));
    } on Exception catch (e) {
      logger.e("Exception: ${e.toString()}");
      return Left(ServerFailure(description: e.toString()));
    }

    final userEither = await userRepository.getUserByEmail(email: user!.email!);
    if (userEither.isLeft()) {
      logger.w("Failure while getting user by email");
    }
    return userEither;
  }

  @override
  Future<Either<Failure, AppUser>> signInWithGoogle() async {
    User? user;
    try {
      GoogleAuthProvider authProvider = GoogleAuthProvider();
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithPopup(authProvider);
      user = userCredential.user;
    } on Exception catch (e) {
      logger.e("Exception: ${e.toString()}");
      return Left(ServerFailure(description: e.toString()));
    }

    final userEither = await userRepository.getUserByEmail(email: user!.email!);

    if (userEither.isLeft()) {
      logger.w("Error while getting user by email on sign in with google");
    }
    return userEither;
  }

  //FIXME: signOut diferenciar entre login con google o sin google.
  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _auth.signOut();
      GoogleSignIn().signOut();
    } on FirebaseAuthException catch (e) {
      logger.e("FirebaseAuthException: ${e.toString()}");
      return Left(
        FirebaseAuthFailure(
          message: e.code,
          description: e.message ?? '',
        ),
      );
    } on Exception catch (e) {
      logger.e("Exception: ${e.toString()}");
      return Left(ServerFailure(description: e.toString()));
    }
    return const Right(null);
  }

  @override
  Future<Either<Failure, AppUser?>> restoreSession() async {
    User? firebaseAuthUser = _auth.currentUser;

    if (firebaseAuthUser != null) {
      final userEither =
          await userRepository.getUserById(id: firebaseAuthUser.uid);

      if (userEither.isLeft()) {
        logger.w("Failure when getting user by id");
      }
      return userEither;
    }
    return const Right(null);
  }
}
