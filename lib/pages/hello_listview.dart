import 'package:flutter/material.dart';
import 'package:flutter_app/dog.dart';
import 'package:flutter_app/widgets/text.dart';

class HelloListView extends StatefulWidget {

  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              print("Lista");
              gridView = false;
            },
          ),
          IconButton(
            icon: Icon(Icons.grid_on),
            onPressed: () {
              print("Grid");
              gridView = true;
            },
          ),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    List<Dog> dogs = [
      Dog("Jack Russel", "assets/images/dog1.png"),
      Dog("Labrador", "assets/images/dog2.png"),
      Dog("Pug", "assets/images/dog3.png"),
      Dog("Rotweiller", "assets/images/dog4.png"),
      Dog("Pastor", "assets/images/dog5.png"),
    ];

    return ListView.builder(
      itemCount: dogs.length,
      itemExtent: 300,
      itemBuilder: (context, index) {
        Dog dog = dogs[index];

        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _img(dog.foto),
            Texto(dog.nome, Colors.white),
          ],
        );
      },
    );
  }

  Widget _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }
}
