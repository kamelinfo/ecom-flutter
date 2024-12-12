import 'package:flutter/material.dart';
import 'package:myapp/component/product_card.dart';

class MainScreen extends StatelessWidget {
  // Liste factice de produits (20 produits identiques)
  final List<Map<String, dynamic>> products = List.generate(20, (index) {
    return {
      "name": "Futuristic T-Shirt #${index + 1}",
      "price": "${(index + 1) * 10} \$",
      "imageUrl": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"
    };
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My E-Commerce', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        elevation: 4.0,
      ),
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
      bottomNavigationBar: buttomNav(),
    );
  }

  BottomNavigationBar buttomNav() {
    return BottomNavigationBar(
      currentIndex: 0,
      backgroundColor: Colors.deepOrange,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
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
