import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:players_task/core/cubit/cubit.dart';
import 'package:players_task/core/cubit/states.dart';
import 'package:players_task/core/resources/assets_manager.dart';
import 'package:players_task/core/resources/colors_manager.dart';
import 'package:players_task/core/resources/constants_manager.dart';
import 'package:players_task/core/resources/strings_manager.dart';
import 'package:players_task/core/resources/values_manager.dart';
import 'package:players_task/core/utils/dialogs.dart';
import 'package:players_task/core/utils/extensions.dart';
import 'package:players_task/presentation/features/add_players/controllers/cubit.dart';
import 'package:players_task/presentation/features/add_players/controllers/states.dart';
import 'package:players_task/presentation/features/add_players/widgets/add_player_item.dart';
import 'package:players_task/presentation/features/add_players/widgets/player_item.dart';
import 'package:players_task/presentation/shared/custom_button.dart';
import 'package:players_task/presentation/shared/custom_text_form_field.dart';

class AddPlayersScreen extends StatefulWidget {
  
  const AddPlayersScreen({Key? key}) : super(key: key);

  @override
  State<AddPlayersScreen> createState() => _AddPlayersScreenState();
}

class _AddPlayersScreenState extends State<AddPlayersScreen> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await Dialogs.showAskDialog(context, StringsManager.areYouSure, StringsManager.exitApp),
      child: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          AppCubit appCubit = AppCubit.get(context);
          return BlocBuilder<AddPlayersCubit, AddPlayersStates>(
            builder: (context, state) {
              AddPlayersCubit addPlayersCubit = AddPlayersCubit.get(context);

              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    StringsManager.addPlayers.toCapitalized(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
                  actions: [
                    BlocBuilder<AppCubit, AppStates>(
                      builder: (context, state) {
                        AppCubit cubit = AppCubit.get(context);

                        return IconButton(
                          onPressed: () => cubit.changeIsLight(),
                          icon: Icon(Icons.sunny, color: cubit.isLight ? ColorsManager.black : ColorsManager.white),
                        );
                      },
                    ),
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.all(SizeManager.s16),
                  child: state is AddPlayersLoadingState ? const Center(
                    child: CircularProgressIndicator(),
                  ) : Column(
                    children: [
                      SizedBox(
                        height: SizeManager.s80,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            if(index == 0) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment:MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(ImagesManager.avatarImage, width: SizeManager.s50, height: SizeManager.s50),
                                      ),
                                      const SizedBox(height: SizeManager.s10),
                                      SizedBox(
                                        width: SizeManager.s70,
                                        child: Text(
                                          StringsManager.testAccount.toTitleCase(),
                                          textAlign:TextAlign.center,
                                          maxLines: 1,
                                          overflow: TextOverflow.clip,
                                          style: const TextStyle(color: ColorsManager.grey),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: SizeManager.s10),
                                  SizedBox(
                                    height: SizeManager.s100,
                                    child: AddPlayerItem(userModel: addPlayersCubit.selectedPlayers.asMap().containsKey(index) ? addPlayersCubit.selectedPlayers[index] : null),
                                  ),
                                ],
                              );
                            }
                            return AddPlayerItem(userModel: addPlayersCubit.selectedPlayers.asMap().containsKey(index) ? addPlayersCubit.selectedPlayers[index] : null);
                          },
                          separatorBuilder: (context, index) => const SizedBox(width: SizeManager.s30),
                          itemCount: ConstantsManager.maxNumberOfChoicesPlayers,
                        ),
                      ),
                      const SizedBox(height: SizeManager.s10),
                      CustomTextFormField(
                        controller: addPlayersCubit.textEditingControllerSearch,
                        textInputAction: TextInputAction.search,
                        hintText: StringsManager.searchByPlayerName.toCapitalized(),
                        verticalPadding: SizeManager.s0,
                        onChanged: (val) => addPlayersCubit.onChangeSearch(val),
                        prefixIcon: Icon(Icons.search, color: appCubit.isLight ? ColorsManager.black : ColorsManager.white),
                        suffixIcon: IconButton(
                          onPressed: () => addPlayersCubit.onClearSearch(context),
                          icon: const Icon(Icons.clear, color: ColorsManager.grey),
                        ),
                      ),
                      const SizedBox(height: SizeManager.s10),
                      Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: SizeManager.s10),
                          itemBuilder: (context, index) => PlayerItem(userModel: addPlayersCubit.searchPlayers[index]),
                          separatorBuilder: (context, index) => const SizedBox(height: SizeManager.s10),
                          itemCount: addPlayersCubit.searchPlayers.length,
                        ),
                      ),
                      CustomButton(
                        onPressed: () {},
                        height: SizeManager.s45,
                        isTextOnly: true,
                        text: StringsManager.continueText,
                        buttonColor: ColorsManager.primaryColor,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}