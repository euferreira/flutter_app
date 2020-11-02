import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text("Fernando"),
                  accountEmail: Text("fernando@embratecc.com.br"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/dog1.png"),
                  ),
                ),
                ListTile(
                    leading: Icon(Icons.star),
                    title: Text("Titulo"),
                    subtitle: Text("Subtitulo"),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      print("A");
                      Navigator.pop(context);
                    }
                ),
                ListTile(
                    leading: Icon(Icons.star),
                    title: Text("Titulo"),
                    subtitle: Text("Subtitulo"),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      print("A");
                      Navigator.pop(context);
                    }
                ),
                ListTile(
                    leading: Icon(Icons.star),
                    title: Text("Titulo"),
                    subtitle: Text("Subtitulo"),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      print("A");
                      Navigator.pop(context);
                    }
                ),
              ]
          )
      ),
    );
  }
}
