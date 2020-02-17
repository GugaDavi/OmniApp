// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  Computed<bool> _$loadedMrksComputed;

  @override
  bool get loadedMrks =>
      (_$loadedMrksComputed ??= Computed<bool>(() => super.loadedMrks)).value;

  final _$findDevAtom = Atom(name: '_HomeStoreBase.findDev');

  @override
  FindDev get findDev {
    _$findDevAtom.context.enforceReadPolicy(_$findDevAtom);
    _$findDevAtom.reportObserved();
    return super.findDev;
  }

  @override
  set findDev(FindDev value) {
    _$findDevAtom.context.conditionallyRunInAction(() {
      super.findDev = value;
      _$findDevAtom.reportChanged();
    }, _$findDevAtom, name: '${_$findDevAtom.name}_set');
  }

  final _$ltLgAtom = Atom(name: '_HomeStoreBase.ltLg');

  @override
  Coordinates get ltLg {
    _$ltLgAtom.context.enforceReadPolicy(_$ltLgAtom);
    _$ltLgAtom.reportObserved();
    return super.ltLg;
  }

  @override
  set ltLg(Coordinates value) {
    _$ltLgAtom.context.conditionallyRunInAction(() {
      super.ltLg = value;
      _$ltLgAtom.reportChanged();
    }, _$ltLgAtom, name: '${_$ltLgAtom.name}_set');
  }

  final _$devsAtom = Atom(name: '_HomeStoreBase.devs');

  @override
  DevsModel get devs {
    _$devsAtom.context.enforceReadPolicy(_$devsAtom);
    _$devsAtom.reportObserved();
    return super.devs;
  }

  @override
  set devs(DevsModel value) {
    _$devsAtom.context.conditionallyRunInAction(() {
      super.devs = value;
      _$devsAtom.reportChanged();
    }, _$devsAtom, name: '${_$devsAtom.name}_set');
  }

  final _$mrksAtom = Atom(name: '_HomeStoreBase.mrks');

  @override
  ObservableSet<Marker> get mrks {
    _$mrksAtom.context.enforceReadPolicy(_$mrksAtom);
    _$mrksAtom.reportObserved();
    return super.mrks;
  }

  @override
  set mrks(ObservableSet<Marker> value) {
    _$mrksAtom.context.conditionallyRunInAction(() {
      super.mrks = value;
      _$mrksAtom.reportChanged();
    }, _$mrksAtom, name: '${_$mrksAtom.name}_set');
  }

  final _$listerDevsAsyncAction = AsyncAction('listerDevs');

  @override
  Future<void> listerDevs(String techs) {
    return _$listerDevsAsyncAction.run(() => super.listerDevs(techs));
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  void setCoordinates(Coordinates coordinatesUserDev) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction();
    try {
      return super.setCoordinates(coordinatesUserDev);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDevs(DevsModel devsList) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction();
    try {
      return super.setDevs(devsList);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addMrk(Marker mk) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction();
    try {
      return super.addMrk(mk);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearMrk() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction();
    try {
      return super.clearMrk();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
