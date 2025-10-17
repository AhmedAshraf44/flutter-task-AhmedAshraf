import 'package:flutter_task/feature/profile/presentation/view/profile_view.dart';
import 'package:go_router/go_router.dart';

import '../../feature/home_main/presentation/view/home_main_view.dart';
import '../../feature/filtering/presentation/view/filtering_view.dart';

abstract class AppRouter {
  static const String kFilteringView = '/FilteringView';
  static const String kProfileView = '/ProfileView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => HomeMainParentView()),
      GoRoute(
        path: kFilteringView,
        builder: (context, state) => FilteringView(),
      ),
      GoRoute(path: kProfileView, builder: (context, state) => ProfileView()),
    ],
  );
}
