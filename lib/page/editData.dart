import 'package:ambildata_api/widget/buttom.dart';
import 'package:ambildata_api/widget/const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'homeScreen.dart';



// ignore: must_be_immutable
class EditData extends StatefulWidget {
  List list;
  int index;
  EditData({@required this.list, @required this.index});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController controllerKode = new TextEditingController();
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerHarga = new TextEditingController();
  TextEditingController controllerStok = new TextEditingController();
  TextEditingController controllerGambar = new TextEditingController();

  @override
  void initState() {
    controllerKode.text = widget.list[widget.index]['kode'];
    controllerNama.text = widget.list[widget.index]['nama'];
    controllerHarga.text = widget.list[widget.index]['harga'];
    controllerStok.text = widget.list[widget.index]['stok'];
    controllerGambar.text = widget.list[widget.index]['gambar'];
    super.initState();
  }

  void editData() {
    http.post(Uri.parse("http://192.168.43.220/tokoku/EditData.php"), body: {
      "kodeBarang": controllerKode.text,
      "namaBarang": controllerNama.text,
      "hargaBarang": controllerHarga.text,
      "stokBarang": controllerStok.text,
      "gambar": controllerGambar.text,
      "id": widget.list[widget.index]['id'],
    });
  }

  void notifikasiedit(){
    ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Data Berhasil Diedit')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("Edit Data"),
      backgroundColor: warnaUtama),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerKode,
                  decoration: new InputDecoration(
                      labelText: "Kode Barang",labelStyle: labelText),
                ),
                SizedBox(height: 10.0),
                new TextField(
                  controller: controllerNama,
                  decoration: new InputDecoration(
                      labelText: "Nama Barang",labelStyle: labelText),
                ),
                SizedBox(height: 10.0),
                new TextField(
                  controller: controllerHarga,
                  decoration: new InputDecoration(
                      labelText: "Harga Barang",labelStyle: labelText),
                ),
                SizedBox(height: 10.0),
                new TextField(
                  controller: controllerStok,
                  decoration: new InputDecoration(
                      labelText: "Stok Barang",labelStyle: labelText),
                ),
                SizedBox(height: 10.0),
                new TextField(
                  controller: controllerGambar,
                  decoration: new InputDecoration(
                      labelText: "Gambar", labelStyle: labelText),
                ),
                new SizedBox(height: 50.0),
                new CustomButton(
                    onTap: () {
                      editData();
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new HomeScreen()));
                      notifikasiedit();
                    },
                    text: 'Simpan Perubahan')
              ],
            )
          ],
        ),
      ),
    );
  }
}
