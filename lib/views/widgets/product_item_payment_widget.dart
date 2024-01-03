import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/models/product_item_model.dart';
import 'package:e_commerce_app/utils/colors_app.dart';
import 'package:flutter/material.dart';

class ProductItemPaymentWidget extends StatelessWidget {
  final ProductItemModel item;
  const ProductItemPaymentWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: AppColors.grey.withOpacity(.4),
            ),
            child: CachedNetworkImage(
              imageUrl: item.imgUrl,
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (item.size == null) const SizedBox.shrink(),
                    if (item.size != null)
                      Text.rich(
                        TextSpan(
                            text: 'Size: ',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: AppColors.grey),
                            children: [
                              TextSpan(
                                text: item.size!.name,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ]),
                      ),
                    Text(
                      '\$ ${item.price}',
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
