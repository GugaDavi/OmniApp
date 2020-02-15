import 'package:flutter/material.dart';
import 'package:omni_app/ui/styles/colors.dart';

class Button extends StatelessWidget {
  Button({this.child = 'Botão', this.color = secondColor, this.onPressed});

  final Function onPressed;
  final String child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed ?? () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      padding: EdgeInsets.only(top: 15, bottom: 15, left: 50, right: 50),
      color: color,
      child: Text(child, style: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }
}
