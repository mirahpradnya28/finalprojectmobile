import 'package:ambildata_api/page/loginScreen.dart';
import 'package:ambildata_api/widget/buttom.dart';
import 'package:flutter/material.dart';

class LauncherScreen extends StatefulWidget {
  static String id = 'launcher_screen';

  @override
  _LauncherScreenState createState() => _LauncherScreenState();
}

class _LauncherScreenState extends State<LauncherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal:20),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Center(
              child: new Image.asset("image/logobiru.png",
              height: 150.0,
              ),
            ),
            new SizedBox(height : 100.0),
            new CustomButton(
              text: 'Next',
              onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new LoginScreen())),
              )
          ],
        ),
      ),
      
    );
  }
}