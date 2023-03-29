import 'package:flutter/material.dart';
import 'package:players_task/presentation/features/add_players/screens/add_players_screen.dart';

class Routes {
  static const String addPlayersRoute = '/addPlayersRoute';
}

PageRouteBuilder onGenerateRoute (routeSettings) {
  return PageRouteBuilder(
    settings: routeSettings,
    pageBuilder: (context, animation, secondaryAnimation) {
      switch (routeSettings.name) {
        case Routes.addPlayersRoute: return const AddPlayersScreen();
        default: return const AddPlayersScreen();
      }
    },
  );
}