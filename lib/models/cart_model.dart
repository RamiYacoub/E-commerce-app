

import 'package:e_commerce_app/models/product_item_model.dart';

class CartItemModel {
  final String id;
  final ProductItemModel product;
  final ProductSize size;
  final int quantity;

  CartItemModel({
    required this.id,
    required this.product,
    required this.size,
    required this.quantity,
  });

  double get totalPrice => product.price * quantity;

  CartItemModel copyWith({
    String? id,
    ProductItemModel? product,
    ProductSize? size,
    int? quantity,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      product: product ?? this.product,
      size: size ?? this.size,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'product': product.toMap()});
    result.addAll({'size': size.name});
    result.addAll({'quantity': quantity});
  
    return result;
  }

  factory CartItemModel.fromMap(Map<String, dynamic> map, String documentId) {
    return CartItemModel(
      id: documentId,
      product: ProductItemModel.fromMap(map['product'], map['product']['id'] ?? ''),
      size: ProductSize.fromString(map['size']),
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }
}