import 'package:ambildata_api/page/homeScreen.dart';
import 'package:ambildata_api/page/pelangganScreen.dart';
import 'package:ambildata_api/widget/const.dart';
import 'package:flutter/material.dart';


class AwalScreen extends StatefulWidget {
  static String id = 'awal_screen';
  

  @override
  _AwalScreenState createState() => _AwalScreenState();
}

class _AwalScreenState extends State<AwalScreen> {
  int _bottomNavCurrentIndex = 0;
  List<Widget> _container =[ 
    new HomeScreen(),
    new PelangganScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _container[_bottomNavCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: warnaUtama,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            _bottomNavCurrentIndex = index;
          });
        },
        currentIndex: _bottomNavCurrentIndex,
        items: [
          BottomNavigationBarItem(
            activeIcon: new Icon(Icons.home),
            icon: new Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            activeIcon: new Icon(Icons.people),
            icon: new Icon(Icons.people),
            label: 'Pelanggan',
          )
        ],
      ),
    );
  }
}
