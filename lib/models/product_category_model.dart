class ProductCategorysModel {
  final String id;
  final String name;
  final int number;
  final String imgUrl;

  ProductCategorysModel(
      {required this.id,
      required this.name,
      required this.number,
      required this.imgUrl});
}

List<ProductCategorysModel> listOfCategorys = [
  ProductCategorysModel(
    id: '1',
    name: 'All',
    number: 1,
    imgUrl: 'https://freepngimg.com/thumb/nike/28258-8-nike-logo-transparent-background.png',
  ),
  ProductCategorysModel(
    id: '2',
    name: 'Latest',
    number: 2,
    imgUrl: 'https://freepngimg.com/thumb/nike/28258-8-nike-logo-transparent-background.png',
  ),
  ProductCategorysModel(
    id: '3',
    name: 'Most Popular',
    number: 3,
    imgUrl: 'https://freepngimg.com/thumb/nike/28258-8-nike-logo-transparent-background.png',
  ),
  ProductCategorysModel(
    id: '4',
    name: 'Cheapest',
    number: 4,
    imgUrl: 'https://freepngimg.com/thumb/nike/28258-8-nike-logo-transparent-background.png',
  ),
  ProductCategorysModel(
    id: '5',
    name: 'Hot',
    number: 5,
    imgUrl: 'https://freepngimg.com/thumb/nike/28258-8-nike-logo-transparent-background.png',
  ),
  ProductCategorysModel(
    id: '6',
    name: 'New',
    number: 6,
    imgUrl: 'https://freepngimg.com/thumb/nike/28258-8-nike-logo-transparent-background.png',
  ),
];
