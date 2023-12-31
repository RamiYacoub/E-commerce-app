import 'package:e_commerce_app/models/location_model.dart';
import 'package:e_commerce_app/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentCubitInitial());
  void getPaymentViewData() {
    emit(PaymentLoading());
    final cartItems =
        dummyProducts.where((item) => item.isAddedToCart == true).toList();
    final subTotal = cartItems.fold<double>(0, (sum, item) => sum + item.price);
    Future.delayed(const Duration(seconds: 1), () {
      emit(PaymentLoaded(
          cartItems: cartItems,
          total: subTotal + 10,
          locations: listOfLocations));
    });
  }

  void setLocateWithPay(int index) {
    final cartItems =
        dummyProducts.where((item) => item.isAddedToCart == true).toList();
    final subTotal = cartItems.fold<double>(0, (sum, item) => sum + item.price);
    LocationModel locationModel =
        listOfLocations[index].copyWith(isSelected: true);
    listOfLocations[index] = locationModel;
    Future.delayed(const Duration(seconds: 1), () {
      emit(PaymentLoaded(
          cartItems: cartItems, total: subTotal, locations: listOfLocations));
    });
  }

  void unSetLocateWithPay(int index) {
    final cartItems =
        dummyProducts.where((item) => item.isAddedToCart == true).toList();
    final subTotal = cartItems.fold<double>(0, (sum, item) => sum + item.price);
    LocationModel locationModel =
        listOfLocations[index].copyWith(isSelected: false);
    listOfLocations[index] = locationModel;
    emit(PaymentLoaded(
        cartItems: cartItems, total: subTotal, locations: listOfLocations));
  }

  void choosePaymentMethod(String paymentMethodId) {
    emit(PaymentMethodChosen(paymentMethodId: paymentMethodId),);
  }
}
