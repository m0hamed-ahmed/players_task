import 'package:dartz/dartz.dart';
import 'package:players_task/core/error/failure.dart';
import 'package:players_task/data/models/user_model.dart';
import 'package:players_task/domain/repository/base_repository.dart';
import 'package:players_task/domain/usecases/base/base_usecase.dart';

class GetPlayersUseCase extends BaseUseCase<List<UserModel>, NoParameters> {
  final BaseRepository _baseRepository;

  GetPlayersUseCase(this._baseRepository);

  @override
  Future<Either<Failure, List<UserModel>>> call(NoParameters parameters) async {
    return await _baseRepository.getPlayers();
  }
}