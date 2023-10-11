import 'package:dartz/dartz.dart';
import 'package:players_task/core/error/failure.dart';
import 'package:players_task/data/models/user_model.dart';

abstract class BaseRepository {
  Future<Either<Failure, List<UserModel>>> getPlayers();
}