// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_dev_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FindDev on _FindDevBase, Store {
  Computed<bool> _$techsIsNotEmptyComputed;

  @override
  bool get techsIsNotEmpty => (_$techsIsNotEmptyComputed ??=
          Computed<bool>(() => super.techsIsNotEmpty))
      .value;

  final _$techsAtom = Atom(name: '_FindDevBase.techs');

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

  final _$_FindDevBaseActionController = ActionController(name: '_FindDevBase');

  @override
  void setTechs(String newTechs) {
    final _$actionInfo = _$_FindDevBaseActionController.startAction();
    try {
      return super.setTechs(newTechs);
    } finally {
      _$_FindDevBaseActionController.endAction(_$actionInfo);
    }
  }
}
