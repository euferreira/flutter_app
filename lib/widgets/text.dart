import 'package:flutter/material.dart';

class Texto extends StatelessWidget {
  String texto;
  Color color;

  Texto(this.texto, this.color);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          texto,
          style: TextStyle(
            fontSize: 26,
            color: color,
          ),
        ),
      ),
    );
  }
}
