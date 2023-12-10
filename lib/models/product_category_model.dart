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
    name: 'category1',
    number: 1,
    imgUrl: 'https://freepngimg.com/thumb/nike/28258-8-nike-logo-transparent-background.png',
  ),
  ProductCategorysModel(
    id: '2',
    name: 'category2',
    number: 2,
    imgUrl: 'https://freepngimg.com/thumb/nike/28258-8-nike-logo-transparent-background.png',
  ),
  ProductCategorysModel(
    id: '3',
    name: 'category3',
    number: 3,
    imgUrl: 'https://freepngimg.com/thumb/nike/28258-8-nike-logo-transparent-background.png',
  ),
  ProductCategorysModel(
    id: '4',
    name: 'category4',
    number: 4,
    imgUrl: 'https://freepngimg.com/thumb/nike/28258-8-nike-logo-transparent-background.png',
  ),
  ProductCategorysModel(
    id: '5',
    name: 'category5',
    number: 5,
    imgUrl: 'https://freepngimg.com/thumb/nike/28258-8-nike-logo-transparent-background.png',
  ),
  ProductCategorysModel(
    id: '6',
    name: 'category6',
    number: 6,
    imgUrl: 'https://freepngimg.com/thumb/nike/28258-8-nike-logo-transparent-background.png',
  ),
];
