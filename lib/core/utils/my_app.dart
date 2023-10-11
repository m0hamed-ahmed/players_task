import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:players_task/core/cubit/cubit.dart';
import 'package:players_task/core/cubit/states.dart';
import 'package:players_task/core/resources/routes_manager.dart';
import 'package:players_task/core/resources/strings_manager.dart';
import 'package:players_task/core/resources/theme_manager.dart';
import 'package:players_task/core/utils/extensions.dart';
import 'package:players_task/core/utils/my_behavior.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal(); // Named Constructor

  static const MyApp _instance = MyApp._internal(); // Singleton

  factory MyApp() => _instance; // Factory

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: StringsManager.appName.toCapitalized(),
          theme: getApplicationTheme(isLight: cubit.isLight),
          themeMode: cubit.isLight ? ThemeMode.dark : ThemeMode.light,
          onGenerateRoute: (routeSettings) => onGenerateRoute(routeSettings),
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: MyBehavior(),
              child: child!,
            );
          },
        );
      }
    );
  }
}