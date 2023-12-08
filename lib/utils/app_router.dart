import 'package:e_commerce_app/models/product_item_model.dart';
import 'package:e_commerce_app/utils/app_routes.dart';
import 'package:e_commerce_app/views/pages/custom_bottom_navbar.dart';
import 'package:e_commerce_app/views/pages/product_details_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.productDetails:
        final ProductItemModel productDetailsArguments =
            settings.arguments as ProductItemModel;
        return MaterialPageRoute(
          builder: (_) => ProductDetailsPage(
            productItem: productDetailsArguments,
          ),
          settings: settings,
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const CustomBottomNavbar(),
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
