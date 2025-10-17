import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/color/app_colors.dart';
import 'package:flutter_task/feature/home_main/presentation/manger/home_main_cubit/home_main_cubit.dart';

import 'widgets/build_nav_bar_item.dart';

class HomeMainParentView extends StatelessWidget {
  const HomeMainParentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeMainCubit(),
      child: BlocBuilder<HomeMainCubit, HomeMainState>(
        builder: (context, state) {
          final cubit = HomeMainCubit.get(context);
          return Scaffold(
            body: cubit.pages[cubit.currentIndex],
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: AppColors.kPrimaryColor,
                border: Border.all(
                  color: Colors.black.withValues(alpha: 0.1),
                  width: 1,
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  cubit.navData.length,
                  (index) => BuildNavBarItem(
                    index: index,
                    currentIndex: cubit.currentIndex,
                    data: cubit.navData[index],
                    onTap: () => cubit.changeIndex(index),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
