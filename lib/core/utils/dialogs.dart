import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:players_task/core/cubit/cubit.dart';
import 'package:players_task/core/cubit/states.dart';
import 'package:players_task/core/resources/colors_manager.dart';
import 'package:players_task/core/resources/strings_manager.dart';
import 'package:players_task/core/resources/values_manager.dart';
import 'package:players_task/core/utils/extensions.dart';

class Dialogs {
  static Future<bool> showAskDialog(BuildContext context, String title, String text) async {
    return (
      await (showDialog(
        context: context,
        builder: (context) {
          return BlocBuilder<AppCubit, AppStates>(
            builder: (context, state) {
              AppCubit appCubit = AppCubit.get(context);
              return AlertDialog(
                backgroundColor: appCubit.isLight ? ColorsManager.grey1 : ColorsManager.secondaryDarkColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeManager.s10)),
                title: Text(
                  title.toCapitalized(),
                  style: TextStyle(color: appCubit.isLight ? ColorsManager.black : ColorsManager.white),
                ),
                titlePadding: const EdgeInsets.only(left: SizeManager.s16, right: SizeManager.s16, top: SizeManager.s16, bottom: SizeManager.s8),
                content: Text(
                  text.toCapitalized(),
                  style: const TextStyle(color: ColorsManager.grey),
                ),
                contentPadding: const EdgeInsets.only(left: SizeManager.s16, right: SizeManager.s16, bottom: SizeManager.s8),
                actionsPadding: const EdgeInsets.all(SizeManager.s16),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    style: TextButton.styleFrom(
                      backgroundColor: appCubit.isLight ? ColorsManager.grey300 : ColorsManager.darkColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeManager.s10)),
                    ),
                    child: Text(
                      StringsManager.no.toCapitalized(),
                      style: TextStyle(color: appCubit.isLight ? ColorsManager.black : ColorsManager.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    style: TextButton.styleFrom(
                      backgroundColor: ColorsManager.darkRed,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeManager.s10)),
                    ),
                    child: Text(
                      StringsManager.yes.toCapitalized(),
                      style: const TextStyle(color: ColorsManager.white),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ))
    ) ?? false;
  }
}