import 'dart:typed_data';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:omni_app/api/api.dart';
import 'package:omni_app/models/dev_model.dart';
import 'package:omni_app/models/devs_model.dart';
import 'package:omni_app/stores/home_store/controllers/find_dev_controller.dart';
import 'package:omni_app/utils/dev_image_to_bytes.dart';
import 'package:url_launcher/url_launcher.dart';
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
  ObservableSet<Marker> mrks = <Marker>{}.asObservable();

  @action
  void addMrk(Marker mk) => mrks.add(mk);
  @action
  void clearMrk() => mrks.clear();

  @computed
  bool get loadedMrks => mrks.length > 0;

  @action
  Future<void> listerDevs(String techs) async {
    clearMrk();
    try {
      DevsModel devsList = await _api.search(
          ltLg.latitude.toString(), ltLg.longitude.toString(), techs);
      devsList.devs.forEach((DevModel dev) {
        addMrk(Marker(
          markerId: MarkerId(dev.id),
          position: LatLng(dev.location.latitude, dev.location.longitude),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          infoWindow: InfoWindow(
              title: dev.name,
              snippet: dev.techs.join(', '),
              onTap: () => goToGihub(dev.githubUsername)),
        ));
      });

      setDevs(devsList);
    } catch (e) {
      print(e);
    }
  }

  void goToGihub(String githubUser) async {
    String baseURL = 'https://github.com/$githubUser';
    if (await canLaunch(baseURL)) {
      await launch(baseURL);
    } else {
      throw 'Could not launch $baseURL';
    }
  }
}
