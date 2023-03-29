import 'dart:convert';
import 'package:players_task/core/error/exceptions.dart';
import 'package:players_task/core/network/api_constants.dart';
import 'package:players_task/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class BaseRemoteDataSource {
  Future<List<UserModel>> getPlayers();
}

class RemoteDataSource extends BaseRemoteDataSource {

  @override
  Future<List<UserModel>> getPlayers() async {
    try {
      http.Response response = await http.get(
        Uri.parse(ApiConstants.getUsersEndPoint),
      );

      if(response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(response.body);
          return UserModel.fromJsonList(jsonData['users']);
      }
      else {
        throw ServerException( message: 'an error occurred while connecting to the server');
      }
    }
    on ServerException catch(error) {
      throw ServerException(message: error.message);
    }
    catch(error) {
      throw ServerException(message: 'an error occurred try again');
    }
  }
}