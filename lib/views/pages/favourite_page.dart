import 'package:e_commerce_app/models/product_category_model.dart';
import 'package:e_commerce_app/models/product_item_model.dart';
import 'package:e_commerce_app/utils/colors_app.dart';
import 'package:e_commerce_app/views/widgets/product_item.dart';
import 'package:flutter/material.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
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
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: dummyProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
            ),
            itemBuilder: (context, index) => ProductItem(
              productItem: dummyProducts[index],
            ),
          ),
        ],
      ),
    );
  }
}
