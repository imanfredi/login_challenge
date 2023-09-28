import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'screen_controller.g.dart';

class ScreenController = _ScreenControllerBase with _$ScreenController;

abstract class _ScreenControllerBase with Store {
  @observable
  ScreenType screenType = ScreenType.Unknown;

  @action
  void setScreenType(ScreenType newScreenType) {
    screenType = newScreenType;
  }

  void calculateNewScreenSize(Size size) {
    ScreenType newScreenType = ScreenType.Unknown;

    if (size.width < 600) {
      newScreenType = ScreenType
          .Mobile; // Adjust the size.width threshold as needed for mobile devices
    } else if (size.width < 1024) {
      newScreenType = ScreenType
          .Tablet; // Adjust the size.width threshold as needed for tablets
    } else {
      newScreenType = ScreenType.Web;
    }

    if (screenType == ScreenType.Unknown || screenType != newScreenType) {
      setScreenType(newScreenType);
    }
  }
}

enum ScreenType {
  Mobile,
  Tablet,
  Web,
  Unknown,
}
