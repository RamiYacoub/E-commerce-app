import 'package:e_commerce_app/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_details_state.dart';


class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(const ProductDetailsInitial());
  void getProductDetails(int index) {
    emit(const ProductDetailsLoading());
    int quantity = 1;
    dummyProducts[index] = dummyProducts[index].copyWith(quantity: quantity);
    Future.delayed(const Duration(seconds: 2), () {
      emit(
        ProductDetailsLoaded(
          productItem: dummyProducts[index], 
        ),
      );
    });
  }

  void increment(int index){
    int quantity = dummyProducts[index].quantity + 1;
    double price = dummyProducts[index].price * quantity;

    dummyProducts[index] = dummyProducts[index].copyWith(quantity: quantity, quantityPrice: price);
    emit(ProductDetailsLoaded(productItem: dummyProducts[index]));
  }

  void decrement(int index) {
    int quantity = dummyProducts[index].quantity - 1;
    double price = dummyProducts[index].price * quantity;

    if (quantity >= 1) {
      dummyProducts[index] = dummyProducts[index].copyWith(quantity: quantity, quantityPrice: price);
      emit(ProductDetailsLoaded(productItem: dummyProducts[index]));
    }
  }

  void changeFavorite(String prodcutId){
    int index = dummyProducts.indexWhere((element) => element.id == prodcutId,);
    dummyProducts[index] = dummyProducts[index].copyWith(isFavorite: !dummyProducts[index].isFavorite);
    emit(ProductDetailsLoaded(productItem: dummyProducts[index]));
  }
}