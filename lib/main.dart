import 'package:flutter/material.dart';
import 'package:myppa/screens/detail_screen.dart';
import 'package:myppa/screens/main_screen.dart';
// Import du detail_screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My E-Commerce',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MainScreen(),
      routes: {
        //  Définition de la route nommée pour l'écran de détail
        DetailScreen.routeName: (context) => DetailScreen(),
      },
    );
  }
}
