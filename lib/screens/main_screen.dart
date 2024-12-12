import 'package:flutter/material.dart';
import 'package:myppa/component/product_card.dart';
import 'package:myppa/data/get_product_list.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My E-Commerce', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        elevation: 4.0,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future:
            fetchProductsFromApi(), // Appel de la fonction depuis api_service.dart
        builder: (context, snapshot) {
          // Gestion des états : chargement, erreur, données
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Aucun produit disponible.'));
          }
          {
            final products = snapshot.data!;
            return LayoutBuilder(
              builder: (context, constraints) {
                double cardWidth = 180.0;
                int crossAxisCount = (constraints.maxWidth / cardWidth).floor();
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
                        rating: product["rating"],
                        onTap: () {
                          // Navigation déjà gérée dans ProductCard si nécessaire
                        },
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: bottomNav(),
    );
  }

  BottomNavigationBar bottomNav() {
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
