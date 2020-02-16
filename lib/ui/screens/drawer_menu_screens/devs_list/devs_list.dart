import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:omni_app/models/dev_model.dart';
import 'package:omni_app/stores/dev_list_store/controllers/dev_card_controller.dart';
import 'package:omni_app/stores/dev_list_store/dev_list_store.dart';
import 'package:omni_app/ui/screens/drawer_menu_screens/devs_list/card_icon.dart';
import 'package:omni_app/ui/styles/colors.dart';

class DevList extends StatelessWidget {
  DevListStore devListStore = DevListStore();

  @override
  Widget build(BuildContext context) {
    double widthScreenSize = MediaQuery.of(context).size.width;
    devListStore.listerDevs();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryDarkColor,
          title: Text('Lista de Devs'),
          centerTitle: true,
        ),
        body: Observer(
          builder: (_) {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                DevModel dev = devListStore.devs.devs[index];
                return _devCard(widthScreenSize, dev);
              },
              itemCount: devListStore.devs?.devs?.length ?? 0,
            );
          },
        ));
  }

  Widget _devCard(double widthScreenSize, DevModel dev) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: primaryLightColor,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      offset: Offset.fromDirection(10, -3),
                      blurRadius: 7)
                ],
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(75.0),
                      child: Image.network(
                        dev.avatarUrl,
                        height: 75,
                        width: 75,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Container(
                      width: widthScreenSize * 60 / 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            dev.name,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            dev.techs.join(', '),
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  dev.bio,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: CardIcon(devListStore: devListStore, dev: dev),
          ),
        ],
      ),
    );
  }
}
