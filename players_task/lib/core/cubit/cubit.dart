import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:players_task/core/cubit/states.dart';
import 'package:players_task/core/utils/cache_helper.dart';

class AppCubit extends Cubit<AppStates> {

  bool isLight = true;

  AppCubit({required this.isLight}) : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  void changeIsLight() {
    isLight = !isLight;
    CacheHelper.setData(key: PREFERENCES_KEY_IS_LIGHT, value: isLight);
    emit(AppChangeIsLightState(isLight: isLight));
  }
}