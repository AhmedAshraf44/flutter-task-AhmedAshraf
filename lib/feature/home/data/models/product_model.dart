import '../../../../core/utils/assets.dart';

class ProductModel {
  final String imageUrl;
  final String name;
  final double price;
  final double oldPrice;

  ProductModel({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.oldPrice,
  });

  static List<ProductModel> productsList = [
    ProductModel(
      imageUrl: Assets.imagesProduct1,
      name: 'جاكيت من الصوف مناسب',
      price: 32000000,
      oldPrice: 60.0,
    ),
    ProductModel(
      imageUrl: Assets.imagesProduct2,
      name: 'جاكيت من الصوف مناسب ',
      price: 32000000,
      oldPrice: 60.0,
    ),
    ProductModel(
      imageUrl: Assets.imagesProduct3,
      name: 'جاكيت من الصوف مناسب',
      price: 32000000,
      oldPrice: 60.0,
    ),
    ProductModel(
      imageUrl: Assets.imagesProduct1,
      name: 'جاكيت من الصوف مناسب ',
      price: 32000000,
      oldPrice: 60.0,
    ),
    ProductModel(
      imageUrl: Assets.imagesProduct3,
      name: 'جاكيت من الصوف مناسب',
      price: 32000000,
      oldPrice: 60.0,
    ),
    ProductModel(
      imageUrl: Assets.imagesProduct1,
      name: 'جاكيت من الصوف مناسب ',
      price: 32000000,
      oldPrice: 60.0,
    ),
    ProductModel(
      imageUrl: Assets.imagesProduct1,
      name: 'جاكيت من الصوف مناسب',
      price: 32000000,
      oldPrice: 60.0,
    ),
    ProductModel(
      imageUrl: Assets.imagesProduct2,
      name: 'جاكيت من الصوف مناسب',
      price: 110,
      oldPrice: 60.0,
    ),
  ];
}
