// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_size_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ScreenSizeStore on _ScreenSizeStoreBase, Store {
  late final _$screenTypeAtom =
      Atom(name: '_ScreenSizeStoreBase.screenType', context: context);

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

  late final _$_ScreenSizeStoreBaseActionController =
      ActionController(name: '_ScreenSizeStoreBase', context: context);

  @override
  void setScreenType(ScreenType newScreenType) {
    final _$actionInfo = _$_ScreenSizeStoreBaseActionController.startAction(
        name: '_ScreenSizeStoreBase.setScreenType');
    try {
      return super.setScreenType(newScreenType);
    } finally {
      _$_ScreenSizeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
screenType: ${screenType}
    ''';
  }
}
