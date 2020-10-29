import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  String msg;
  Function onPressed;
  Color color;

  BlueButton(this.msg, {@required this.onPressed, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blue,
      child: Text(
        msg,
        style: TextStyle(
          color: color,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
