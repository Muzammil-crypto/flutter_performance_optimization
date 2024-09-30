import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com';

  // Fetch products with pagination (we'll use lazy loading)
  static Future<List<dynamic>> fetchProducts(int limit, int skip) async {
    final response = await http.get(Uri.parse('$baseUrl/products?limit=$limit&skip=$skip'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
