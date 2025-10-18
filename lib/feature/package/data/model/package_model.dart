import '../../../../core/utils/assets.dart';
import 'package_feature_model.dart';

class PackageModel {
  final int? id;
  final String name;
  final double price;

  final List<PackageFeatureModel> features;
  final bool isSelected;
  final bool isBestValue;
  final String? bestValue;
  final String numberOfViews;
  final bool isSelectednumberOfViews;

  PackageModel({
    this.id,
    required this.name,
    required this.price,
    required this.features,
    required this.numberOfViews,
    this.bestValue,
    this.isSelectednumberOfViews = false,
    this.isSelected = false,
    this.isBestValue = false,
  });

  static List<PackageModel> packages = [
    PackageModel(
      id: 1,
      name: 'أساسية',
      price: 3000,
      features: [
        PackageFeatureModel(
          title: 'صلاحية الأعلان 30 يوم',
          image: Assets.imagesPackageImageAcute,
          stickyDurationHours: '',
        ),
      ],
      numberOfViews: '7',
      bestValue: '',
    ),
    PackageModel(
      id: 2,
      name: 'أكسترا',
      price: 3000,

      features: [
        PackageFeatureModel(
          title: 'صلاحية الأعلان 30 يوم',
          image: Assets.imagesPackageImageAcute,
          stickyDurationHours: '',
        ),
        PackageFeatureModel(
          title: 'رفع لأعلى القائمة كل 3 أيام',
          image: Assets.imagesPackageImageRocket,
          stickyDurationHours: '',
        ),
        PackageFeatureModel(
          title: 'تثبيت فى مقاول صحى',
          image: Assets.imagesPackageImageKeep,
          stickyDurationHours: '( خلال ال48 ساعة القادمة )',
        ),
      ],
      isSelected: true,
      numberOfViews: '7',
      isSelectednumberOfViews: true,
      bestValue: '',
    ),
    PackageModel(
      id: 3,
      name: 'بلس',
      price: 3000,

      features: [
        PackageFeatureModel(
          title: 'صلاحية الأعلان 30 يوم',
          image: Assets.imagesPackageImageAcute,
          stickyDurationHours: '',
        ),
        PackageFeatureModel(
          title: 'رفع لأعلى القائمة كل 2 يوم',
          image: Assets.imagesPackageImageRocket,
          stickyDurationHours: '',
        ),
        PackageFeatureModel(
          title: 'تثبيت فى مقاول صحى',
          image: Assets.imagesPackageImageKeep,
          stickyDurationHours: '( خلال ال48 ساعة القادمة )',
        ),
        PackageFeatureModel(
          title: 'ظهور فى كل محافظات مصر',
          image: Assets.imagesPackageImageGlobe,
          stickyDurationHours: '',
        ),
        PackageFeatureModel(
          title: 'أعلان مميز',
          image: Assets.imagesPackageImageWorkspacePremium,
          stickyDurationHours: '',
        ),
        PackageFeatureModel(
          title: 'تثبيت فى مقاول صحى فى الجهراء',
          image: Assets.imagesPackageImageKeep,
          stickyDurationHours: '',
        ),
        PackageFeatureModel(
          title: 'تثبيت فى مقاول صحى',
          image: Assets.imagesPackageImageKeep,
          stickyDurationHours: '( خلال ال48 ساعة القادمة )',
        ),
      ],
      numberOfViews: '18',
      isSelected: true,
      isSelectednumberOfViews: true,
      bestValue: 'أفضل قيمة مقابل سعر',
      isBestValue: true,
    ),
    PackageModel(
      id: 4,
      name: 'سوبر',
      price: 3000,
      features: [
        PackageFeatureModel(
          title: 'صلاحية الأعلان 30 يوم',
          image: Assets.imagesPackageImageAcute,
          stickyDurationHours: '',
        ),
        PackageFeatureModel(
          title: 'رفع لأعلى القائمة كل 2 يوم',
          image: Assets.imagesPackageImageRocket,
          stickyDurationHours: '',
        ),
        PackageFeatureModel(
          title: 'تثبيت فى مقاول صحى',
          image: Assets.imagesPackageImageKeep,
          stickyDurationHours: '( خلال ال48 ساعة القادمة )',
        ),
        PackageFeatureModel(
          title: 'ظهور فى كل محافظات مصر',
          image: Assets.imagesPackageImageGlobe,
          stickyDurationHours: '',
        ),
        PackageFeatureModel(
          title: 'أعلان مميز',
          image: Assets.imagesPackageImageWorkspacePremium,
          stickyDurationHours: '',
        ),
        PackageFeatureModel(
          title: 'تثبيت فى مقاول صحى فى الجهراء',
          image: Assets.imagesPackageImageKeep,
          stickyDurationHours: '',
        ),
        PackageFeatureModel(
          title: 'تثبيت فى مقاول صحى',
          image: Assets.imagesPackageImageKeep,
          stickyDurationHours: '( خلال ال48 ساعة القادمة )',
        ),
      ],
      numberOfViews: '24',
      isSelectednumberOfViews: true,
      bestValue: 'أعلى مشاهدات',
      isBestValue: true,
    ),
  ];
}
