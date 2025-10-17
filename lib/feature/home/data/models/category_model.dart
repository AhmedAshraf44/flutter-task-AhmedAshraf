import '../../../../core/utils/assets.dart';

class CategoryModel {
  final String name;
  final String? image;
  final bool hasOffer;

  CategoryModel({required this.name, this.image, this.hasOffer = false});

  static final List<CategoryModel> categories = [
    CategoryModel(name: 'كل العروض'),
    CategoryModel(name: 'ملابس'),
    CategoryModel(name: 'إكسسوارات'),
    CategoryModel(name: 'الكترونيات'),
  ];

  static final List<CategoryModel> itemSelect = [
    CategoryModel(name: 'موضة رجال', image: Assets.imagesMen),
    CategoryModel(name: 'ساعات', image: Assets.imagesHours),
    CategoryModel(name: 'موبايلات', image: Assets.imagesPhone),
    CategoryModel(name: 'منتجات تجميل', image: Assets.imagesMakup),
    CategoryModel(name: 'موضة رجال', image: Assets.imagesMen),
  ];
}
