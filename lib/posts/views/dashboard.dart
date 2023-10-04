import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/design_system/molecules/tables/fidooo_cell_avatar.dart';
import 'package:login/design_system/molecules/tables/fidooo_cell_text.dart';
import 'package:login/design_system/molecules/tables/fidooo_header.dart';
import 'package:login/posts/controllers/todos_controller.dart';

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
        Text(dotenv.env['VAR_NAME']!),
        TextButton(
            onPressed: () => Modular.to.navigate('/users/'),
            child: Text("Users Post")),
        const Row(
          children: [
            FidoooHeader(
              headerTitle: "Id",
              width: 150,
            ),
            FidoooHeader(
              headerTitle: "Post Title",
              width: 226,
            ),
          ],
        ),
        Observer(
          builder: (BuildContext context) {
            final postsController = Modular.get<TodosController>();
            return postsController.todos.isEmpty
                ? const FidoooCellText(
                    width: 376,
                    cellText: 'No hay usuarios',
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: postsController.todos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            FidoooCellText(
                              width: 150,
                              cellText:
                                  postsController.todos[index].id.toString(),
                            ),
                            FidoooCellAvatar(
                              width: 226,
                              cellText:
                                  postsController.todos[index].title.toString(),
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
