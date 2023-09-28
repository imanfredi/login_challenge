import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:login/design_system/molecules/tables/fidooo_cell_avatar.dart';
import 'package:login/design_system/molecules/tables/fidooo_cell_text.dart';
import 'package:login/design_system/molecules/tables/fidooo_header.dart';
import 'package:login/user/app_store.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Row(
          children: [
            FidoooHeader(
              headerTitle: "Id",
              width: 150,
            ),
            FidoooHeader(
              headerTitle: "Equipo Fidooo",
              width: 226,
            ),
          ],
        ),
        Observer(
          builder: (BuildContext context) {
            final appStore = Provider.of<AppStore>(context);
            return appStore.users.isEmpty
                ? const FidoooCellText(
                    width: 376,
                    cellText: 'No hay usuarios',
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: appStore.users.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            FidoooCellText(
                              width: 150,
                              cellText: appStore.users[index].id,
                            ),
                            FidoooCellAvatar(
                              width: 226,
                              cellText: appStore.users[index].email,
                              avatarUrl:
                                  'https://www.google.com/url?sa=i&url=https%3A%2F%2Fbo.linkedin.com%2Fcompany%2Ffidooo-engineering&psig=AOvVaw13gRfADFPUXvtlMHV-ys0N&ust=1695836864114000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCOj3r-HqyIEDFQAAAAAdAAAAABAJ',
                            ),
                          ],
                        );
                      },
                    ),
                  );
          },
        ),
      ],
    );
  }
}
