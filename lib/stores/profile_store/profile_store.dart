import 'package:mobx/mobx.dart';
import 'package:omni_app/models/dev_model.dart';
part 'profile_store.g.dart';

class ProfileStore = _ProfileStoreBase with _$ProfileStore;

abstract class _ProfileStoreBase with Store {
  _ProfileStoreBase();

  @observable
  DevModel dev;

  @action
  void setDev(DevModel dev) => dev = dev;
}
