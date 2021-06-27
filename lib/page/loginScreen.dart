import 'dart:convert';

import 'package:ambildata_api/page/awalScreen.dart';
import 'package:ambildata_api/page/signup.dart';
import 'package:ambildata_api/widget/buttom.dart';
import 'package:ambildata_api/widget/const.dart';
import 'package:ambildata_api/widget/textbutton.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controllerUsername = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();

  Future _login()async{
    final response= http.post(Uri.parse("http://192.168.43.220/tokoku/ambildata.php"),body:{
      "username": controllerUsername.text,
      "password": controllerPassword.text,
    });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.0),
                Center(child: Text("Login", style: titleText2)),
                SizedBox(height: 50.0),
                Center(child: Image.asset("image/landing.png", height: 300.0,)),
                SizedBox(height: 40.0),
                Text("Username", style: labelText,),
                SizedBox(height: 15.0),
                Container(
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: warnaKedua,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextFormField(
                      controller: controllerUsername,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20.0),
                        border: InputBorder.none,
                      ),
                      maxLines: 1,
                      style: inputText,)),
                SizedBox(height: 20.0),
                Text("Password", style: labelText,),
                SizedBox(height: 15.0),
                Container(
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: warnaKedua,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextFormField(
                      controller: controllerPassword,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20.0),
                        border: InputBorder.none,
                      ),
                      maxLines: 1,
                      style: inputText,)),
                  SizedBox(height: 40.0,),
                  CustomButton(text: 'Login', onTap: (){ 
                    _login();
                    Navigator.pushNamed(context, AwalScreen.id);
                    }),
                  SizedBox(height: 10.0),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextBtn(
                      text: "Belum Punya Akun? Sign Up",
                      color: warnaUtama,
                      onPress: () {
                        Navigator.pushNamed(context, SignUpScreen.id);
                      },
                    ),
                  ],
                ),

              ])))));
}
}