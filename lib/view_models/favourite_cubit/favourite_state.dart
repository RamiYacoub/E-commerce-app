part of 'favourite_cubit.dart';


sealed class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}

final class FavouriteLoading extends FavouriteState {}

final class QuantityCounterLoaded extends FavouriteState {
  final int value;
  final String productId;
  QuantityCounterLoaded({ required this.productId, required this.value});
}

final class FavouriteLoaded extends FavouriteState {
  final List<ProductItemModel> favouriteItems;

  FavouriteLoaded({required this.favouriteItems});
}

final class FavoriteError extends FavouriteState {
  final String message;
  FavoriteError({required this.message});
}