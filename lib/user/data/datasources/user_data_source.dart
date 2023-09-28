import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:login/core/error/exception.dart';
import 'package:login/user/data/entities/app_user_entity.dart';

abstract class UserDatasource {
  Future<Option<AppUserEntity>> getUserByEmail({
    required String email,
  });

  Future<AppUserEntity> createUser({
    required String id,
    required String email,
  });

  Future<Option<AppUserEntity>> getUserById({
    required String id,
  });

  Future<List<AppUserEntity>> getUsers();
}

class UserDatasourceImpl implements UserDatasource {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Future<Option<AppUserEntity>> getUserByEmail({
    required String email,
  }) async {
    try {
      final response =
          await _db.collection("users").where("email", isEqualTo: email).get();
      if (response.docs.isEmpty) {
        return const Option.none();
      }

      final userDoc = response.docs.first;

      AppUserEntity userEntity = AppUserEntity.fromJson(
        userId: userDoc.id,
        json: userDoc.data(),
      );
      return Option.of(userEntity);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<AppUserEntity> createUser({
    required String id,
    required String email,
  }) async {
    try {
      final query = _db.collection(AppUserEntity.collectionName).doc(id);

      final userDataMap = {
        'email': email,
      };

      await query.set(userDataMap);

      return AppUserEntity.fromJson(userId: id, json: userDataMap);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<Option<AppUserEntity>> getUserById({
    required String id,
  }) async {
    try {
      final response = await _db.collection("users").doc(id).get();
      if (!response.exists) {
        return const Option.none();
      }

      AppUserEntity userEntity = AppUserEntity.fromJson(
        userId: response.id,
        json: response.data()!,
      );
      return Option.of(userEntity);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<AppUserEntity>> getUsers() async {
    try {
      final response = await _db.collection("users").get();

      final List<AppUserEntity> users = [];

      for (var userDoc in response.docs) {
        users.add(
            AppUserEntity.fromJson(userId: userDoc.id, json: userDoc.data()));
      }
      return users;
    } catch (e) {
      throw ServerException();
    }
  }
}
