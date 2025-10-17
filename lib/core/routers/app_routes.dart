import 'package:flutter_task/feature/package/presentation/view/package_view.dart';
import 'package:go_router/go_router.dart';

import '../../feature/home_main/presentation/view/home_main_view.dart';
import '../../feature/filter/presentation/view/filter_view.dart';

abstract class AppRouter {
  static const String kFilteringView = '/FilteringView';
  static const String kPackageView = '/PackageView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => HomeMainParentView()),
      GoRoute(path: kFilteringView, builder: (context, state) => FilterView()),
      GoRoute(path: kPackageView, builder: (context, state) => PackageView()),
    ],
  );
}
