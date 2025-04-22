class AuthModel {
  late String token;
  late bool firstAccess;

  AuthModel({
    required this.token,
    required this.firstAccess,
  });

  AuthModel.fromMap(map) {
    token = map["token"];
    firstAccess = map['first_access'] == 1 || map['first_access'] == true;
  }
}
