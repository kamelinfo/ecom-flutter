import 'package:flutter/material.dart';
import 'package:myapp/component/product_card.dart';

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
      body: Center(
        child: ProductCard(
          name: "Futuristic T-Shirt",
          price: "29.99 \$",
          imageUrl: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
          onTap: () {
            // Action lorsque l'on clique sur la carte
          },
        ),
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
