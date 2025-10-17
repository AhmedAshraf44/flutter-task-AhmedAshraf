import '../../../../core/utils/assets.dart';

class ProductModel {
  final int? id;
  final String imageUrl;
  final String name;
  final double price;
  final double oldPrice;
  final bool isFavorite;

  ProductModel({
    this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.isFavorite,
  });

  static List<ProductModel> productsList = [
    ProductModel(
      id: 1,
      imageUrl: Assets.imagesProduct1,
      name: 'جاكيت من الصوف مناسب',
      price: 32000000,
      oldPrice: 60.0,
      isFavorite: false,
    ),
    ProductModel(
      id: 2,
      imageUrl: Assets.imagesProduct2,
      name: 'جاكيت من الصوف مناسب ',
      price: 32000000,
      oldPrice: 60.0,
      isFavorite: false,
    ),
    ProductModel(
      id: 3,
      imageUrl: Assets.imagesProduct3,
      name: 'جاكيت من الصوف مناسب',
      price: 32000000,
      oldPrice: 60.0,
      isFavorite: false,
    ),
    ProductModel(
      id: 4,
      imageUrl: Assets.imagesProduct1,
      name: 'جاكيت من الصوف مناسب ',
      price: 32000000,
      oldPrice: 60.0,
      isFavorite: false,
    ),
    ProductModel(
      id: 5,
      imageUrl: Assets.imagesProduct3,
      name: 'جاكيت من الصوف مناسب',
      price: 32000000,
      oldPrice: 60.0,
      isFavorite: false,
    ),
    ProductModel(
      id: 6,
      imageUrl: Assets.imagesProduct1,
      name: 'جاكيت من الصوف مناسب ',
      price: 32000000,
      oldPrice: 60.0,
      isFavorite: false,
    ),
    ProductModel(
      id: 7,
      imageUrl: Assets.imagesProduct1,
      name: 'جاكيت من الصوف مناسب',
      price: 32000000,
      oldPrice: 60.0,
      isFavorite: false,
    ),
    ProductModel(
      id: 8,
      imageUrl: Assets.imagesProduct2,
      name: 'جاكيت من الصوف مناسب',
      price: 32000000,
      oldPrice: 60.0,
      isFavorite: false,
    ),
  ];
}
