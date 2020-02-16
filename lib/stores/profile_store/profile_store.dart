import 'package:mobx/mobx.dart';
import 'package:omni_app/api/api.dart';
import 'package:omni_app/models/dev_model.dart';
import 'package:omni_app/stores/profile_store/controllers/edit_profile_controller.dart';
part 'profile_store.g.dart';

class ProfileStore = _ProfileStoreBase with _$ProfileStore;

abstract class _ProfileStoreBase with Store {
  _ProfileStoreBase();
  Api api = Api();

  @observable
  DevModel userDev;

  @observable
  EditProfile editProfile = EditProfile();

  @action
  void setDev(DevModel dev) => userDev = dev;

  @action
  Future<void> updateProfile() async {
    try {
      DevModel updatedDev =
          await api.updateDev(userDev.id, editProfile.compile);
      setDev(updatedDev);
    } catch (e) {
      print(e);
    }
  }
}
