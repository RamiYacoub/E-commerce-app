import 'package:e_commerce_app/utils/app_routes.dart';
import 'package:e_commerce_app/utils/colors_app.dart';
import 'package:e_commerce_app/view_models/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/views/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dash/flutter_dash.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<CartCubit, CartState>(
      bloc: BlocProvider.of<CartCubit>(context),
      buildWhen: (previous, current) => current is! QuantityCounterLoaded,
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is CartLoaded) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 24),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = state.cartItems[index];
                      return CartItemWidget(productItem: item);
                    },
                  ),
                  const SizedBox(height: 24.0),
                  _buildTotalAndSubTotalItem(
                      context, 'Subtotal', state.subtotal),
                  const SizedBox(height: 16.0),
                  _buildTotalAndSubTotalItem(context, 'Shipping', 10),
                  const SizedBox(height: 16.0),
                  Dash(
                    length: size.width - 32,
                    dashLength: 12,
                    dashColor: AppColors.grey,
                  ),
                  const SizedBox(height: 16.0),
                  _buildTotalAndSubTotalItem(
                      context, 'Total Amount', state.subtotal + 10),
                  const SizedBox(height: 36),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () =>
                              Navigator.of(context, rootNavigator: true)
                                  .pushNamed(AppRoutes.paymentPage),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              foregroundColor: AppColors.white),
                          child: const Text('Check Out')),
                    ),
                  ),
                  const SizedBox(height: 36),
                ],
              ),
            ),
          );
        } else if (state is CartError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

Widget _buildTotalAndSubTotalItem(
  BuildContext context,
  String title,
  double value,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: AppColors.grey),
        ),
        Text(
          '\$$value',
          style: Theme.of(context).textTheme.labelLarge,
        )
      ],
    ),
  );
}
