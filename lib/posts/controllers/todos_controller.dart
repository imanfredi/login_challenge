import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';
import 'package:login/posts/repositories/todos_api.dart';
import 'package:mobx/mobx.dart';

import '../models/todos.dart';

part 'todos_controller.g.dart';

class TodosController = TodosControllerBase with _$TodosController;

abstract class TodosControllerBase with Store {
  TodosControllerBase(
    this.todosRepository,
  );

  final TodosRepository todosRepository;
  final Logger logger = Modular.get<Logger>();

  @observable
  List<Todos> todos = [];

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

  @action
  void setPosts(List<Todos> postsList) {
    todos = postsList;
  }

  Future<void> fetchPosts() async {
    setIsLoading(true);
    setErrorMessage(null);
    final postsList = await todosRepository.getTodos();

    setPosts(postsList);
    setIsLoading(false);
  }
}
