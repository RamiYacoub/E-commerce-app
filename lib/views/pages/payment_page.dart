import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/utils/app_routes.dart';
import 'package:e_commerce_app/utils/colors_app.dart';
import 'package:e_commerce_app/view_models/payment_cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Payment'),
          centerTitle: true,
        ),
        body: BlocBuilder<PaymentCubit, PaymentState>(
            bloc: BlocProvider.of<PaymentCubit>(context),
            builder: (context, state) {
              if (state is PaymentLoading) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              } // Center
              else if (state is PaymentLoaded) {
                return SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(children: [
                    buildInlineHeadlines(
                        context: context, title: 'Address', onTap: () {}),
                    const SizedBox(height: 8.0),
                    InkWell(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true)
                            .pushNamed(AppRoutes.locationPage);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          color: AppColors.grey.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: const Center(child: Text('Add Address')),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    buildInlineHeadlines(
                        context: context,
                        title: 'Products',
                        productsNumbers: state.cartItems.length),
                    const SizedBox(height: 8.0),
                    ListView.builder(
                        itemCount: state.cartItems.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final item = state.cartItems[index];
                          return Row(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 100,
                                width: 100,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16.0),
                                  child: CachedNetworkImage(
                                    imageUrl: item.imgUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Column(children: [
                              Text(item.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                              const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [])
                            ]),
                          ]);
                        }),
                    buildInlineHeadlines(
                        context: context, title: 'Payment Method')
                  ]),
                ));
              } else if (state is PaymentError) {
                return Center(
                  child: Text(state.message),
                );
              } else {
                return const Center(
                  child: Text('Something went wrong!'),
                );
              }
            }));
  }

  Widget buildInlineHeadlines(
      {required BuildContext context,
      required String title,
      int? productsNumbers,
      VoidCallback? onTap}) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        if (productsNumbers != null)
          Text(
            '($productsNumbers)',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
      ]),
      if (onTap != null)
        TextButton(
          onPressed: onTap,
          child: Text(
            'Edit',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
        ),
    ]);
  }
}
