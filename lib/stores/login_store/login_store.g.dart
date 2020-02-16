// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
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

  final _$loginAsyncAction = AsyncAction('login');

  @override
  Future<DevModel> login(String githubUserName) {
    return _$loginAsyncAction.run(() => super.login(githubUserName));
  }

  final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase');

  @override
  void logOut() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction();
    try {
      return super.logOut();
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
}
