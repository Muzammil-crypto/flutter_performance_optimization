import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductController extends GetxController {
  var productList = [].obs; // List of products
  var isLoading = false.obs; // For showing shimmer or loader
  var isMoreLoading =
      false.obs; // For showing bottom loader during lazy loading
  var page = 1; // Track the current page
  final int perPage = 10; // Number of products per page

  @override
  void onInit() {
    super.onInit();
    fetchProducts(); // Fetch initial products on app start
  }

  Future<void> fetchProducts() async {
    isLoading(true);
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/products?limit=$perPage'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      productList.addAll(data); // Append fetched products
    }
    isLoading(false);
  }

  Future<void> loadMoreProducts() async {
    if (!isMoreLoading.value) {
      isMoreLoading(true);
      page++;
      final response = await http.get(Uri.parse(
          'https://fakestoreapi.com/products?limit=$perPage&page=$page'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        productList.addAll(data); // Append fetched products
      }
      isMoreLoading(false);
    }
  }
}
