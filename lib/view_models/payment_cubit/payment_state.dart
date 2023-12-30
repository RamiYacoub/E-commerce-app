part of 'payment_cubit.dart';

class PaymentState {}

final class PaymentCubitInitial extends PaymentState {}

final class PaymentLoading extends PaymentState {}

final class PaymentLoaded extends PaymentState {
  final List<ProductItemModel> cartItems;
  PaymentLoaded ({
    required this.cartItems,
  });
}

final class PaymentError extends PaymentState {
  final String message;
  PaymentError ({
    required this. message,
  });
}