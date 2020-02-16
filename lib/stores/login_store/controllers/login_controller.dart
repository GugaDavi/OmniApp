import 'package:mobx/mobx.dart';
import 'package:omni_app/api/api.dart';
part 'login_controller.g.dart';

class LoginControlller = _LoginControlllerBase with _$LoginControlller;

abstract class _LoginControlllerBase with Store {
  @observable
  String githubUserName = '';

  @action
  void setGithubUserName(String value) =>
      githubUserName = value.toLowerCase().trim();

  @computed
  bool get validValue => githubUserName.length > 3;

  @override
  String toString() => githubUserName;
}
