
import 'package:ambildata_api/page/awalScreen.dart';
import 'package:ambildata_api/page/homeScreen.dart';
import 'package:ambildata_api/page/launcherScreen.dart';
import 'package:ambildata_api/page/loginScreen.dart';

import 'package:ambildata_api/page/signup.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frozen Food App',
      theme: ThemeData(),
      initialRoute: LauncherScreen.id,
      routes: {
        LauncherScreen.id:(context) => LauncherScreen(),
        AwalScreen.id : (context)=> AwalScreen(),
        HomeScreen.id : (context) => HomeScreen(),
        // PelangganScreen.id : (context) => PelangganScreen(),
        LoginScreen.id : (context) => LoginScreen(),
        SignUpScreen.id : (context) => SignUpScreen(),
      },
    );
  }      
}
