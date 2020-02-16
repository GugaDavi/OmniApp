import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:omni_app/models/dev_model.dart';
import 'package:omni_app/stores/dev_list_store/controllers/dev_card_controller.dart';
import 'package:omni_app/stores/dev_list_store/dev_list_store.dart';
import 'package:url_launcher/url_launcher.dart';

class CardIcon extends StatelessWidget {
  const CardIcon({
    Key key,
    @required this.devListStore,
    @required this.dev,
  }) : super(key: key);

  final DevListStore devListStore;
  final DevModel dev;

  @override
  Widget build(BuildContext context) {
    DevCardController devCardController = DevCardController(dev);

    return Observer(
      builder: (_) {
        if (devCardController.confirmDelete &&
            dev.id == devCardController.dev.id) {
          return Row(
            children: <Widget>[
              IconButton(
                onPressed: () => devListStore.deleteDev(dev.id),
                alignment: Alignment.centerRight,
                padding: EdgeInsets.all(0),
                icon: Icon(
                  Icons.delete_forever,
                  size: 28,
                  color: Colors.red,
                ),
              ),
              IconButton(
                onPressed: devCardController.setConfirmDelete,
                icon: Icon(
                  Icons.clear,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            ],
          );
        }
        return Row(
          children: <Widget>[
            IconButton(
              onPressed: devCardController.setConfirmDelete,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(0),
              icon: Icon(
                Icons.delete_outline,
                size: 28,
                color: Colors.red,
              ),
            ),
            IconButton(
              onPressed: () => goToGihub(dev.githubUsername),
              icon: Icon(
                Icons.open_in_new,
                size: 28,
                color: Colors.black,
              ),
            ),
          ],
        );
      },
    );
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
