import 'package:flutter/material.dart';

InputDecoration inputStyle({String labelText, Widget suffix}) {
  return InputDecoration(
    labelText: labelText ?? '',
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(45),
        borderSide: BorderSide(color: Colors.white, width: 1)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(45),
        borderSide: BorderSide(color: Colors.white, width: 1)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(45),
      borderSide: BorderSide(
        width: 1,
        color: Colors.white,
      ),
    ),
    labelStyle:
        TextStyle(fontFamily: 'Roboto', fontSize: 20, color: Colors.white),
    suffixIcon: suffix,
    contentPadding: EdgeInsets.only(top: 20, right: 10, bottom: 20, left: 40),
  );
}
