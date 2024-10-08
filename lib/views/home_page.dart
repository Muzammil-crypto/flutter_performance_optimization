import 'package:cached_network_image/cached_network_image.dart';
import 'package:deferred_comps/views/product_details_page.dart'
    deferred as product_details;
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

  ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              color: Colors.white,
              Icons.menu,
              size: 30.0,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: const CustomText(
            text: 'Products', color: Colors.white, fontSize: 24),
        backgroundColor: primaryColor,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              color: primaryColor,
              child: const DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomText(
                      text: 'John Doe',
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: const Text('Dark Mode'),
              leading: const Icon(Icons.dark_mode),
              trailing: Obx(() {
                return Switch(
                  value: themeController.isDarkMode.value,
                  onChanged: (value) {
                    themeController.toggleTheme(); // Toggle theme on switch
                  },
                );
              }),
            ),
            ListTile(
              title: const Text('Home'),
              leading: const Icon(Icons.home),
              onTap: () {
                Get.offAllNamed('/home');
              },
            ),
            ListTile(
              title: const Text('Sign Up'),
              leading: const Icon(Icons.app_registration),
              onTap: () {
                Get.offAllNamed('/signup');
              },
            ),
            ListTile(
              title: const Text('Logout'),
              leading: const Icon(Icons.logout),
              onTap: () {
                Get.offAllNamed('/login');
              },
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return buildShimmerLoading();
        } else {
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (!productController.isMoreLoading.value &&
                  scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                productController.loadMoreProducts();
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
                            color: accentColor,
                            strokeWidth: 2,
                          ),
                        )
                      : const SizedBox.shrink();
                }

                var product = productController.productList[index];
                return ListTile(
                  onTap: () async {
                    loadProductDetailsPage(context, product);
                  },
                  title: Text(
                    product['title'],
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.bodyMedium?.fontSize,
                      color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                  ),
                  subtitle: Text(
                    "\$${product['price']}",
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                      color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                  ),
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
    );
  }

  Widget buildShimmerLoading() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Theme.of(context).brightness == Brightness.light
              ? Colors.grey[300]!
              : Colors.grey[800]!,
          highlightColor: Theme.of(context).brightness == Brightness.light
              ? Colors.grey[100]!
              : Colors.grey[600]!,
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

  void loadProductDetailsPage(
      BuildContext context, Map<String, dynamic> product) {
    product_details.loadLibrary();
    Get.to(() => product_details.ProductDetailsPage(
          title: product['title'],
          description: product['description'],
          imageUrl: product['image'],
          price: double.parse(product['price'].toString()),
        ));
  }
}
