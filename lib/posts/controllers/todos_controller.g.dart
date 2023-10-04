// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodosController on TodosControllerBase, Store {
  Computed<bool>? _$hasErrorMessageComputed;

  @override
  bool get hasErrorMessage =>
      (_$hasErrorMessageComputed ??= Computed<bool>(() => super.hasErrorMessage,
              name: 'TodosControllerBase.hasErrorMessage'))
          .value;

  late final _$todosAtom =
      Atom(name: 'TodosControllerBase.todos', context: context);

  @override
  List<Todos> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(List<Todos> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'TodosControllerBase.errorMessage', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: 'TodosControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$TodosControllerBaseActionController =
      ActionController(name: 'TodosControllerBase', context: context);

  @override
  void setIsLoading(bool loading) {
    final _$actionInfo = _$TodosControllerBaseActionController.startAction(
        name: 'TodosControllerBase.setIsLoading');
    try {
      return super.setIsLoading(loading);
    } finally {
      _$TodosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErrorMessage(String? message) {
    final _$actionInfo = _$TodosControllerBaseActionController.startAction(
        name: 'TodosControllerBase.setErrorMessage');
    try {
      return super.setErrorMessage(message);
    } finally {
      _$TodosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPosts(List<Todos> postsList) {
    final _$actionInfo = _$TodosControllerBaseActionController.startAction(
        name: 'TodosControllerBase.setPosts');
    try {
      return super.setPosts(postsList);
    } finally {
      _$TodosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todos: ${todos},
errorMessage: ${errorMessage},
isLoading: ${isLoading},
hasErrorMessage: ${hasErrorMessage}
    ''';
  }
}
