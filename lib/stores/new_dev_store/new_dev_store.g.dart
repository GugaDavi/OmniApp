// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_dev_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewDevStore on _NewDevStoreBase, Store {
  final _$formAtom = Atom(name: '_NewDevStoreBase.form');

  @override
  FormDev get form {
    _$formAtom.context.enforceReadPolicy(_$formAtom);
    _$formAtom.reportObserved();
    return super.form;
  }

  @override
  set form(FormDev value) {
    _$formAtom.context.conditionallyRunInAction(() {
      super.form = value;
      _$formAtom.reportChanged();
    }, _$formAtom, name: '${_$formAtom.name}_set');
  }

  final _$addDevAsyncAction = AsyncAction('addDev');

  @override
  Future<DevModel> addDev() {
    return _$addDevAsyncAction.run(() => super.addDev());
  }
}
