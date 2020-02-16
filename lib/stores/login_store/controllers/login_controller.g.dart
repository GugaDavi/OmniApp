// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginControlller on _LoginControlllerBase, Store {
  Computed<bool> _$validValueComputed;

  @override
  bool get validValue =>
      (_$validValueComputed ??= Computed<bool>(() => super.validValue)).value;

  final _$githubUserNameAtom =
      Atom(name: '_LoginControlllerBase.githubUserName');

  @override
  String get githubUserName {
    _$githubUserNameAtom.context.enforceReadPolicy(_$githubUserNameAtom);
    _$githubUserNameAtom.reportObserved();
    return super.githubUserName;
  }

  @override
  set githubUserName(String value) {
    _$githubUserNameAtom.context.conditionallyRunInAction(() {
      super.githubUserName = value;
      _$githubUserNameAtom.reportChanged();
    }, _$githubUserNameAtom, name: '${_$githubUserNameAtom.name}_set');
  }

  final _$_LoginControlllerBaseActionController =
      ActionController(name: '_LoginControlllerBase');

  @override
  void setGithubUserName(String value) {
    final _$actionInfo = _$_LoginControlllerBaseActionController.startAction();
    try {
      return super.setGithubUserName(value);
    } finally {
      _$_LoginControlllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
