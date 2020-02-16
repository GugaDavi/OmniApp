// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dev_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DevListStore on _DevListStoreBase, Store {
  final _$devsAtom = Atom(name: '_DevListStoreBase.devs');

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

  final _$listerDevsAsyncAction = AsyncAction('listerDevs');

  @override
  Future<void> listerDevs() {
    return _$listerDevsAsyncAction.run(() => super.listerDevs());
  }

  final _$deleteDevAsyncAction = AsyncAction('deleteDev');

  @override
  Future<void> deleteDev(String id) {
    return _$deleteDevAsyncAction.run(() => super.deleteDev(id));
  }

  final _$addDevAsyncAction = AsyncAction('addDev');

  @override
  Future<void> addDev(DevModel dev) {
    return _$addDevAsyncAction.run(() => super.addDev(dev));
  }

  final _$_DevListStoreBaseActionController =
      ActionController(name: '_DevListStoreBase');

  @override
  void setDevs(DevsModel devsList) {
    final _$actionInfo = _$_DevListStoreBaseActionController.startAction();
    try {
      return super.setDevs(devsList);
    } finally {
      _$_DevListStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
