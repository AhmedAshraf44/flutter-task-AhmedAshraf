import 'package:flutter/material.dart';
import 'package:flutter_task/feature/home/presentation/view/widget/build_free_shipping_note.dart';
import 'package:flutter_task/feature/home/presentation/view/widget/build_app_bar_home.dart';
import 'package:flutter_task/feature/home/presentation/view/widget/product_grid_sliver.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routers/app_routes.dart';
import '../../../data/models/product_model.dart';
import 'build_offer_category_list.dart';
import 'build_offer_selection_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: 47)),
        SliverToBoxAdapter(
          child: BuildAppBarHome(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kFilteringView);
            },
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 12)),
        SliverToBoxAdapter(child: BuildOfferCategoryList()),
        SliverToBoxAdapter(child: const SizedBox(height: 33)),
        SliverToBoxAdapter(child: BuildOfferSelectionList()),
        SliverToBoxAdapter(child: const SizedBox(height: 33)),
        SliverToBoxAdapter(child: BuildFreeShippingNote()),
        SliverToBoxAdapter(child: const SizedBox(height: 20)),
        ProductGridSliver(products: ProductModel.productsList),
      ],
    );
  }
}
