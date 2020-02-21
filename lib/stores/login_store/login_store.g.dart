// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  final _$newUserAtom = Atom(name: '_LoginStoreBase.newUser');

  @override
  bool get newUser {
    _$newUserAtom.context.enforceReadPolicy(_$newUserAtom);
    _$newUserAtom.reportObserved();
    return super.newUser;
  }

  @override
  set newUser(bool value) {
    _$newUserAtom.context.conditionallyRunInAction(() {
      super.newUser = value;
      _$newUserAtom.reportChanged();
    }, _$newUserAtom, name: '${_$newUserAtom.name}_set');
  }

  final _$authenticatedAtom = Atom(name: '_LoginStoreBase.authenticated');

  @override
  bool get authenticated {
    _$authenticatedAtom.context.enforceReadPolicy(_$authenticatedAtom);
    _$authenticatedAtom.reportObserved();
    return super.authenticated;
  }

  @override
  set authenticated(bool value) {
    _$authenticatedAtom.context.conditionallyRunInAction(() {
      super.authenticated = value;
      _$authenticatedAtom.reportChanged();
    }, _$authenticatedAtom, name: '${_$authenticatedAtom.name}_set');
  }

  final _$inputsAtom = Atom(name: '_LoginStoreBase.inputs');

  @override
  ObservableList<Widget> get inputs {
    _$inputsAtom.context.enforceReadPolicy(_$inputsAtom);
    _$inputsAtom.reportObserved();
    return super.inputs;
  }

  @override
  set inputs(ObservableList<Widget> value) {
    _$inputsAtom.context.conditionallyRunInAction(() {
      super.inputs = value;
      _$inputsAtom.reportChanged();
    }, _$inputsAtom, name: '${_$inputsAtom.name}_set');
  }

  final _$userDevAtom = Atom(name: '_LoginStoreBase.userDev');

  @override
  DevModel get userDev {
    _$userDevAtom.context.enforceReadPolicy(_$userDevAtom);
    _$userDevAtom.reportObserved();
    return super.userDev;
  }

  @override
  set userDev(DevModel value) {
    _$userDevAtom.context.conditionallyRunInAction(() {
      super.userDev = value;
      _$userDevAtom.reportChanged();
    }, _$userDevAtom, name: '${_$userDevAtom.name}_set');
  }

  final _$newDevAtom = Atom(name: '_LoginStoreBase.newDev');

  @override
  NewDevStore get newDev {
    _$newDevAtom.context.enforceReadPolicy(_$newDevAtom);
    _$newDevAtom.reportObserved();
    return super.newDev;
  }

  @override
  set newDev(NewDevStore value) {
    _$newDevAtom.context.conditionallyRunInAction(() {
      super.newDev = value;
      _$newDevAtom.reportChanged();
    }, _$newDevAtom, name: '${_$newDevAtom.name}_set');
  }

  final _$loginAsyncAction = AsyncAction('login');

  @override
  Future<DevModel> login(String githubUserName, {List<Widget> list}) {
    return _$loginAsyncAction
        .run(() => super.login(githubUserName, list: list));
  }

  final _$addDevAsyncAction = AsyncAction('addDev');

  @override
  Future<DevModel> addDev(String githubUserName) {
    return _$addDevAsyncAction.run(() => super.addDev(githubUserName));
  }

  final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase');

  @override
  void setNewUser(bool t) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction();
    try {
      return super.setNewUser(t);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAuthenticated() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction();
    try {
      return super.setAuthenticated();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addInput(Widget input) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction();
    try {
      return super.addInput(input);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateInputList(List<Widget> newInputs) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction();
    try {
      return super.updateInputList(newInputs);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearInputList() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction();
    try {
      return super.clearInputList();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDev(DevModel dev) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction();
    try {
      return super.setDev(dev);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void logOut() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction();
    try {
      return super.logOut();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
