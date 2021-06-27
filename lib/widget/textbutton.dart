import 'package:flutter/material.dart';

class CustomTextBtn extends StatelessWidget {
  CustomTextBtn({
    @required this.text,
    @required this.color,
    @required this.onPress,
  });
  final String text;
  final Color color;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // Belum ditambahkan onpressd nya
      onPressed: onPress,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12.0,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
    );
  }
}
