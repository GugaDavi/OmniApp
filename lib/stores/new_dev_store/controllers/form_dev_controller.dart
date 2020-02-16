import 'package:mobx/mobx.dart';
import 'package:omni_app/models/dev_model.dart';
part 'form_dev_controller.g.dart';

class FormDev = _FormDevBase with _$FormDev;

abstract class _FormDevBase with Store {
  @observable
  String githubUserName;
  @action
  setGithubUserName(String value) => githubUserName = value;

  @computed
  String get validateGithubUserName {
    if (githubUserName.isEmpty) {
      return 'Esse campo é obrigatorio';
    }
    return null;
  }

  @observable
  String techs;
  @action
  setTechs(String value) => techs = value;

  @observable
  String latitude;
  @action
  setLatitude(String value) => latitude = value;

  @observable
  String longitude;
  @action
  setLongitude(String value) => longitude = value;

  @action
  DevModel compile() {
    DevModel dev = DevModel(
        githubUsername: githubUserName,
        techs: techs.split(','),
        location: Coordinates(
            latitude: num.parse(latitude), longitude: num.parse(longitude)));

    return dev;
  }
}
