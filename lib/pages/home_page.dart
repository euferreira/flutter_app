import 'package:flutter/material.dart';
import 'package:flutter_app/pages/hello_listview.dart';
import 'package:flutter_app/pages/hello_page1.dart';
import 'package:flutter_app/pages/hello_page2.dart';
import 'package:flutter_app/pages/hello_page3.dart';
import 'package:flutter_app/utils/nav.dart';
import 'package:flutter_app/widgets/blue_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hello Flutter",
        ),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _text(),
          _pageView(),
          _buttons(context),
        ],
      ),
    );
  }

  _pageView() {
    return Container(
      margin: EdgeInsets.all(20),
      height: 300,
      child: PageView(
        children: <Widget>[
          _img("assets/images/dog1.png"),
          _img("assets/images/dog2.png"),
          _img("assets/images/dog3.png"),
          _img("assets/images/dog4.png"),
          _img("assets/images/dog5.png"),
        ],
      ),
    );
  }

  _buttons(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlueButton(
              "ListView",
              onPressed: () => _onClickNavegacao(context, HelloListView()),
              color: Colors.white,
            ),
            BlueButton("Page 2",
                onPressed: () => _onClickNavegacao(context, HelloPage2()),
              color: Colors.white,),
            BlueButton("Page 3",
                onPressed: () => _onClickNavegacao(context, HelloPage3()),
              color: Colors.white,),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlueButton("Snack", onPressed: _onClickSnack,color: Colors.white,),
            BlueButton("Dialog", onPressed: _onClickDialog,color: Colors.white,),
            BlueButton("Toast", onPressed: _onClickToast,color: Colors.white,),
          ],
        ),
      ],
    );
  }

  _text() {
    return Text(
      "Hello World",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.redAccent,
        decorationStyle: TextDecorationStyle.double,
      ),
    );
  }

  _img(String img) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Image.asset(
        img,
        fit: BoxFit.cover,
      ),
    );
  }

  void _onClickNavegacao(BuildContext context, Widget page) async {
    var param = await push(context, page);
  }

  _onClickSnack() {}

  _onClickDialog() {}

  _onClickToast() {}
}
