import 'package:flutter_task/core/database/dao/filter_dao.dart';
import 'package:flutter_task/core/database/dao/home_dao.dart';
import 'package:flutter_task/core/database/dao/package_dao.dart';
import 'package:flutter_task/feature/filter/data/repo/filter_repo_imple.dart';
import 'package:flutter_task/feature/package/data/repo/package_repo_imple.dart';
import 'package:get_it/get_it.dart';

import '../../feature/home/data/repo/home_repo_imple.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<PackageRepoImpl>(PackageRepoImpl(PackageDao()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(HomeDao()));
  getIt.registerSingleton<FilterRepoImple>(FilterRepoImple(FilterDao()));
}
