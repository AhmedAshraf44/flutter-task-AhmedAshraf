import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/feature/filter/presentation/manger/filter_cubit/filter_cubit.dart';

import '../../../../core/utils/service_locator.dart';
import '../../data/repo/filter_repo_imple.dart';
import 'widgets/filter_view_body.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FilterCubit(getIt.get<FilterRepoImple>())..loadFilters(),
      child: Scaffold(body: SafeArea(child: FilterViewBody())),
    );
  }
}
