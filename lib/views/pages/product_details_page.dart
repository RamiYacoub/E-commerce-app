import 'package:e_commerce_app/models/product_item_model.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductItemModel productItem;
  const ProductDetailsPage({super.key,required this.productItem});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text(productItem.name),
      ),
    );
  }
}
