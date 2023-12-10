import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/models/product_category_model.dart';
import 'package:flutter/material.dart';

class ProductCategory extends StatelessWidget {
  final ProductCategorysModel productCategory;
  final int index;
  const ProductCategory(
      {super.key, required this.productCategory, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 130,
              width: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.grey.shade200,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CachedNetworkImage(
                  imageUrl: productCategory.imgUrl,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Positioned(
              top: 45.0,
              right: index % 2 == 0 ? 20.0 : 305,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productCategory.name,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                  ),
                  Text(
                    '${productCategory.number} Product',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                          color: Colors.black,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
