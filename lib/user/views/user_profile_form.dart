import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:login/user/controllers/user_post_form_controller.dart';
import 'package:login/user/controllers/user_posts_controller.dart';

class PostForm extends StatefulWidget {
  const PostForm({Key? key}) : super(key: key);

  @override
  State<PostForm> createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  @override
  void initState() {
    super.initState();
    Modular.get<UserPostFormController>().setupValidations();
  }

  @override
  void dispose() {
    Modular.get<UserPostFormController>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final postFormController = Modular.get<UserPostFormController>();
    return Container(
      color: Colors.white,
      width: 500,
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Observer(
                builder: (_) => TextField(
                  onChanged: (value) => postFormController.title = value,
                  decoration: InputDecoration(
                      labelText: 'Title',
                      hintText: 'Pick a title',
                      errorText: postFormController.error.title),
                ),
              ),
              Observer(
                builder: (_) => TextField(
                  onChanged: (value) => postFormController.subtitle = value,
                  decoration: InputDecoration(
                      labelText: 'Subtitle',
                      hintText: 'Pick a subtitle',
                      errorText: postFormController.error.subtitle),
                ),
              ),
              Observer(
                builder: (_) => TextField(
                  onChanged: (value) => postFormController.rating = value,
                  decoration: InputDecoration(
                      labelText: 'Rating',
                      hintText: 'Pick a rating',
                      errorText: postFormController.error.rating),
                ),
              ),
              Observer(
                builder: (_) => TextField(
                  onChanged: (value) => postFormController.comments = value,
                  decoration: InputDecoration(
                      labelText: 'Comments',
                      hintText: 'Pick a comment',
                      errorText: postFormController.error.comments),
                ),
              ),
              Observer(
                builder: (_) => TextField(
                  onChanged: (value) => postFormController.restaurant = value,
                  decoration: InputDecoration(
                      labelText: 'Restaurant',
                      hintText: 'Pick a restaurant',
                      errorText: postFormController.error.restaurant),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                onPressed: () => onSubmit(),
                child: const Text('Enviar'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onSubmit() async {
    final postFormController = Modular.get<UserPostFormController>();
    postFormController.validateAll();
    if (postFormController.canPost) {
      bool success = await Modular.get<UserPostsController>().sendPost(
          title: postFormController.title,
          subtitle: postFormController.subtitle,
          comments: postFormController.comments,
          rating: postFormController.rating,
          restaurant: postFormController.restaurant);
      if (success) {
        SmartDialog.dismiss();
      }
    }
  }
}
