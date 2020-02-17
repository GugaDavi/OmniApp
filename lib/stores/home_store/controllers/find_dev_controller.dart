import 'package:mobx/mobx.dart';
part 'find_dev_controller.g.dart';

class FindDev = _FindDevBase with _$FindDev;

abstract class _FindDevBase with Store {
  @observable
  String techs = '';

  @action
  void setTechs(String newTechs) => techs = newTechs;

  @computed
  bool get techsIsNotEmpty => techs.isNotEmpty;
}
