import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:players_task/core/error/failure.dart';
import 'package:players_task/core/resources/constants_manager.dart';
import 'package:players_task/core/resources/strings_manager.dart';
import 'package:players_task/core/utils/extensions.dart';
import 'package:players_task/core/utils/methods.dart';
import 'package:players_task/data/models/user_model.dart';
import 'package:players_task/domain/usecases/base/base_usecase.dart';
import 'package:players_task/domain/usecases/get_players_usecase.dart';
import 'package:players_task/presentation/features/add_players/controllers/states.dart';

class AddPlayersCubit extends Cubit<AddPlayersStates> {

  final GetPlayersUseCase _getPlayersUseCase;

  AddPlayersCubit(this._getPlayersUseCase) : super(AddPlayersInitialState());

  static AddPlayersCubit get(context) => BlocProvider.of(context);

  Future<Either<Failure, List<UserModel>>> getPlayersImpl() async {
    return await _getPlayersUseCase.call(const NoParameters());
  }

  List<UserModel> players = [];
  Future<void> getAllPlayers() async {
    emit(AddPlayersLoadingState());
    Either<Failure, List<UserModel>> response = await getPlayersImpl();
    response.fold((failure) async {
      await _occurredFailure(failure);
    }, (users) async {
      players = users;
      searchPlayers = users;
      emit(AddPlayersSuccessState());
    });
  }

  List<UserModel> selectedPlayers = [];

  TextEditingController textEditingControllerSearch = TextEditingController();
  List<UserModel> searchPlayers = [];

  void onChangeSearch(String val) {
    searchPlayers = players.where((element) => element.firstName.toLowerCase().contains(val.toLowerCase()) ||
        element.maidenName.toLowerCase().contains(val.toLowerCase()) ||
        element.lastName.toLowerCase().contains(val.toLowerCase())).toList();
    emit(ChangeSearchState());
  }

  void onClearSearch(BuildContext context) {
    textEditingControllerSearch.clear();
    searchPlayers = players;
    emit(ChangeSearchState());
  }

  Future<void> _occurredFailure(Failure failure) async {
    Methods.showToast(failure.message.toCapitalized());
  }

  void changePlayerModel(UserModel userModel) {
    int index = selectedPlayers.indexOf(userModel);

    if(index == -1) {
      if(selectedPlayers.length != ConstantsManager.maxNumberOfChoicesPlayers) {
        selectedPlayers.add(userModel);
        emit(AddPlayerModeState());
      }
      else {
        Methods.showToast(StringsManager.youHaveReachedTheLimitOfChoosingThePlayers.toCapitalized());
      }
    }
    else {
      selectedPlayers.removeAt(index);
      emit(RemovePlayerModeState());
    }
  }
}