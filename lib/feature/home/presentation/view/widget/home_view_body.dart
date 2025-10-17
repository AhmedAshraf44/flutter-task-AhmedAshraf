import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/feature/home/presentation/view/widget/build_free_shipping_note.dart';
import 'package:flutter_task/feature/home/presentation/view/widget/build_app_bar_home.dart';
import 'package:flutter_task/feature/home/presentation/view/widget/product_grid_sliver.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routers/app_routes.dart';
import '../../manger/home_cubit/home_cubit.dart';
import 'build_offer_category_list.dart';
import 'build_offer_selection_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeSucessState) {
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
              SliverToBoxAdapter(
                child: BuildOfferCategoryList(categories: state.categories),
              ),
              SliverToBoxAdapter(child: const SizedBox(height: 33)),
              SliverToBoxAdapter(
                child: BuildOfferSelectionList(selections: state.selections),
              ),
              SliverToBoxAdapter(child: const SizedBox(height: 33)),
              SliverToBoxAdapter(child: BuildFreeShippingNote()),
              SliverToBoxAdapter(child: const SizedBox(height: 20)),
              ProductGridSliver(products: state.products),
              SliverToBoxAdapter(child: const SizedBox(height: 20)),
            ],
          );
        } else if (state is HomeFailureState) {
          return Center(child: Text("Error: ${state.message}"));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
