import 'package:mobx/mobx.dart';

part 'user_post_form_controller.g.dart';

class UserPostFormController = _UserPostFormController
    with _$UserPostFormController;

abstract class _UserPostFormController with Store {
  final FormErrorState error = FormErrorState();

  @observable
  String title = '';

  @observable
  String subtitle = '';

  @observable
  String comments = '';

  @observable
  String rating = '';

  @observable
  String restaurant = '';

  @computed
  bool get canPost => !error.hasErrors;

  late List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => title, validateTitle),
      reaction((_) => subtitle, validateSubtitle),
      reaction((_) => restaurant, validateRestaurant),
      reaction((_) => comments, validateComments),
      reaction((_) => rating, validateRating)
    ];
  }

  @action
  void validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      error.title = 'Cannot be blank';
      return;
    }
    error.title = null;
  }

  @action
  void validateSubtitle(String? value) {
    if (value == null || value.isEmpty) {
      error.subtitle = 'Cannot be blank';
      return;
    }
    error.subtitle = null;
  }

  @action
  void validateRestaurant(String? value) {
    if (value == null || value.isEmpty) {
      error.restaurant = 'Cannot be blank';
      return;
    }
    error.restaurant = null;
  }

  @action
  void validateComments(String? value) {
    if (value == null || value.isEmpty) {
      error.comments = 'Cannot be blank';
      return;
    }
    error.comments = null;
  }

  @action
  void validateRating(String? value) {
    if (value == null || value.isEmpty) {
      error.rating = 'Cannot be blank';
      return;
    }
    error.rating = null;
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validateTitle(title);
    validateSubtitle(subtitle);
    validateRestaurant(restaurant);
    validateRating(rating);
    validateComments(comments);
  }
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String? title;

  @observable
  String? subtitle;

  @observable
  String? comments;

  @observable
  String? rating;

  @observable
  String? restaurant;

  @computed
  bool get hasErrors =>
      title != null ||
      subtitle != null ||
      comments != null ||
      rating != null ||
      restaurant != null;
}
