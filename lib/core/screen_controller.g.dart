// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ScreenController on _ScreenControllerBase, Store {
  late final _$screenTypeAtom =
      Atom(name: '_ScreenControllerBase.screenType', context: context);

  @override
  ScreenType get screenType {
    _$screenTypeAtom.reportRead();
    return super.screenType;
  }

  @override
  set screenType(ScreenType value) {
    _$screenTypeAtom.reportWrite(value, super.screenType, () {
      super.screenType = value;
    });
  }

  late final _$_ScreenControllerBaseActionController =
      ActionController(name: '_ScreenControllerBase', context: context);

  @override
  void setScreenType(ScreenType newScreenType) {
    final _$actionInfo = _$_ScreenControllerBaseActionController.startAction(
        name: '_ScreenControllerBase.setScreenType');
    try {
      return super.setScreenType(newScreenType);
    } finally {
      _$_ScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
screenType: ${screenType}
    ''';
  }
}
