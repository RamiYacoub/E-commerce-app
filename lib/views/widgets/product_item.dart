import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/models/product_item_model.dart';
import 'package:e_commerce_app/utils/colors_app.dart';
import 'package:e_commerce_app/view_models/favourite_cubit/favourite_cubit.dart';
import 'package:e_commerce_app/view_models/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final ProductItemModel productItem;
  // ignore: prefer_typing_uninitialized_variables
  final cubit;
  const ProductItem(
      {super.key, required this.productItem, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 130,
              width: MediaQuery.of(context).size.width / .25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.grey.shade200,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: productItem.imgUrl,
                  fit: BoxFit.fitHeight,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Positioned(
              top: 6.0,
              right: 6.0,
              child: SizedBox(
                height: 40,
                width: 40,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white60,
                  ),
                  child: IconButton(
                    color: AppColors.primaryColor,
                    onPressed: () {
                      if (cubit is FavouriteCubit) {
                        cubit.removeFromFavourite(productItem.id);
                      } else if (cubit is HomeCubit) {
                        cubit.changeFavourite(productItem.id);
                      }
                    },
                    icon: productItem.isFavorite
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_border),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Text(
          productItem.name,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        Text(
          productItem.category,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Colors.grey,
              ),
        ),
        Text(
          '\$ ${productItem.price} ',
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
