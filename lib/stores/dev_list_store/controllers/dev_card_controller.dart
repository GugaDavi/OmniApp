import 'package:mobx/mobx.dart';
import 'package:omni_app/models/dev_model.dart';
part 'dev_card_controller.g.dart';

class DevCardController = _DevCardControllerBase with _$DevCardController;

abstract class _DevCardControllerBase with Store {
  _DevCardControllerBase(this.dev);

  final DevModel dev;

  @observable
  bool confirmDelete = false;
  @action
  void setConfirmDelete() => confirmDelete = !confirmDelete;
}
