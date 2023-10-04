import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'user_profile_form.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => Modular.to.navigate('/posts/'),
          child: const Text("Posts"),
        ),
        TextButton(
          onPressed: () => SmartDialog.show(builder: (BuildContext context) {
            return const PostForm();
          }),
          child: const Text("Show post form"),
        ),
      ],
    );
  }
}
