import 'package:flutter/material.dart';
import 'package:myapp/screens/main_screen.dart';

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
        // Ajout d’un style pour les icônes du BottomNavigationBar
        iconTheme: IconThemeData(color: Colors.white),
      ),
      home: MainScreen(),
    );
  }
}
