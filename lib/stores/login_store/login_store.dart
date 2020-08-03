import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:omni_app/api/api.dart';
import 'package:omni_app/models/dev_model.dart';
import 'package:omni_app/stores/new_dev_store/new_dev_store.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final Api api;

  _LoginStoreBase(this.api);

  @observable
  bool newUser = false;
  @action
  void setNewUser(bool t) => newUser = t;

  @observable
  bool authenticated = false;
  @action
  void setAuthenticated() => authenticated = !authenticated;

  @observable
  DevModel userDev;
  @action
  void setDev(DevModel dev) => userDev = dev;

  @observable
  NewDevStore newDev = NewDevStore();

  @action
  void logOut() {
    setAuthenticated();
    setDev(null);
    setNewUser(false);
  }

  @action
  Future<DevModel> login(String githubUserName, {List<Widget> list}) async {
    try {
      DevModel dev = await api.getDev(githubUserName);

      if (dev == null) {
        setNewUser(true);
        return null;
      }

      setAuthenticated();
      setDev(dev);
      return dev;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @action
  Future<DevModel> addDev(String githubUserName) async {
    newDev.form.setGithubUserName(githubUserName);
    try {
      DevModel dev = await api.addDev(newDev.form.compile());
      print(dev);

      setDev(dev);
      setAuthenticated();
      clearInputList();

      return dev;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
