import 'package:e_commerce_app/models/product_category_model.dart';
import 'package:e_commerce_app/utils/colors_app.dart';
import 'package:e_commerce_app/view_models/favourite_cubit/favourite_cubit.dart';
import 'package:e_commerce_app/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  late FavouriteCubit cubit;

  @override
  Widget build(BuildContext context) {
    cubit = BlocProvider.of<FavouriteCubit>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16.0,
            ),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(16)),
                hintText: 'Search somthing...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.filter_list),
              ),
            ),
          ),
          SizedBox(
            height: 80,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 8.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listOfCategorys.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(color: AppColors.grey),
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 8.0,
                            ),
                            child: Text(
                              listOfCategorys[index].name,
                              style: const TextStyle(
                                color: AppColors.grey,
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          ),
          BlocBuilder<FavouriteCubit, FavouriteState>(
            buildWhen: (previous, current) {
              return current is FavouriteLoaded;
            },
            bloc: cubit,
            builder: (context, state) {
              if (state is FavouriteLoading) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              } else if (state is FavouriteLoaded) {
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.favouriteItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 18,
                  ),
                  itemBuilder: (context, index) => ProductItem(
                    productItem: state.favouriteItems[index],
                    cubit: cubit,
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
