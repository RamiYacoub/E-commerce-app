enum ProductSize {
  S,
  M,
  L,
  // ignore: constant_identifier_names
  XL;

  factory ProductSize.fromString(String size) {
    return ProductSize.values.firstWhere((element) => element.name == size);
  }
}

class ProductItemModel {
  final String id;
  final String name;
  final String imgUrl;
  final bool isFavorite;
  final String description;
  final double price;
  final String category;
  final int quantity;
  final ProductSize? size;
  final bool isAddedToCart;
  final double averageRate;
  final double quantityPrice;

  const ProductItemModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    this.isFavorite = false,
    this.description =
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry.',
    required this.price,
    required this.category,
    this.quantity = 0,
    this.size,
    this.isAddedToCart = false,
    this.averageRate = 0.0,
    this.quantityPrice = 0.0,
  });

  ProductItemModel copyWith({
    String? id,
    String? name,
    String? imgUrl,
    bool? isFavorite,
    String? description,
    double? price,
    String? category,
    int? quantity,
    ProductSize? size,
    bool? isAddedToCart,
    double? averageRate,
    double? quantityPrice,
  }) {
    return ProductItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imgUrl: imgUrl ?? this.imgUrl,
      isFavorite: isFavorite ?? this.isFavorite,
      description: description ?? this.description,
      price: price ?? this.price,
      category: category ?? this.category,
      quantity: quantity ?? this.quantity,
      size: size ?? this.size,
      isAddedToCart: isAddedToCart ?? this.isAddedToCart,
      averageRate: averageRate ?? this.averageRate,
      quantityPrice: quantityPrice ?? this.quantityPrice,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'imgUrl': imgUrl});
    result.addAll({'isFavorite': isFavorite});
    result.addAll({'description': description});
    result.addAll({'price': price});
    result.addAll({'category': category});
    result.addAll({'quantity': quantity});
    result.addAll({'averageRate': averageRate});
    if (size != null) {
      result.addAll({'size': size!.name});
    }
    result.addAll({'isAddedToCart': isAddedToCart});
    result.addAll({'quantityPrice': quantityPrice});

    return result;
  }

  factory ProductItemModel.fromMap(
      Map<String, dynamic> data, String documentId) {
    return ProductItemModel(
      id: documentId,
      name: data['name'] ?? '',
      imgUrl: data['imgUrl'] ?? '',
      isFavorite: data['isFavorite'] ?? false,
      description: data['description'] ?? '',
      price: data['price']?.toDouble() ?? 0.0,
      category: data['category'] ?? '',
      quantity: data['quantity']?.toInt() ?? 0,
      size: data['size'] != null ? ProductSize.fromString(data['size']) : null,
      isAddedToCart: data['isAddedToCart'] ?? false,
      averageRate: data['averageRate'] ?? 0.0,
      quantityPrice: data['quantityPrice'] ?? 0.0,
    );
  }

  @override
  String toString() {
    return 'ProductItemModel(id: $id, name: $name, imgUrl: $imgUrl, isFavorite: $isFavorite, description: $description, price: $price, category: $category, quantity: $quantity, size: $size, isAddedToCart: $isAddedToCart, quantityPrice:$quantityPrice)';
  }
}

List<ProductItemModel> dummyProducts = [
  const ProductItemModel(
    id: 'AnRGQgbluRRfIsVCfRZU',
    name: 'Pack of Potatoes',
    imgUrl: 'https://pngimg.com/d/potato_png2398.png',
    price: 10,
    category: 'Groceries',
    isAddedToCart: true,
    quantity: 5,
    size: ProductSize.M,
  ),
  const ProductItemModel(
    id: '3RCFbH0YzNO9r5WWMDlt',
    name: 'Pack of Onions',
    imgUrl: 'https://pngimg.com/d/onion_PNG99213.png',
    price: 10,
    category: 'Groceries',
    size: ProductSize.M,
  ),
  const ProductItemModel(
    id: 'oI1O8SI2Y9Oou4BB7FBE',
    name: 'Pack of Apples',
    imgUrl: 'https://pngfre.com/wp-content/uploads/apple-43-1024x1015.png',
    price: 10,
    category: 'Fruits',
    size: ProductSize.M,
  ),
  const ProductItemModel(
    id: 'poohR3IUcGSh39qef5D4',
    name: 'Pack of Oranges',
    imgUrl:
        'https://parspng.com/wp-content/uploads/2022/05/orangepng.parspng.com_-1.png',
    price: 10,
    category: 'Fruits',
    size: ProductSize.M,
  ),
  const ProductItemModel(
    id: '8e0vTogfe65seQhH1MCh',
    name: 'Pack of Bananas',
    imgUrl:
        'https://static.vecteezy.com/system/resources/previews/015/100/096/original/bananas-transparent-background-free-png.png',
    price: 10,
    category: 'Fruits',
    size: ProductSize.M,
  ),
  const ProductItemModel(
    id: 'Ms6gJsoejYd3H4LTjbYO',
    name: 'Pack of Mangoes',
    imgUrl: 'https://purepng.com/public/uploads/large/mango-tgy.png',
    price: 10,
    category: 'Fruits',
    size: ProductSize.M,
  ),
  const ProductItemModel(
    id: 'gICo8QELkuwehmNlt8G6',
    name: 'Sweet Shirt',
    imgUrl:
        'https://www.usherbrand.com/cdn/shop/products/5uYjJeWpde9urtZyWKwFK4GHS6S3thwKRuYaMRph7bBDyqSZwZ_87x1mq24b2e7_1800x1800.png',
    price: 15,
    category: 'Clothes',
    size: ProductSize.M,
  ),
];
