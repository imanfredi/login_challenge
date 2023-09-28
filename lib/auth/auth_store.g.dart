// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthController on _AuthControllerBase, Store {
  Computed<AppUser?>? _$userComputed;

  @override
  AppUser? get user => (_$userComputed ??= Computed<AppUser?>(() => super.user,
          name: '_AuthControllerBase.user'))
      .value;
  Computed<bool>? _$hasErrorMessageComputed;

  @override
  bool get hasErrorMessage =>
      (_$hasErrorMessageComputed ??= Computed<bool>(() => super.hasErrorMessage,
              name: '_AuthControllerBase.hasErrorMessage'))
          .value;
  Computed<bool>? _$isAuthenticatedComputed;

  @override
  bool get isAuthenticated =>
      (_$isAuthenticatedComputed ??= Computed<bool>(() => super.isAuthenticated,
              name: '_AuthControllerBase.isAuthenticated'))
          .value;

  late final _$_userAtom =
      Atom(name: '_AuthControllerBase._user', context: context);

  @override
  AppUser? get _user {
    _$_userAtom.reportRead();
    return super._user;
  }

  @override
  set _user(AppUser? value) {
    _$_userAtom.reportWrite(value, super._user, () {
      super._user = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_AuthControllerBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$_AuthControllerBaseActionController =
      ActionController(name: '_AuthControllerBase', context: context);

  @override
  void setUser(AppUser? user) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.setUser');
    try {
      return super.setUser(user);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErrorMessage(String? error) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.setErrorMessage');
    try {
      return super.setErrorMessage(error);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
user: ${user},
hasErrorMessage: ${hasErrorMessage},
isAuthenticated: ${isAuthenticated}
    ''';
  }
}
