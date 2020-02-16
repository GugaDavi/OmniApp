import 'package:mobx/mobx.dart';
import 'package:omni_app/api/api.dart';
import 'package:omni_app/models/dev_model.dart';
import 'package:omni_app/stores/new_dev_store/controllers/form_dev_controller.dart';
part 'new_dev_store.g.dart';

class NewDevStore = _NewDevStoreBase with _$NewDevStore;

abstract class _NewDevStoreBase with Store {
  Api api = Api();

  @observable
  FormDev form = FormDev();

  @action
  Future<DevModel> addDev() async {
    try {
      DevModel newDev = await api.addDev(form.compile());
      return newDev;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
