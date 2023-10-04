import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';
import 'package:login/auth/auth_store.dart';
import 'package:login/user/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';

part 'user_posts_controller.g.dart';

class UserPostsController = UserPostsControllerBase with _$UserPostsController;

abstract class UserPostsControllerBase with Store {
  UserPostsControllerBase(
    this.userRepository,
  );

  final UserRepository userRepository;
  final Logger logger = Modular.get<Logger>();

  @observable
  String? errorMessage;

  @observable
  bool isLoading = false;

  @computed
  bool get hasErrorMessage => errorMessage != null;

  @action
  void setIsLoading(bool loading) {
    isLoading = loading;
  }

  @action
  void setErrorMessage(String? message) {
    errorMessage = message;
  }

  Future<bool> sendPost({
    required String title,
    required String subtitle,
    required String comments,
    required String rating,
    required String restaurant,
  }) async {
    setIsLoading(true);
    setErrorMessage(null);
    final postsEither = await userRepository.sendPost(
      userId: Modular.get<AuthStore>().user!.id,
      title: title,
      subtitle: subtitle,
      comments: comments,
      rating: rating,
      restaurant: restaurant,
    );

    bool success = postsEither.fold((l) => false, (r) => true);
    setIsLoading(false);

    return success;
  }
}
