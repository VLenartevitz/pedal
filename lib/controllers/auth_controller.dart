import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pedalserviceapp/models/auth_model.dart';
import 'package:pedalserviceapp/services/token_manager.dart';

import '../screens/RegisterBike.dart';

class AuthController {
  var apiIp = const String.fromEnvironment('API_IP');

  Future<AuthModel> login(String accessToken, String refreshToken) async {
    var url = Uri.http(apiIp, 'api/auth/strava');

    var response = await http.post(url, body: {
      'token': accessToken,
      'refreshToken': refreshToken,
    });

    Map<String, dynamic> responseJson = json.decode(response.body);

    TokenManager().saveToken(responseJson);

    return AuthModel.fromMap(responseJson);
  }

  updateFirstAccess() async {
    Map<String, dynamic>? tokenMap = await TokenManager().getToken();

    if (tokenMap == null || tokenMap['token'] == null) {
      throw Exception('Token não encontrado ou inválido.');
    }
    String token = tokenMap['token'];

    var url = Uri.http(apiIp, 'api/updateFirstAccess');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http.post(url, headers: headers);
  }
}
