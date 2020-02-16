import 'package:mobx/mobx.dart';
import 'package:omni_app/api/api.dart';
import 'package:omni_app/models/dev_model.dart';
import 'package:omni_app/models/devs_model.dart';
part 'dev_list_store.g.dart';

class DevListStore = _DevListStoreBase with _$DevListStore;

abstract class _DevListStoreBase with Store {
  Api api = Api();

  @observable
  DevsModel devs;

  @action
  void setDevs(DevsModel devsList) => devs = devsList;

  @action
  Future<void> listerDevs() async {
    try {
      DevsModel devsList = await api.getDevs();

      setDevs(devsList);
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<void> deleteDev(String id) async {
    bool hasDeletedDev = false;
    try {
      hasDeletedDev = await api.deleteDev(id);
    } catch (e) {
      print(e);
    }

    if (hasDeletedDev) {
      List<DevModel> _list = devs.devs;
      _list.removeWhere((DevModel d) => d.id == id);
      DevsModel updatedDevs = DevsModel(devs: _list);
      setDevs(updatedDevs);
    }
  }
}
