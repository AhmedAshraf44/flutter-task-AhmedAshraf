import 'package:flutter/material.dart';
import 'package:flutter_task/core/color/app_colors.dart';
import 'package:flutter_task/core/utils/assets.dart';
import 'package:intl/intl.dart';

import '../../../../../core/style/app_styles.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,###');
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.kTextPrimary,
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 12),

                    Text(
                      'أختر الباقات اللي تناسبك',
                      style: AppStyles.textStyle24Medium,
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  'أختار من باقات التمييز بل أسفل اللى تناسب أحتياجاتك',
                  style: AppStyles.textStyle14Regular.copyWith(
                    color: AppColors.kTextPrimary.withValues(alpha: 0.5),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              itemCount: packages.length,
              itemBuilder: (context, index) {
                final package = packages[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: PackageCard(
                    package: package,
                    formattedPrice: formatter.format(package.price),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class PackageCard extends StatelessWidget {
  const PackageCard({
    super.key,
    required this.package,
    required this.formattedPrice,
  });

  final PackageModel package;
  final String formattedPrice;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.kTextWhite,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black.withValues(alpha: .1)),
            boxShadow: [
              BoxShadow(
                color: AppColors.kTextPrimary.withValues(alpha: .04),
                blurRadius: 5,
                spreadRadius: 0,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        package.isSelected
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: package.isSelected
                            ? AppColors.kTextQuaternary
                            : AppColors.kTextPrimary,
                      ),
                      const SizedBox(width: 4),
                      Center(
                        child: Text(
                          package.name,
                          style: AppStyles.textStyle16Bold.copyWith(
                            color: package.isSelected
                                ? AppColors.kTextQuaternary
                                : AppColors.kTextPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '$formattedPriceج.م ',
                    style: TextStyle(
                      inherit: false,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kTextSecondary,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.kTextSecondary,
                      decorationThickness: 2,
                    ),
                  ),
                ],
              ),
              Divider(color: Colors.black.withValues(alpha: 0.1), height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        package.features.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 6, top: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image.asset(
                                  package.features[index].image ?? '',
                                  height: 28,
                                  width: 28,
                                ),
                              ),
                              SizedBox(width: 8),
                              package.features[index].stickyDurationHours ==
                                          null ||
                                      package
                                              .features[index]
                                              .stickyDurationHours ==
                                          ''
                                  ? Expanded(
                                      child: Text(
                                        '${package.features[index].title}',
                                        style: AppStyles.textStyle14Medium,
                                      ),
                                    )
                                  : Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${package.features[index].title}',
                                            style: AppStyles.textStyle14Medium,
                                          ),

                                          Text(
                                            '${package.features[index].stickyDurationHours}',
                                            style: AppStyles.textStyle14Medium
                                                .copyWith(
                                                  color: const Color(
                                                    0xffFF4144,
                                                  ),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (package.isSelectednumberOfViews)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 120 / 2,
                              decoration: BoxDecoration(
                                color: AppColors.kTextGreen.withValues(
                                  alpha: 0.05,
                                ),
                                border: Border(
                                  top: BorderSide(color: AppColors.kTextGreen),
                                  left: BorderSide(color: AppColors.kTextGreen),
                                  right: BorderSide(
                                    color: AppColors.kTextGreen,
                                  ),
                                  bottom: (BorderSide.none),
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(55),
                                  topRight: Radius.circular(55),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                package.numberOfViews,
                                style: AppStyles.textStyle16Bold.copyWith(
                                  color: AppColors.kTextGreen,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 4),

                        Text(
                          'ضعف عدد\nالمشاهدات',
                          textAlign: TextAlign.center,
                          style: AppStyles.textStyle12Regular.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.kTextPrimary,
                            decorationThickness: 2,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
        if (package.isBestValue)
          Positioned(
            top: -5,
            right: 8,
            child: SizedBox(
              // width: 200,
              height: 50,

              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    height: 35,
                    margin: EdgeInsets.only(left: 10 - 1),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFEE8E8),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 8,
                        left: 30,
                        top: 8,
                        bottom: 8,
                      ),
                      child: Text(
                        package.bestValue ?? '',
                        style: AppStyles.textStyle12Medium.copyWith(
                          color: Color(0xffFF4144),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -8,
                    bottom: 11,
                    child: Transform.rotate(
                      angle: 45 * 3.14159 / 180,
                      child: Container(
                        width: 14 * 2,
                        height: 14 * 2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //  Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            //   decoration: BoxDecoration(
            //     color: const Color(0xffffebee),
            //     borderRadius: BorderRadius.circular(4),
            //   ),
            //   child: const Text(
            //     'أفضل قيمة مقابل سعر',
            //     style: TextStyle(
            //       color: Color(0xffFF4144),
            //       fontSize: 11,
            //       fontWeight: FontWeight.w600,
            //     ),
            //   ),
            // ),
          ),
      ],
    );
  }
}

class PackageModel {
  final String name;
  final double price;

  final List<PackageItemModel> features;
  final bool isSelected;
  final bool isBestValue;
  final String? bestValue;
  final String numberOfViews;
  final bool isSelectednumberOfViews;

  PackageModel({
    required this.name,
    required this.price,
    required this.features,
    required this.numberOfViews,
    this.bestValue,
    this.isSelectednumberOfViews = false,
    this.isSelected = false,
    this.isBestValue = false,
  });
}

final List<PackageModel> packages = [
  PackageModel(
    name: 'أساسية',
    price: 3000,

    features: [
      PackageItemModel(
        title: 'صلاحية الأعلان 30 يوم',
        image: Assets.imagesAcute,
        stickyDurationHours: '',
      ),
    ],
    numberOfViews: '7',
    bestValue: '',
  ),
  PackageModel(
    name: 'إكسترا',
    price: 3000,

    features: [
      PackageItemModel(
        title: 'صلاحية الأعلان 30 يوم',
        image: Assets.imagesAcute,
        stickyDurationHours: '',
      ),
      PackageItemModel(
        title: 'رفع إعلانين كل 3 أيام',
        image: Assets.imagesRocket,
        stickyDurationHours: '',
      ),
      PackageItemModel(
        title: 'تثبيت فى مقاول صحى',
        image: Assets.imagesKeep,
        stickyDurationHours: '( خلال ال48 ساعة القادمة )',
      ),
    ],
    isSelected: true,
    numberOfViews: '7',
    isSelectednumberOfViews: true,
    bestValue: '',
  ),
  PackageModel(
    name: 'بلس',
    price: 3000,

    features: [
      PackageItemModel(
        title: 'صلاحية الأعلان 30 يوم',
        image: Assets.imagesAcute,
        stickyDurationHours: '',
      ),
      PackageItemModel(
        title: 'رفع إعلانين كل 3 أيام',
        image: Assets.imagesRocket,
        stickyDurationHours: '',
      ),
      PackageItemModel(
        title: 'تثبيت فى مقاول صحى',
        image: Assets.imagesKeep,
        stickyDurationHours: '( خلال ال48 ساعة القادمة )',
      ),
      PackageItemModel(
        title: 'ظهور فى كل محافظات مصر',
        image: Assets.imagesGlobe,
        stickyDurationHours: '',
      ),
      PackageItemModel(
        title: 'أعلان مميز',
        image: Assets.imagesWorkspacePremium,
        stickyDurationHours: '',
      ),
      PackageItemModel(
        title: 'تثبيت فى مقاول صحى فى الجهراء',
        image: Assets.imagesKeep,
        stickyDurationHours: '',
      ),
      PackageItemModel(
        title: 'تثبيت فى مقاول صحى',
        image: Assets.imagesKeep,
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
    name: 'سوبر',
    price: 3000,
    features: [
      PackageItemModel(
        title: 'صلاحية الأعلان 30 يوم',
        image: Assets.imagesAcute,
        stickyDurationHours: '',
      ),
      PackageItemModel(
        title: 'رفع إعلانين كل 3 أيام',
        image: Assets.imagesRocket,
        stickyDurationHours: '',
      ),
      PackageItemModel(
        title: 'تثبيت فى مقاول صحى',
        image: Assets.imagesKeep,
        stickyDurationHours: '( خلال ال48 ساعة القادمة )',
      ),
      PackageItemModel(
        title: 'ظهور فى كل محافظات مصر',
        image: Assets.imagesGlobe,
        stickyDurationHours: '',
      ),
      PackageItemModel(
        title: 'أعلان مميز',
        image: Assets.imagesWorkspacePremium,
        stickyDurationHours: '',
      ),
      PackageItemModel(
        title: 'تثبيت فى مقاول صحى فى الجهراء',
        image: Assets.imagesKeep,
        stickyDurationHours: '',
      ),
      PackageItemModel(
        title: 'تثبيت فى مقاول صحى',
        image: Assets.imagesKeep,
        stickyDurationHours: '( خلال ال48 ساعة القادمة )',
      ),
    ],
    numberOfViews: '24',
    isSelectednumberOfViews: true,
    bestValue: 'أعلى مشاهدات',
    isBestValue: true,
  ),
];

class PackageItemModel {
  final String? title;
  final String? image;
  final String? stickyDurationHours;

  PackageItemModel({
    required this.title,
    required this.image,
    required this.stickyDurationHours,
  });
}
