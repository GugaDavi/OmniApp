import 'package:flutter/material.dart';
import 'package:omni_app/ui/styles/styles.dart';

class Input extends StatelessWidget {
  Input({this.controller, this.labelName});

  final String labelName;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        controller: controller,
        decoration: inputStyle(labelText: labelName),
        style: TextStyle(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
