import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> fetchProductsFromApi() async {
  final response =
      await http.get(Uri.parse('https://fakestoreapi.com/products'));

  if (response.statusCode == 200) {
    final List data = json.decode(response.body);
    return data.map((product) {
      return {
        "name": product['title'],
        "price": "${product['price']} \$",
        "imageUrl": product['image'],
        "rating": (product['rating']['rate'] as num).round(),
      };
    }).toList();
  } else {
    throw Exception('Failed to load products');
  }
}
