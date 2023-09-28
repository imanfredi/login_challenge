import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/auth/auth_store.dart';
import 'package:login/design_system/atoms/fidooo_icon.dart';
import 'package:login/design_system/molecules/app_bar.dart';
import 'package:login/user/app_store.dart';
import 'package:login/user/views/dashboard.dart';
import 'package:provider/provider.dart';

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
    Modular.get<AppStore>().fetchUsers();
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
      body: Provider<AppStore>(
        create: (_) => Modular.get<AppStore>(),
        child: Observer(
          builder: (BuildContext context) {
            final appStore = Modular.get<AppStore>();
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
      ),
    );
  }

  void onLogout() async {
    final authStore = Modular.get<AuthController>();
    bool sucess = await authStore.signOut();
    if (sucess) {
      Modular.to.navigate('/auth/');
    }
  }
}
