import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:players_task/core/cubit/cubit.dart';
import 'package:players_task/core/utils/bloc_observer.dart';
import 'package:players_task/core/utils/cache_helper.dart';
import 'package:players_task/core/utils/dependency_injection.dart';
import 'package:players_task/core/utils/my_app.dart';
import 'package:players_task/presentation/features/add_players/controllers/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await CacheHelper.init();
  DependencyInjection.init();

  BlocOverrides.runZoned(() => runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(create: (context) => AppCubit(isLight: CacheHelper.getData(key: PREFERENCES_KEY_IS_LIGHT) ?? true)),
        BlocProvider<AddPlayersCubit>(create: (context) => getIt<AddPlayersCubit>()..getAllPlayers()),
      ],
      child: MyApp(),
    ),
  ), blocObserver: MyBlocObserver());
}