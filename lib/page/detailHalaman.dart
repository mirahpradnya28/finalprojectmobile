import 'package:ambildata_api/widget/buttom.dart';
import 'package:ambildata_api/widget/const.dart';
import 'package:flutter/material.dart';
import '../page/editData.dart';
import 'package:http/http.dart' as http;
import 'homeScreen.dart';

// ignore: must_be_immutable
class DetailHalaman extends StatefulWidget {
  List list;
  int index;
  DetailHalaman({@required this.list, @required this.index});

  @override
  _DetailHalamanState createState() => _DetailHalamanState();
}

class _DetailHalamanState extends State<DetailHalaman> {
  void konfirmasi() {
    AlertDialog alertDialog = new AlertDialog(
      backgroundColor: Colors.white,
      elevation: 10.0,
      title: Text("Pemberitahuan"),
      content: Text("Apakah Anda Yakin Menghapus Data Ini ?"),
      actions: <Widget>[
        new TextButton(
          style: TextButton.styleFrom(primary: warnaUtama),
          child: new Text("Tidak"),
          onPressed: () => Navigator.pop(context),
        ),
        new TextButton(
          style: TextButton.styleFrom(primary: Colors.red),
          child: new Text("Hapus"),
          onPressed: () {
            hapusData();
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new HomeScreen()));
            notifikasihapus();
          },
        ),
      ],
    );

    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }

  void hapusData() {
    http.post(Uri.parse("http://192.168.43.220/tokoku/hapusdata.php"),
        body: {'id': widget.list[widget.index]['id']});
  }

  final GlobalKey<ScaffoldState> _scaffoldState =
      new GlobalKey<ScaffoldState>();

  void notifikasihapus() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Data Berhasil Dihapus')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: warnaKedua,
      key: _scaffoldState,
      appBar: new AppBar(
        //mengambil nama untuk judul appbar
        title: new Text(widget.list[widget.index]['nama']),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: warnaUtama,
              ),
              onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new EditData(
                        list: widget.list,
                        index: widget.index,
                      ))),
              child: new Icon(Icons.edit)),
        ],
        backgroundColor: warnaUtama,
      ),
      body: new Container(
        child: new Card(
          child: new Center(
            child: Column(
              children: [
                SizedBox(height: 30.0),
                new ClipRRect(
                  child: Image.network(
                    widget.list[widget.index]['gambar'],
                    height: 300.0,
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 50.0),
                ),
                new Text(
                  "Nama Barang : " + widget.list[widget.index]['nama'],
                  style: labelText,
                ),
                SizedBox(height: 10.0),
                new Text("Kode : " + widget.list[widget.index]['kode'],
                    style: labelText),
                SizedBox(height: 10.0),
                new Text("Harga: " + widget.list[widget.index]['harga'],
                    style: labelText),
                SizedBox(height: 10.0),
                new Text("Stok : " + widget.list[widget.index]['stok'],
                    style: labelText),
                new SizedBox(height: 60.0),
                Container(
                  width: 300.0,
                  child: new CustomButton(
                      onTap: () => konfirmasi(), text: 'Hapus'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
