import 'package:e_commerce_app/utils/app_routes.dart';
import 'package:e_commerce_app/view_models/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/view_models/product_cubit/product_details_cubit.dart';
import 'package:e_commerce_app/view_models/search_cubit/search_cubit.dart';
import 'package:e_commerce_app/views/pages/cart_page.dart';
import 'package:e_commerce_app/views/pages/custom_bottom_navbar.dart';
import 'package:e_commerce_app/views/pages/my_orders_page.dart';
import 'package:e_commerce_app/views/pages/product_details_page.dart';
import 'package:e_commerce_app/views/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.productDetails:
        final int index = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final cubit = ProductDetailsCubit();
              cubit.getProductDetails(index);
              return cubit;
            },
            child: ProductDetailsPage(
              index: index,
            ),
          ),
          settings: settings,
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const CustomBottomNavbar(),
          settings: settings,
        );

      case AppRoutes.searchPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_){
              final cubit = SearchCubit();
              cubit.getSearchData();
              return cubit;
            },
            child: const SearchPage(),
          ),
          settings: settings,
        );
      
      case AppRoutes.cartPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_){
              final cubit = CartCubit();
              cubit.getCartItems();
              return cubit;
            },
            child: const CartPage(),
          ),
          settings: settings,
        );

      case AppRoutes.myOrders:
        return MaterialPageRoute(
          builder: (_) => const MyOrdersPage(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Error Page!'),
            ),
          ),
          settings: settings,
        );
    }
  }
}