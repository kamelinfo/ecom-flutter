import 'package:flutter/material.dart';
import 'package:myppa/component/product_card.dart';

class MainScreen extends StatelessWidget {
  MainScreen({
    super.key,
  });
  final List<Map<String, dynamic>> products = List.generate(20, (index) {
    return {
      "name": "Futuristic T-Shirt #${index + 1}",
      "price": "${(index + 1) * 10}",
      "imageUrl": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"
    };
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          // On choisit une largeur de carte approximative (par ex. 180 pixels).
          // En divisant la largeur disponible par 180, on obtient un nombre "idéal" de colonnes.
          double cardWidth = 180.0;
          int crossAxisCount = (constraints.maxWidth / cardWidth).floor();

          // On s’assure qu’il y ait au moins 2 colonnes.
          if (crossAxisCount < 2) {
            crossAxisCount = 2;
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(
                  name: product["name"],
                  price: product["price"],
                  imageUrl: product["imageUrl"],
                  onTap: () {
                    // Action au clic sur un produit (par ex: navigation vers détails)
                  },
                );
              },
            ),
          );
        },
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
