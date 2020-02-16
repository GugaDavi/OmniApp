// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileStore on _ProfileStoreBase, Store {
  final _$userDevAtom = Atom(name: '_ProfileStoreBase.userDev');

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

  final _$editProfileAtom = Atom(name: '_ProfileStoreBase.editProfile');

  @override
  EditProfile get editProfile {
    _$editProfileAtom.context.enforceReadPolicy(_$editProfileAtom);
    _$editProfileAtom.reportObserved();
    return super.editProfile;
  }

  @override
  set editProfile(EditProfile value) {
    _$editProfileAtom.context.conditionallyRunInAction(() {
      super.editProfile = value;
      _$editProfileAtom.reportChanged();
    }, _$editProfileAtom, name: '${_$editProfileAtom.name}_set');
  }

  final _$updateProfileAsyncAction = AsyncAction('updateProfile');

  @override
  Future<void> updateProfile() {
    return _$updateProfileAsyncAction.run(() => super.updateProfile());
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
