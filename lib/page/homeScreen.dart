import 'package:ambildata_api/widget/const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'detailHalaman.dart';
import 'tambahData.dart';

class HomeScreen extends StatefulWidget {
  static String id = "home_screen";
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  Future<List> ambilData() async {
    var data =
        await http.get(Uri.parse('http://192.168.43.220/tokoku/ambildata.php'));
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
          child: Text("Daftar Barang"),
        ),
        actions: [
          SizedBox(width: 20.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: warnaUtama,
            ),
            onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new TambahData())),
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
                        onTap: () => Navigator.of(context).push(
                            new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new DetailHalaman(
                                      list: snapshot.data,
                                      index: index,
                                    ))),
                        child: new Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            color: Colors.white,
                            elevation: 20.0,
                            shadowColor: warnaUtama,
                            child: Container(
                                height: 150.0,
                                child: Center(
                                    child: new ListTile(
                                  title: new Text(snapshot.data[index]['nama'],
                                      style: labelText),
                                  leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        snapshot.data[index]['gambar'],
                                        width: 100.0,
                                        height: 80.0,
                                        fit: BoxFit.cover,
                                      )),
                                  subtitle: new Text(
                                    "Stok : " + snapshot.data[index]['stok'],
                                    style: inputText,
                                  ),
                                ))))),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
