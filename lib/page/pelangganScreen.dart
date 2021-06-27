import 'package:ambildata_api/page/tambahpelanggan.dart';
import 'package:ambildata_api/widget/const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class PelangganScreen extends StatefulWidget {
  static String id = "pelanggan_screen";
  @override
  _PelangganScreen createState() => _PelangganScreen();
}

class _PelangganScreen extends State<PelangganScreen> {

  Future<List> ambilData() async {
    var data = await http
        .get(Uri.parse('http://192.168.43.220/tokoku/ambildatauser.php'));
    var jsonData = json.decode(data.body);
    print(jsonData);
    return jsonData;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: warnaKedua,
      appBar: AppBar(
        backgroundColor: warnaUtama,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text("Daftar Pelanggan"),
        ),
        actions: [
          SizedBox(width: 20.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: warnaUtama,
            ),
            onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new TambahDataPelanggan())),
            child: new Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
        child: FutureBuilder(
          future: ambilData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Loading ..."),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      padding: const EdgeInsets.all(10.0),
                      child: new GestureDetector(
                        onTap: () {},
                        child: new Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            color: Colors.white,
                            elevation: 20.0,
                            shadowColor: warnaUtama,
                            child: Container(
                                height: 100.0,
                                child: Center(
                                    child: new ListTile(
                                        title: new Text(
                                            snapshot.data[index]
                                                ['nama_pelanggan'],
                                            style: labelText),
                                        subtitle: new Text(
                                          snapshot.data[index]
                                              ['kode_pelanggan'],
                                          style: inputText,
                                        ),
                                        )))),
                      ));
                },
              );
            }
          },
        ),
      ),
    );
  }
}
