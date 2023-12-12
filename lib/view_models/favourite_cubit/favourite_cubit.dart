import 'package:e_commerce_app/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());

  void getFavoriteItems() {
    emit(FavouriteLoading());
    Future.delayed(const Duration(seconds: 1), () {
      emit(FavouriteLoaded(
          favouriteItems:
              dummyProducts.where((item) => item.isFavorite == true).toList()));
    });
  }

  void removeFromFavourite(String productId) {
    final index = dummyProducts.indexWhere((item) => item.id == productId);
    dummyProducts[index] = dummyProducts[index].copyWith(
      isFavorite: false,
    );
    emit(FavouriteLoaded(
      favouriteItems:
          dummyProducts.where((item) => item.isFavorite == true).toList(),
    ));
  }
}
