// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_dev_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FormDev on _FormDevBase, Store {
  Computed<String> _$validateGithubUserNameComputed;

  @override
  String get validateGithubUserName => (_$validateGithubUserNameComputed ??=
          Computed<String>(() => super.validateGithubUserName))
      .value;

  final _$githubUserNameAtom = Atom(name: '_FormDevBase.githubUserName');

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

  final _$techsAtom = Atom(name: '_FormDevBase.techs');

  @override
  String get techs {
    _$techsAtom.context.enforceReadPolicy(_$techsAtom);
    _$techsAtom.reportObserved();
    return super.techs;
  }

  @override
  set techs(String value) {
    _$techsAtom.context.conditionallyRunInAction(() {
      super.techs = value;
      _$techsAtom.reportChanged();
    }, _$techsAtom, name: '${_$techsAtom.name}_set');
  }

  final _$latitudeAtom = Atom(name: '_FormDevBase.latitude');

  @override
  String get latitude {
    _$latitudeAtom.context.enforceReadPolicy(_$latitudeAtom);
    _$latitudeAtom.reportObserved();
    return super.latitude;
  }

  @override
  set latitude(String value) {
    _$latitudeAtom.context.conditionallyRunInAction(() {
      super.latitude = value;
      _$latitudeAtom.reportChanged();
    }, _$latitudeAtom, name: '${_$latitudeAtom.name}_set');
  }

  final _$longitudeAtom = Atom(name: '_FormDevBase.longitude');

  @override
  String get longitude {
    _$longitudeAtom.context.enforceReadPolicy(_$longitudeAtom);
    _$longitudeAtom.reportObserved();
    return super.longitude;
  }

  @override
  set longitude(String value) {
    _$longitudeAtom.context.conditionallyRunInAction(() {
      super.longitude = value;
      _$longitudeAtom.reportChanged();
    }, _$longitudeAtom, name: '${_$longitudeAtom.name}_set');
  }

  final _$_FormDevBaseActionController = ActionController(name: '_FormDevBase');

  @override
  dynamic setGithubUserName(String value) {
    final _$actionInfo = _$_FormDevBaseActionController.startAction();
    try {
      return super.setGithubUserName(value);
    } finally {
      _$_FormDevBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTechs(String value) {
    final _$actionInfo = _$_FormDevBaseActionController.startAction();
    try {
      return super.setTechs(value);
    } finally {
      _$_FormDevBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLatitude(String value) {
    final _$actionInfo = _$_FormDevBaseActionController.startAction();
    try {
      return super.setLatitude(value);
    } finally {
      _$_FormDevBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLongitude(String value) {
    final _$actionInfo = _$_FormDevBaseActionController.startAction();
    try {
      return super.setLongitude(value);
    } finally {
      _$_FormDevBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  DevModel compile() {
    final _$actionInfo = _$_FormDevBaseActionController.startAction();
    try {
      return super.compile();
    } finally {
      _$_FormDevBaseActionController.endAction(_$actionInfo);
    }
  }
}
