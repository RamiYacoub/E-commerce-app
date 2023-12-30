import 'package:e_commerce_app/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentCubitInitial());
  void getPaymentViewData() {
    emit(PaymentLoading());
    final cartItems =
        dummyProducts.where((item) => item.isAddedToCart == true).toList();
    Future.delayed(const Duration(seconds: 1), () {
      emit(PaymentLoaded(cartItems: cartItems));
    });
  }
}
