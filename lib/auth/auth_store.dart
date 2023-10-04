import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/auth/repositories/auth_repository.dart';
import 'package:login/user/models/app_user.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  _AuthStoreBase(this.authRepository) {
    restoreSession();
  }

  final AuthRepository authRepository;

  @observable
  AppUser? _user;

  @computed
  AppUser? get user => _user;

  @observable
  String? errorMessage;

  @computed
  bool get hasErrorMessage => errorMessage != null;

  @computed
  bool get isAuthenticated => _user != null;

  @action
  void setUser(AppUser? user) {
    _user = user;
  }

  @action
  void setErrorMessage(String? error) {
    errorMessage = error;
  }

  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    final userEither = await authRepository.signInWithEmailAndPassword(
        email: email, password: password);

    bool success = userEither.fold((l) {
      setErrorMessage(l.message);
      return false;
    }, (user) {
      setUser(user);
      return true;
    });
    return success;
  }

  Future<bool> signUp({
    required String email,
    required String password,
  }) async {
    setErrorMessage(null);
    final userEither = await authRepository.signUpWithEmailAndPassword(
        email: email, password: password);

    bool success = userEither.fold((l) {
      setErrorMessage(l.message);
      return false;
    }, (user) {
      setUser(user);
      return true;
    });
    return success;
  }

  Future<bool> signOut() async {
    final userEither = await authRepository.signOut();
    bool success = userEither.fold((l) {
      setErrorMessage(l.message);
      return false;
    }, (user) {
      setUser(null);
      return true;
    });
    return success;
  }

  Future<bool> signInWithGoogle() async {
    final userEither = await authRepository.signInWithGoogle();

    bool success = userEither.fold((l) {
      setErrorMessage(l.message);
      return false;
    }, (user) {
      setUser(user);
      return true;
    });
    return success;
  }

  Future<void> restoreSession() async {
    final userEither = await authRepository.restoreSession();
    userEither.fold((l) {
      Modular.to.navigate('/auth/');
      return null;
    }, (user) {
      setUser(user);
      if (user != null) {
        Modular.to.navigate('/posts/');
      } else {
        Modular.to.navigate('/auth/');
      }
    });
  }
}
