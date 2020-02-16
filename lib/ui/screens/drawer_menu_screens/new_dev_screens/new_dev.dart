import 'package:flutter/material.dart';
import 'package:omni_app/models/dev_model.dart';
import 'package:omni_app/routes/route_consts.dart';
import 'package:omni_app/stores/dev_list_store/dev_list_store.dart';
import 'package:omni_app/stores/new_dev_store/new_dev_store.dart';
import 'package:omni_app/ui/components/button.dart';
import 'package:omni_app/ui/components/input.dart';
import 'package:omni_app/ui/styles/colors.dart';
import 'package:provider/provider.dart';

class NewDev extends StatelessWidget {
  NewDevStore newDevStore = NewDevStore();

  @override
  Widget build(BuildContext context) {
    DevListStore devListStore = Provider.of<DevListStore>(context);
    bool isVisibleKeyboard = MediaQuery.of(context).viewInsets.bottom > 0;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: isVisibleKeyboard
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.symmetric(vertical: 28, horizontal: 24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      offset: Offset.fromDirection(10, -5),
                      blurRadius: 10)
                ],
                gradient: LinearGradient(
                    colors: <Color>[primaryColor, primaryDarkColor])),
            child: Material(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      'NOVO DEV:',
                      style: TextStyle(
                          fontSize: 21,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  _buildInput(
                      'GitHub Username', newDevStore.form.setGithubUserName),
                  _buildInput('Techs', newDevStore.form.setTechs),
                  _buildInput('Latitude', newDevStore.form.setLatitude),
                  _buildInput('Longitude', newDevStore.form.setLongitude),
                  Button(
                      color: secondColor,
                      child: 'Adicionar',
                      onPressed: () => addDev(context, devListStore))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addDev(BuildContext context, DevListStore devListStore) async {
    DevModel dev = await newDevStore.addDev();
    devListStore.addDev(dev);
    Navigator.popAndPushNamed(context, devsList);
  }

  Widget _buildInput(String label, Function onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Input(
        labelName: label,
        onChanged: onChanged,
      ),
    );
  }
}
