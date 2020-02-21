import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:omni_app/api/api.dart';
import 'package:omni_app/models/dev_model.dart';
import 'package:omni_app/models/devs_model.dart';
import 'package:omni_app/stores/home_store/controllers/find_dev_controller.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  Api _api = Api();

  @observable
  FindDev findDev = FindDev();

  @observable
  Coordinates ltLg;
  @action
  void setCoordinates(Coordinates coordinatesUserDev) =>
      ltLg = coordinatesUserDev;

  @observable
  DevsModel devs;
  @action
  void setDevs(DevsModel devsList) => devs = devsList;

  @observable
  DevModel tapedDev;
  @action
  void setTapedDev(DevModel dev) => tapedDev = dev;

  @observable
  bool loadedDevs = false;
  @action
  void setLoadedDev(bool lg) => loadedDevs = lg;

  @action
  Future<void> listerDevs(String techs) async {
    print(techs);
    setLoadedDev(false);
    try {
      DevsModel devsList = await _api.search(
          ltLg.latitude.toString(), ltLg.longitude.toString(), techs);

      setDevs(devsList);
      setLoadedDev(true);
    } catch (e) {
      print(e);
      setLoadedDev(true);
    }
  }
}
