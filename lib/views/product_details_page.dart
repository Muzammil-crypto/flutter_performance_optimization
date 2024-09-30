import 'package:deferred_comps/app_colors/app_colors.dart';
import 'package:deferred_comps/widgets/custom_primary_button.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final double price;

  const ProductDetailsPage({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(imageUrl),
              const SizedBox(height: 16),
              Text(
                title,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 8),
              Text(
                '\$$price',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 16),
              Text(description),
              const SizedBox(height: 32),
              CustomPrimaryButton(text: "Add to cart", onPressed: () {}, color: primaryColor),
            ],
          ),
        ),
      ),
    );
  }
}
