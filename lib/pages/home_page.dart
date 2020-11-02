import 'package:flutter/material.dart';
import 'package:flutter_app/drawer_list.dart';
import 'package:flutter_app/pages/hello_gridview.dart';
import 'package:flutter_app/pages/hello_listview.dart';
import 'package:flutter_app/pages/hello_page1.dart';
import 'package:flutter_app/pages/hello_page2.dart';
import 'package:flutter_app/pages/hello_page3.dart';
import 'package:flutter_app/utils/nav.dart';
import 'package:flutter_app/widgets/blue_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Hello Flutter",
          ),
          bottom: TabBar(tabs: [
            Tab(
              text: "Tab 1",
            ),
            Tab(
              text: "Tab 2",
            ),
            Tab(
              text: "Tab 3",
            ),
          ]),
        ),
        body: TabBarView(children: [
          _body(context),
          _body(context),
          _body(context),
        ]),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                _onClickFab();
              },
            ),
            SizedBox(
              width: 8,
            ),
            FloatingActionButton(
              child: Icon(Icons.favorite),
              onPressed: () {
                _onClickFab();
              },
            ),
          ],
        ),
        drawer: DrawerList(),
      ),
    );
  }

  _body(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _text(),
          _pageView(),
          _buttons(),
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

  _buttons() {
    return Builder(
      builder: (BuildContext context) {
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
                BlueButton(
                  "Page 2",
                  onPressed: () => _onClickNavegacao(context, HelloPage2()),
                  color: Colors.white,
                ),
                BlueButton(
                  "Page 3",
                  onPressed: () => _onClickNavegacao(context, HelloPage3()),
                  color: Colors.white,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlueButton(
                  "Snack",
                  onPressed: () => _onClickSnack(context),
                  color: Colors.white,
                ),
                BlueButton(
                  "Dialog",
                  onPressed: () => _onClickDialog(context),
                  color: Colors.white,
                ),
                BlueButton(
                  "Toast",
                  onPressed: _onClickToast,
                  color: Colors.white,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlueButton(
                  "GridView",
                  onPressed: () => _onClickNavegacao(context, HelloGridView()),
                  color: Colors.white,
                ),
              ],
            )
          ],
        );
      },
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

  _onClickSnack(context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text("Olá Flutter"),
        action: SnackBarAction(
          textColor: Colors.yellow,
          label: "OK",
          onPressed: () {
            print("OK!");
          },
        ),
      ),
    );
  }

  _onClickDialog(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
                title: Text("Titulo"),
                content: Text("Conteudo"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Cancelar"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                      print("OK!!!");
                    },
                  ),
                ]),
          );
        });
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "Flutter toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.black45,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _onClickFab() {
    print("Adicionar");
  }
}
