import 'package:mobx/mobx.dart';
import 'package:omni_app/models/dev_model.dart';
part 'edit_profile_controller.g.dart';

class EditProfile = _EditProfileBase with _$EditProfile;

abstract class _EditProfileBase with Store {
  @observable
  String name;
  @action
  void setName(String value) => name = value;

  @observable
  String bio;
  @action
  void setBio(String value) => bio = value;

  @observable
  String latitude;
  @action
  void setLatitude(String value) => latitude = value;

  @observable
  String longitude;
  @action
  void setLongitude(String value) => longitude = value;

  @observable
  String techs;
  @action
  void setTechs(String value) => techs = value;

  @computed
  Map<String, String> get compile {
    Map<String, String> data = <String, String>{};
    data['name'] = name;
    data['bio'] = bio;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['techs'] = techs;
    return data;
  }

  @computed
  bool get validate =>
      name.isNotEmpty &&
      techs.isNotEmpty &&
      latitude.isNotEmpty &&
      longitude.isNotEmpty;

  @action
  void setProps(DevModel dev) {
    setName(dev.name);
    setBio(dev.bio);
    setLatitude(dev.location.latitude.toString());
    setLongitude(dev.location.longitude.toString());
    setTechs(dev.techs.join(', '));
  }
}
