// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dev_card_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DevCardController on _DevCardControllerBase, Store {
  final _$confirmDeleteAtom =
      Atom(name: '_DevCardControllerBase.confirmDelete');

  @override
  bool get confirmDelete {
    _$confirmDeleteAtom.context.enforceReadPolicy(_$confirmDeleteAtom);
    _$confirmDeleteAtom.reportObserved();
    return super.confirmDelete;
  }

  @override
  set confirmDelete(bool value) {
    _$confirmDeleteAtom.context.conditionallyRunInAction(() {
      super.confirmDelete = value;
      _$confirmDeleteAtom.reportChanged();
    }, _$confirmDeleteAtom, name: '${_$confirmDeleteAtom.name}_set');
  }

  final _$_DevCardControllerBaseActionController =
      ActionController(name: '_DevCardControllerBase');

  @override
  void setConfirmDelete() {
    final _$actionInfo = _$_DevCardControllerBaseActionController.startAction();
    try {
      return super.setConfirmDelete();
    } finally {
      _$_DevCardControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
