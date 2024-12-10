import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar avec des couleurs vives, titre centré et icône pour le rendu plus moderne
      appBar: AppBar(
        title: Text('My E-Commerce', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        elevation: 4.0,
        shadowColor: Colors.deepOrange,
      ),

      // Body inchangé : texte au centre
      body: Center(
        child: Text(
          'Home Screen',
          style: TextStyle(fontSize: 20),
        ),
      ),

      // BottomNavigationBar avec un fond coloré et des icônes contrastées
      bottomNavigationBar: bottomNav(),
    );
  }

  BottomNavigationBar bottomNav() {
    return BottomNavigationBar(
      currentIndex: 0,
      backgroundColor: Colors.deepOrange, // Couleur vive de fond
      selectedItemColor: Colors.white, // Couleur de l'item sélectionné
      unselectedItemColor: Colors
          .white70, // Couleur légèrement atténuée pour les items non sélectionnés
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
