import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manger/home_cubit/home_cubit.dart';
import 'widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..loadHomeData(),
      child: SafeArea(
        child: Column(children: [Expanded(child: HomeViewBody())]),
      ),
    );
  }
}
