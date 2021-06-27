
import 'package:ambildata_api/widget/buttom.dart';
import 'package:ambildata_api/widget/const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class TambahData extends StatefulWidget {
  @override
  _TambahDataState createState() => _TambahDataState();
}

class _TambahDataState extends State<TambahData> {
  TextEditingController controllerKode = new TextEditingController();
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerHarga = new TextEditingController();
  TextEditingController controllerStok = new TextEditingController();
  TextEditingController controllerGambar = new TextEditingController();

  void simpanData() {
    http.post(Uri.parse("http://192.168.43.220/tokoku/adddata.php"), body: {
      "kodeBarang": controllerKode.text,
      "namaBarang": controllerNama.text,
      "hargaBarang": controllerHarga.text,
      "stokBarang": controllerStok.text,
      "gambar": controllerGambar.text,
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
        title: new Text("Menambahkan Data"),
        backgroundColor: warnaUtama,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerKode,
                  decoration: new InputDecoration(
                      labelText: "Kode Barang", labelStyle: labelText),
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
                      labelText: "Stok Barang", labelStyle: labelText),
                ),
                SizedBox(height: 10.0),
                new TextField(
                  controller: controllerGambar,
                  decoration: new InputDecoration(
                      labelText: "Gambar Produk", labelStyle: labelText),
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