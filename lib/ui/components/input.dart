import 'package:flutter/material.dart';
import 'package:omni_app/ui/styles/styles.dart';

class Input extends StatelessWidget {
  Input({this.controller, this.labelName, this.onChanged, this.initValue});

  final String labelName;
  final String initValue;
  final TextEditingController controller;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        onChanged: onChanged,
        initialValue: initValue,
        controller: controller,
        decoration: inputStyle(labelText: labelName),
        style: TextStyle(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
