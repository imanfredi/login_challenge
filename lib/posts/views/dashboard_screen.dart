import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/auth/auth_store.dart';
import 'package:login/design_system/atoms/fidooo_icon.dart';
import 'package:login/design_system/molecules/app_bar.dart';
import 'package:login/posts/controllers/todos_controller.dart';
import 'package:login/posts/views/dashboard.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    Modular.get<TodosController>().fetchPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FidoooAppBar(
        title: 'Dashboards',
        actions: [
          IconButton(
            onPressed: () => onLogout(),
            icon: FidoooIcons.logout(status: FidoooIconStatus.enabled),
          )
        ],
      ),
      body: Observer(
        builder: (BuildContext context) {
          final appStore = Modular.get<TodosController>();
          return appStore.isLoading
              ? const Center(
                  child: Text("Loading"),
                )
              : appStore.hasErrorMessage
                  ? Center(
                      child: Text(appStore.errorMessage!),
                    )
                  : const Dashboard();
        },
      ),
    );
  }

  void onLogout() async {
    final authStore = Modular.get<AuthStore>();
    bool sucess = await authStore.signOut();
    if (sucess) {
      Modular.to.navigate('/auth/');
    }
  }
}
