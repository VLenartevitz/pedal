import 'dart:convert';

import '../models/auth_model.dart';
import 'package:http/http.dart' as http;

class AuthRepository {


  Future<AuthModel> login(String accessToken, String refreshToken) async {
    var url = Uri.http('172.17.0.1', 'api/auth/strava');

    var response = await http
        .post(url, body: {'token': accessToken, 'refreshToken': refreshToken});

    Map<String, dynamic> responseJson = json.decode(response.body);

    return AuthModel.fromMap(responseJson);

  }
}