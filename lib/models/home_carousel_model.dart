class HomeCarouselModel {
  final String id;
  final String imgUrl;

  HomeCarouselModel({
    required this.id,
    required this.imgUrl,
  });
}

List<HomeCarouselModel> dummyCarouselItems = [
  HomeCarouselModel(
    id: '1',
    imgUrl:
        'https://cssslider.com/sliders/demo-17/data1/images/picjumbo.com_img_5948.jpg',
  ),
  HomeCarouselModel(
    id: '2',
    imgUrl:
        'https://cssslider.com/sliders/demo-17/data1/images/picjumbo.com_hnck0391.jpg',
  ),
  HomeCarouselModel(
    id: '3',
    imgUrl:
        'https://cssslider.com/sliders/demo-17/data1/images/picjumbo.com_hanv9909.jpg',
  ),
  HomeCarouselModel(
    id: '4',
    imgUrl:
        'https://cssslider.com/sliders/demo-17/data1/images/picjumbo.com_img_6122.jpg',
  ),
];
