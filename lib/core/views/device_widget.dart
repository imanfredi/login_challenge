import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/core/screen_controller.dart';
import 'package:provider/provider.dart';

class DeviceWidget extends StatefulWidget {
  const DeviceWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<DeviceWidget> createState() => _DeviceWidgetState();
}

class _DeviceWidgetState extends State<DeviceWidget> {
  @override
  void didChangeDependencies() {
    Size size = MediaQuery.of(context).size;
    Modular.get<ScreenController>().calculateNewScreenSize(size);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => Provider(
        create: (_) => Modular.get<ScreenController>(),
        child: SafeArea(
          child: widget.child,
        ),
      );
}
