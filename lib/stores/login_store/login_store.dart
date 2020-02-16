import 'package:mobx/mobx.dart';
import 'package:omni_app/api/api.dart';
import 'package:omni_app/models/dev_model.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final Api api;

  _LoginStoreBase(this.api);

  @observable
  bool authenticated = false;

  @observable
  DevModel userDev;

  @action
  void logOut() {
    authenticated = false;
    userDev = null;
  }

  @action
  void setDev(DevModel dev) => userDev = dev;

  @action
  Future<DevModel> login(String githubUserName) async {
    print(githubUserName);
    try {
      DevModel dev = await api.getDev(githubUserName);

      authenticated = true;

      setDev(dev);

      return dev;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
