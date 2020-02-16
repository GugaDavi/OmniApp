// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditProfile on _EditProfileBase, Store {
  Computed<Map<String, String>> _$compileComputed;

  @override
  Map<String, String> get compile =>
      (_$compileComputed ??= Computed<Map<String, String>>(() => super.compile))
          .value;
  Computed<bool> _$validateComputed;

  @override
  bool get validate =>
      (_$validateComputed ??= Computed<bool>(() => super.validate)).value;

  final _$nameAtom = Atom(name: '_EditProfileBase.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$bioAtom = Atom(name: '_EditProfileBase.bio');

  @override
  String get bio {
    _$bioAtom.context.enforceReadPolicy(_$bioAtom);
    _$bioAtom.reportObserved();
    return super.bio;
  }

  @override
  set bio(String value) {
    _$bioAtom.context.conditionallyRunInAction(() {
      super.bio = value;
      _$bioAtom.reportChanged();
    }, _$bioAtom, name: '${_$bioAtom.name}_set');
  }

  final _$latitudeAtom = Atom(name: '_EditProfileBase.latitude');

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

  final _$longitudeAtom = Atom(name: '_EditProfileBase.longitude');

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

  final _$techsAtom = Atom(name: '_EditProfileBase.techs');

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

  final _$_EditProfileBaseActionController =
      ActionController(name: '_EditProfileBase');

  @override
  void setName(String value) {
    final _$actionInfo = _$_EditProfileBaseActionController.startAction();
    try {
      return super.setName(value);
    } finally {
      _$_EditProfileBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBio(String value) {
    final _$actionInfo = _$_EditProfileBaseActionController.startAction();
    try {
      return super.setBio(value);
    } finally {
      _$_EditProfileBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLatitude(String value) {
    final _$actionInfo = _$_EditProfileBaseActionController.startAction();
    try {
      return super.setLatitude(value);
    } finally {
      _$_EditProfileBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLongitude(String value) {
    final _$actionInfo = _$_EditProfileBaseActionController.startAction();
    try {
      return super.setLongitude(value);
    } finally {
      _$_EditProfileBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTechs(String value) {
    final _$actionInfo = _$_EditProfileBaseActionController.startAction();
    try {
      return super.setTechs(value);
    } finally {
      _$_EditProfileBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProps(DevModel dev) {
    final _$actionInfo = _$_EditProfileBaseActionController.startAction();
    try {
      return super.setProps(dev);
    } finally {
      _$_EditProfileBaseActionController.endAction(_$actionInfo);
    }
  }
}
