import 'package:flutter/material.dart';
import 'package:omni_app/ui/components/button.dart';
import 'package:omni_app/ui/components/input.dart';
import 'package:omni_app/ui/styles/colors.dart';

class NewDev extends StatelessWidget {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _techsController = TextEditingController();
  TextEditingController _latitudeController = TextEditingController();
  TextEditingController _longitudeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  _buildInput('GitHub Username', _userNameController),
                  _buildInput('Techs', _techsController),
                  _buildInput('Latitude', _latitudeController),
                  _buildInput('Longitude', _longitudeController),
                  Button(
                    color: secondColor,
                    child: 'Adicionar',
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInput(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Input(
        labelName: label,
        controller: controller,
      ),
    );
  }
}
