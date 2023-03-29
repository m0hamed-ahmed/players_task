import 'package:dartz/dartz.dart';
import 'package:players_task/core/error/exceptions.dart';
import 'package:players_task/core/error/failure.dart';
import 'package:players_task/core/network/network_info.dart';
import 'package:players_task/data/data_source/remote/remote_data_source.dart';
import 'package:players_task/data/models/user_model.dart';
import 'package:players_task/domain/repository/base_repository.dart';

class Repository extends BaseRepository {
  final BaseRemoteDataSource _baseRemoteDataSource;
  final BaseNetworkInfo _baseNetworkInfo;

  Repository(this._baseRemoteDataSource, this._baseNetworkInfo);

  @override
  Future<Either<Failure, List<UserModel>>> getPlayers() async {
    if(await _baseNetworkInfo.isConnected) {
      try {
        var result = await _baseRemoteDataSource.getPlayers();
        return Right(result);
      }
      on ServerException catch(error) {
        return Left(ServerFailure(message: error.message));
      }
    }
    else {
      return Left(LocalFailure(message: 'Check your internet connection'));
    }
  }
}