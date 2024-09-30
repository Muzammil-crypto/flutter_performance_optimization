import 'package:cached_network_image/cached_network_image.dart';
import 'package:deferred_comps/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../app_colors/app_colors.dart';
import '../controllers/product_controllers.dart';
import '../controllers/theme_controller.dart';

class ProductPage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  final ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Products', color: Colors.white, fontSize: 24),
        backgroundColor: accentColor,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: primaryColor, // Use theme's primary color
              ),
              child: const Text(
                'Settings',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: const Text('Dark Mode'),
              trailing: Obx(() {
                return Switch(
                  value: themeController.isDarkMode.value,
                  onChanged: (value) {
                    themeController.toggleTheme(); // Toggle theme on switch
                  },
                );
              }),
            ),
          ],
        ),
      ),
      body: Container(
        color: backgroundColor, // Set the background color from the theme
        child: Obx(() {
          if (productController.isLoading.value) {
            return buildShimmerLoading();
          } else {
            return NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (!productController.isMoreLoading.value &&
                    scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                  productController.loadMoreProducts(); // Trigger lazy loading
                }
                return true;
              },
              child: ListView.builder(
                itemCount: productController.productList.length + 1,
                itemBuilder: (context, index) {
                  if (index == productController.productList.length) {
                    return productController.isMoreLoading.value
                        ? Center(
                            child: CircularProgressIndicator(
                              color: accentColor, // Use accent color for loader
                              strokeWidth: 2,
                            ),
                          )
                        : const SizedBox
                            .shrink(); // Empty space when not loading more products
                  }

                  var product = productController.productList[index];
                  return ListTile(
                    title: Text(product['title'],
                        style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.color)), // Set text color from theme
                    subtitle: Text("\$${product['price']}",
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodyMedium?.color)),
                    leading: CachedNetworkImage(
                      imageUrl: product['image'],
                      width: 50,
                      height: 50,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            );
          }
        }),
      ),
    );
  }

  // Shimmer effect for initial product loading
  Widget buildShimmerLoading() {
    return ListView.builder(
      itemCount: 10, // Showing 10 shimmer items during initial loading
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Theme.of(context).brightness == Brightness.light
              ? Colors.grey[300]!
              : Colors.grey[800]!, // Shimmer base color based on the theme
          highlightColor: Theme.of(context).brightness == Brightness.light
              ? Colors.grey[100]!
              : Colors.grey[600]!, // Shimmer highlight color based on the theme
          child: ListTile(
            leading: Container(
              width: 50.0,
              height: 50.0,
              color: Colors.white,
            ),
            title: Container(
              width: double.infinity,
              height: 8.0,
              color: Colors.white,
            ),
            subtitle: Container(
              width: 100.0,
              height: 8.0,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
