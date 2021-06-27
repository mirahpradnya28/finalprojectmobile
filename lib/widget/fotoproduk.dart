
import 'package:ambildata_api/widget/const.dart';
import 'package:flutter/material.dart';

class FotoProduk extends StatelessWidget {
  FotoProduk({
    @required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          buildCircle(
            all: 1.0,
            color: warnaUtama,
            child: buildCircle(
              all: 3.0,
              color: Colors.white,
              child: buildCircle(
                all: 3.0,
                color: warnaKedua,
                child: buildImage(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(imagePath);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
      )),
    );
  }

  

  Widget buildCircle({
    @required Widget child,
    @required double all,
    @required Color color,
  }) {
    return ClipOval(
      child: Container(
        color: color,
        padding: EdgeInsets.all(all),
        child: child,
      ),
    );
  }
}
