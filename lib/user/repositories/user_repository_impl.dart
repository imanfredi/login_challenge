import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fpdart/fpdart.dart';
import 'package:logger/logger.dart';
import 'package:login/core/error/failure.dart';
import 'package:login/user/models/app_user.dart';
import 'package:login/user/models/restaurant_review.dart';
import 'package:login/user/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final Logger logger = Modular.get<Logger>();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, AppUser>> getUserByEmail({
    required String email,
  }) async {
    try {
      final response = await _db
          .collection(AppUser.collectionName)
          .where("email", isEqualTo: email)
          .get();
      if (response.docs.isEmpty) {
        logger.w("User not found with email: $email ");
        return Left(UserNotFoundByEmailFailure(email: email));
      }

      final userDoc = response.docs.first;
      final docInfo = userDoc.data();
      docInfo['id'] = userDoc.id;
      AppUser userEntity = AppUser.fromJson(docInfo);
      return Right(userEntity);
    } on Exception catch (e) {
      logger.e("Exception: ${e.toString()}");
      return Left(ServerFailure(description: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AppUser>> createUser({
    required String email,
    required String id,
  }) async {
    try {
      final query = _db.collection(AppUser.collectionName).doc(id);
      final userDataMap = {
        'email': email,
      };
      await query.set(userDataMap);

      userDataMap['id'] = id;
      AppUser userEntity = AppUser.fromJson(userDataMap);
      return Right(userEntity);
    } on Exception catch (e) {
      logger.e("Exception: ${e.toString()}");
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AppUser>> getUserById({
    required String id,
  }) async {
    try {
      final response = await _db.collection("users").doc(id).get();

      if (!response.exists) {
        logger.w("User not found with id: $id ");
        return const Left(UserNotFoundByEmailFailure());
      }

      final docInfo = response.data();
      docInfo!['id'] = response.id;

      AppUser userEntity = AppUser.fromJson(docInfo);
      return Right(userEntity);
    } on Exception catch (e) {
      logger.e("Exception: ${e.toString()}");
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<AppUser>>> getUsers() async {
    try {
      final response = await _db.collection("users").get();
      final List<AppUser> users = [];

      for (var userDoc in response.docs) {
        final docInfo = userDoc.data();
        docInfo['id'] = userDoc.id;
        users.add(AppUser.fromJson(docInfo));
      }
      return Right(users);
    } on Exception catch (e) {
      logger.e("Exception: ${e.toString()}");
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, RestaurantReview>> sendPost({
    required String userId,
    required String title,
    required String subtitle,
    required String comments,
    required String rating,
    required String restaurant,
  }) async {
    try {
      final query = _db.collection(RestaurantReview.collectionName).doc(userId);
      final reviewDataMap = {
        'userId': userId,
        'title': title,
        'subtitle': subtitle,
        'comments': comments,
        'rating': rating,
        'restaurant': restaurant,
      };
      await query.set(reviewDataMap);

      RestaurantReview restaurantReview =
          RestaurantReview.fromJson(reviewDataMap);
      return Right(restaurantReview);
    } on Exception catch (e) {
      logger.e("Exception: ${e.toString()}");
      return const Left(ServerFailure());
    }
  }
}
