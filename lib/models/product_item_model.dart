class ProductItemModel {
  final String id;
  final String name;
  final String imgUrl;
  final bool isFavorite;
  final String description;
  final double price;
  final String category;

  ProductItemModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    this.isFavorite = false,
    this.description =
        'dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy dummy ',
    required this.price,
    required this.category,
  });
}

List<ProductItemModel> dummyProducts = [
  ProductItemModel(
    id: '1',
    name: 'name1',
    imgUrl:
        'https://freepngimg.com/thumb/nike/28258-8-nike-logo-transparent-background.png',
    price: 8.1,
    category: 'clothes',
  ),
  ProductItemModel(
    id: '2',
    name: 'name2',
    imgUrl:
        'https://freepngimg.com/thumb/nike/28258-8-nike-logo-transparent-background.png',
    price: 8.2,
    category: 'clothes',
  ),
  ProductItemModel(
    id: '3',
    name: 'name3',
    imgUrl:
        'https://freepngimg.com/thumb/nike/28258-8-nike-logo-transparent-background.png',
    price: 8.3,
    category: 'clothes',
  ),
  ProductItemModel(
    id: '4',
    name: 'name4',
    imgUrl:
        'https://freepngimg.com/thumb/nike/28258-8-nike-logo-transparent-background.png',
    price: 8.4,
    category: 'clothes',
  ),
  ProductItemModel(
    id: '5',
    name: 'name5',
    imgUrl:
        'https://freepngimg.com/thumb/nike/28258-8-nike-logo-transparent-background.png',
    price: 8.5,
    category: 'clothes',
  ),
  ProductItemModel(
    id: '6',
    name: 'name6',
    imgUrl:
        'https://freepngimg.com/thumb/nike/28258-8-nike-logo-transparent-background.png',
    price: 8.6,
    category: 'clothes',
  ),
];
