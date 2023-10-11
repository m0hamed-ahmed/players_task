class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String maidenName;
  final String image;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      maidenName: json['maidenName'],
      image: json['image'],
    );
  }

  static Map<String, dynamic> toMap(UserModel userModel) {
    return {
      'id': userModel.id,
      'firstName': userModel.firstName,
      'lastName': userModel.lastName,
      'maidenName': userModel.maidenName,
      'image': userModel.image,
    };
  }

  static List<UserModel> fromJsonList (List<dynamic> list) => list.map<UserModel>((item) => UserModel.fromJson(item)).toList();

  static List<Map<String, dynamic>> toMapList(List<UserModel> list) => list.map<Map<String, dynamic>>((item) => UserModel.toMap(item)).toList();
}