import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/models/product_item_model.dart';
import 'package:e_commerce_app/utils/colors_app.dart';
import 'package:e_commerce_app/view_models/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/views/widgets/counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemWidget extends StatelessWidget {
  final ProductItemModel productItem;
  const CartItemWidget({
    super.key,
    required this.productItem,
  });

  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.grey.withOpacity(0.4),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Stack(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      imageUrl: productItem.imgUrl,
                      fit: BoxFit.cover,
                      height: 120,
                      width: 200,
                    ),
                  ),
                ),
                PositionedDirectional(
                  end: 8.0,
                  top: 8.0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.red.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.delete_outline,
                        size: 30,
                      ),
                      color: AppColors.red,
                      onPressed: () => cartCubit.removeFromCart(productItem.id),
                    ),
                  ),
                ),
                PositionedDirectional(
                  start: 8.0,
                  bottom: 8.0,
                  child: BlocBuilder<CartCubit, CartState>(
                    bloc: cartCubit,
                    buildWhen: (previous, current) =>
                        (current is QuantityCounterLoaded &&
                            current.productId == productItem.id) ||
                        current is CartLoaded,
                    builder: (context, state) {
                      if (state is QuantityCounterLoaded) {
                        return CounterWidget(
                          cubit: BlocProvider.of<CartCubit>(context),
                          productItem: productItem,
                          value: state.value,
                        );
                      } else if (state is CartLoaded) {
                        return CounterWidget(
                          cubit: BlocProvider.of<CartCubit>(context),
                          productItem: productItem,
                          value: state.cartItems
                              .firstWhere(
                                (item) => item.id == productItem.id,
                              )
                              .quantity,
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productItem.name,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  if (productItem.size != null)
                    Text.rich(
                      TextSpan(
                        text: 'Size: ',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: AppColors.grey),
                        children: [
                          TextSpan(
                            text: productItem.size?.name,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              Text(
                '\$${productItem.price}',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
