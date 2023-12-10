import 'package:e_commerce_app/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(const ProductDetailsInitial());
  void getProductDetails(int index) {
    emit(const ProductDetailsLoading());
    Future.delayed(const Duration(seconds: 2), () {
      emit(
        ProductDetailsLoaded(
          productItem: dummyProducts[index],
        ),
      );
    });
  }

  void increment() => emit(
        ProductDetailsState(quantity: state.quantity + 1),
      );

  void decrement() {
    if (state.quantity > 1) {
      emit(
        ProductDetailsState(quantity: state.quantity - 1),
      );
    }
  }
}
