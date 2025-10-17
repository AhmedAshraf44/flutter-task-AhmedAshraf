import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/service_locator.dart';
import '../../data/repo/package_repo_imple.dart';
import '../manger/package_cubit/package_cubit.dart';
import 'widget/package_view_body.dart';

class PackageView extends StatelessWidget {
  const PackageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            PackageCubit(getIt.get<PackageRepoImpl>())..loadPackages(),
        child: SafeArea(child: PackageViewBody()),
      ),
    );
  }
}
