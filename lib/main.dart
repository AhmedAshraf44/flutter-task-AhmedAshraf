import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/bloc_observer.dart';
import 'core/function/get_theme.dart';
import 'core/routers/app_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const FlutterTaskApp());
}

class FlutterTaskApp extends StatelessWidget {
  const FlutterTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: 'Flutter Task',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: getTheme(),
    );
  }
}
