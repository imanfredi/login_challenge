import 'package:fpdart/fpdart.dart';
import 'package:login/core/error/failure.dart';
import 'package:login/user/domain/models/user.dart';
import 'package:login/user/domain/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = _AppStoreBase with _$AppStore;

abstract class _AppStoreBase with Store {
  _AppStoreBase(this.userRepository);

  final UserRepository userRepository;

  @observable
  List<AppUser> users = [];

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
  void setUsers(List<AppUser> usersList) {
    users = usersList;
  }

  Future<void> fetchUsers() async {
    setIsLoading(true);
    setErrorMessage(null);

    Either<Failure, List<AppUser>> usersEither =
        await userRepository.getUsers();

    usersEither.fold(
      (l) => setErrorMessage(l.message),
      (usersList) {
        setUsers(usersList);
      },
    );
    setIsLoading(false);
  }
}
