import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:login/stores/device/screen_size_store.dart';
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
    Modular.get<ScreenSizeStore>().calculateNewScreenSize(size);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FlutterSmartDialog(child: widget.child),
    );
  }
}
