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
  ObservableList<Widget> inputs = <Widget>[].asObservable();
  @action
  void addInput(Widget input) => inputs.add(input);
  @action
  void updateInputList(List<Widget> newInputs) {
    newInputs.forEach((Widget input) {
      addInput(input);
    });
  }

  @action
  void clearInputList() => inputs.clear();

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
        updateInputList(list);
        return null;
      }

      setAuthenticated();
      setDev(dev);
      clearInputList();
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
