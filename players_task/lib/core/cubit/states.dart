abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChangeIsLightState extends AppStates {
  bool isLight;

  AppChangeIsLightState({required this.isLight});
}