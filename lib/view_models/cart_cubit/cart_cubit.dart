import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/models/product_item_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void getCartItems() {
    emit(CartLoading());
    final cartItem =
        dummyProducts.where((item) => item.isAddedToCart == true).toList();
    final subTotal = cartItem.fold<double>(0, (sum, item) => sum + item.price);
    Future.delayed(const Duration(seconds: 1), () {
      emit(
        CartLoaded(
          cartItems: cartItem,
          subtotal: subTotal,
        ),
      );
    });
  }

  void removeFromCart(String productId) {
    emit(CartLoading());
    final index = dummyProducts.indexWhere((item) => item.id == productId);
    dummyProducts[index] = dummyProducts[index].copyWith(
      isAddedToCart: false,
    );
     final cartItem =
        dummyProducts.where((item) => item.isAddedToCart == true).toList();
    final subTotal = cartItem.fold<double>(0, (sum, item) => sum + item.price);
    Future.delayed(const Duration(seconds: 1), () {
      emit(CartLoaded(
        cartItems:cartItem,
        subtotal: subTotal,
      ));
    });
  }

  void increment(String prodcutId) {
    final index = dummyProducts.indexWhere((item) => item.id == prodcutId);
    dummyProducts[index] = dummyProducts[index].copyWith(
      quantity: dummyProducts[index].quantity + 1,
    );
    emit(
      QuantityCounterLoaded(
        value: dummyProducts[index].quantity,
        productId: prodcutId,
      ),
    );
  }

  void decrement(String prodcutId) {
    final index = dummyProducts.indexWhere((item) => item.id == prodcutId);
    int quantity = dummyProducts[index].quantity;
    if (quantity > 1) {
      dummyProducts[index] = dummyProducts[index].copyWith(
        quantity: dummyProducts[index].quantity - 1,
      );
      emit(
        QuantityCounterLoaded(
          value: dummyProducts[index].quantity,
          productId: prodcutId,
        ),
      );
    }
  }
}
