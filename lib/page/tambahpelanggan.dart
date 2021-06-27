
import 'package:ambildata_api/widget/buttom.dart';
import 'package:ambildata_api/widget/const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class TambahDataPelanggan extends StatefulWidget {
  @override
  _TambahDataPelangganState createState() => _TambahDataPelangganState();
}

class _TambahDataPelangganState extends State<TambahDataPelanggan> {
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerKode = new TextEditingController();

  void simpanData() {
    http.post(Uri.parse("http://192.168.43.220/tokoku/adddatauser.php"), body: {
      "nama": controllerNama.text,
      "kode": controllerKode.text,
    });
  }

  void notifikasisimpan(){
    ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Data Berhasil Disimpan')));
  }
  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Menambahkan Data Pelanggan"),
        backgroundColor: warnaUtama,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerNama,
                  decoration: new InputDecoration(
                      labelText: "Nama Pelanggan", labelStyle: labelText),
                ),
                SizedBox(height: 10.0),
                new TextField(
                  controller: controllerKode,
                  decoration: new InputDecoration(
                      labelText: "Kode Pelanggan",labelStyle: labelText),
                ),
                SizedBox(height: 50.0),
                new CustomButton(
                    text: 'Simpan', 
                  onTap: () {
                      simpanData();
                      Navigator.pop(context);
                      notifikasisimpan();
                    },)
              ],
            )
          ],
        ),
      ),
    );
  }
}