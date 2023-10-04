import 'package:fpdart/fpdart.dart';
import 'package:login/core/error/failure.dart';
import 'package:login/user/models/app_user.dart';
import 'package:login/user/models/restaurant_review.dart';

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

  Future<Either<Failure, RestaurantReview>> sendPost({
    required String userId,
    required String title,
    required String subtitle,
    required String comments,
    required String rating,
    required String restaurant,
  });
}
