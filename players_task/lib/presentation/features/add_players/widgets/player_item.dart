import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:players_task/core/cubit/cubit.dart';
import 'package:players_task/core/cubit/states.dart';
import 'package:players_task/core/resources/colors_manager.dart';
import 'package:players_task/core/resources/strings_manager.dart';
import 'package:players_task/core/resources/values_manager.dart';
import 'package:players_task/data/models/user_model.dart';
import 'package:players_task/presentation/features/add_players/controllers/cubit.dart';
import 'package:players_task/presentation/features/add_players/controllers/states.dart';
import 'package:players_task/presentation/shared/custom_button.dart';

class PlayerItem extends StatelessWidget {
  final UserModel userModel;

  const PlayerItem({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        AppCubit appCubit = AppCubit.get(context);
        return BlocBuilder<AddPlayersCubit, AddPlayersStates>(
          builder: (context, state) {
            AddPlayersCubit addPlayersCubit = AddPlayersCubit.get(context);

            return Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(userModel.image, width: SizeManager.s60, height: SizeManager.s60),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: SizeManager.s10),
                    child: Text(
                      '${userModel.firstName} ${userModel.maidenName} ${userModel.lastName}',
                      style: TextStyle(color: appCubit.isLight ? ColorsManager.black : ColorsManager.white),
                    ),
                  ),
                ),
                CustomButton(
                  onPressed: () => addPlayersCubit.changePlayerModel(userModel),
                  isTextOnly: true,
                  text: addPlayersCubit.selectedPlayers.contains(userModel) ? StringsManager.remove : StringsManager.add,
                  buttonColor: addPlayersCubit.selectedPlayers.contains(userModel) ? ColorsManager.darkRed : ColorsManager.primaryColor,
                  width: SizeManager.s60,
                  height: SizeManager.s35,
                ),
              ],
            );
          }
        );
      },
    );
  }
}