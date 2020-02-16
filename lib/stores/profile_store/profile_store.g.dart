// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileStore on _ProfileStoreBase, Store {
  final _$devAtom = Atom(name: '_ProfileStoreBase.dev');

  @override
  DevModel get dev {
    _$devAtom.context.enforceReadPolicy(_$devAtom);
    _$devAtom.reportObserved();
    return super.dev;
  }

  @override
  set dev(DevModel value) {
    _$devAtom.context.conditionallyRunInAction(() {
      super.dev = value;
      _$devAtom.reportChanged();
    }, _$devAtom, name: '${_$devAtom.name}_set');
  }

  final _$_ProfileStoreBaseActionController =
      ActionController(name: '_ProfileStoreBase');

  @override
  void setDev(DevModel dev) {
    final _$actionInfo = _$_ProfileStoreBaseActionController.startAction();
    try {
      return super.setDev(dev);
    } finally {
      _$_ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
