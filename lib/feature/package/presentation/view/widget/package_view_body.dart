import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/utils/widgets/build_button.dart';
import 'package:flutter_task/feature/package/presentation/manger/package_cubit/package_cubit.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/color/app_colors.dart';
import '../../../../../core/routers/app_routes.dart';
import 'build_custom_offer_box.dart';
import 'build_header_section.dart';
import 'package_card.dart';

class PackageViewBody extends StatelessWidget {
  const PackageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PackageCubit, PackageState>(
      builder: (context, state) {
        if (state is PackageLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PackageSuccessState) {
          final packages = state.packages;
          return CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(child: BuildHeaderSection()),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList.builder(
                  itemCount: packages.length,
                  itemBuilder: (context, index) {
                    final package = packages[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: PackageCard(package: package),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 16,
                  ),
                  child: BuildCustomOfferBox(),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 185)),
              SliverToBoxAdapter(
                child: Divider(
                  height: 1,
                  color: AppColors.kTextBlack.withValues(alpha: 0.1),
                  thickness: 1,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: BuildButton(
                    title: 'التالى',
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kFilteringView);
                    },
                    isShow: true,
                  ),
                ),
              ),
            ],
          );
        } else if (state is PackageFailureState) {
          return Center(child: Text('error: ${state.message}'));
        }
        return const SizedBox();
      },
    );
  }
}
