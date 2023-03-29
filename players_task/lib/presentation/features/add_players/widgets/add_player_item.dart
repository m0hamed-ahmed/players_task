import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:players_task/core/resources/assets_manager.dart';
import 'package:players_task/core/resources/colors_manager.dart';
import 'package:players_task/core/resources/values_manager.dart';
import 'package:players_task/data/models/user_model.dart';
import 'package:players_task/presentation/features/add_players/controllers/cubit.dart';
import 'package:players_task/presentation/features/add_players/controllers/states.dart';

class AddPlayerItem extends StatelessWidget {
  final UserModel? userModel;

  const AddPlayerItem({Key? key, this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPlayersCubit, AddPlayersStates>(
      builder: (context, state) {
        AddPlayersCubit addPlayersCubit = AddPlayersCubit.get(context);

          return userModel == null ? Container(
            padding: const EdgeInsets.all(SizeManager.s5),
            width: SizeManager.s50,
            height: SizeManager.s50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: ColorsManager.grey),
            ),
            child: Image.asset(ImagesManager.addPersonIc),
          ) : GestureDetector(
            onTap: () => addPlayersCubit.changePlayerModel(userModel!),
            child: SizedBox(
              width: SizeManager.s50,
              height: SizeManager.s50,
              child: Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(userModel!.image),
                      ),
                      Positioned(
                        right: -10,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorsManager.grey300,
                          ),
                          child: InkWell(
                            onTap: () => addPlayersCubit.changePlayerModel(userModel!),
                            child: const Icon(Icons.clear, color: ColorsManager.darkRed),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: SizeManager.s10),
                  SizedBox(
                    width: SizeManager.s70,
                    child: Center(
                      child: Text(
                        userModel!.firstName,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(color: ColorsManager.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
      },
    );
  }
}