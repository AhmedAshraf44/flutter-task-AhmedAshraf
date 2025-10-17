import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/feature/filtering/presentation/manger/filter_cubit/filter_cubit.dart';

import 'widgets/filtering_view_body.dart';

class FilteringView extends StatelessWidget {
  const FilteringView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterCubit()..loadFilters(),
      child: Scaffold(body: SafeArea(child: FilteringViewBody())),
    );
  }
}
