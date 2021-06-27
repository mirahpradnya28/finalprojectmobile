import 'package:ambildata_api/widget/const.dart';
import 'package:flutter/material.dart';


class CustomButtonDanger extends StatelessWidget {
  CustomButtonDanger({@required this.text, @required this.onTap});

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Belum ditambahkan ontap nya
      onTap: onTap,
      child: Container(
        height: 45.0,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
class CustomButton extends StatelessWidget {
  CustomButton({@required this.text, @required this.onTap});

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Belum ditambahkan ontap nya
      onTap: onTap,
      child: Container(
        height: 45.0,
        width: 350.0,
        decoration: BoxDecoration(
          color: warnaUtama,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
