import 'package:e_commerce_app/models/product_category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/models/home_carousel_model.dart';
import 'package:e_commerce_app/models/product_item_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void getHomeData() {
    emit(HomeLoading());
    Future.delayed(const Duration(seconds: 2), () {
      emit(
        HomeLoaded(
          products: dummyProducts,
          carouselItems: dummyCarouselItems,
          categorys: listOfCategorys,
        ),
      );
    });
  }
}
