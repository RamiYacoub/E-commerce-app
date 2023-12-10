import 'package:flutter_bloc/flutter_bloc.dart';

part 'quantity_state.dart';

class QuantityCubit extends Cubit<QuantityState> {
  QuantityCubit() : super(QuantityState(quantity: 1));
  void increment() => emit(
        QuantityState(quantity: state.quantity + 1),
      );

  void decrement() {
    if (state.quantity > 1) {
      emit(
        QuantityState(quantity: state.quantity - 1),
      );
    }
  }
}
