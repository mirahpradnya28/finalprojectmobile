import 'package:ambildata_api/widget/const.dart';
import 'package:flutter/material.dart';

class TextField extends StatefulWidget {
  TextField({
    @required this.obscureText,
    this.inputType,
    this.controller,
  });
  final bool obscureText;
  final TextInputType inputType;
  final TextEditingController controller;

  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        
      ),

      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 18.0,
          ),
        ),
        style: inputText,
      ),
    );
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}