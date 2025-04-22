import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pedalserviceapp/models/bike_type_model.dart';
import 'package:pedalserviceapp/services/token_manager.dart';

class BikeTypeController {
  var apiIp = const String.fromEnvironment('API_IP');

  Future<List<BikeTypeModel>> fetchBikeType() async {
    Map<String, dynamic>? tokenMap = await TokenManager().getToken();

    if (tokenMap == null || tokenMap['token'] == null) {
      throw Exception('Token não encontrado ou inválido.');
    }
    String token = tokenMap['token'];

    var url = Uri.http(apiIp, 'api/bike-types');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var response = await http.get(url, headers: headers);

    List<dynamic> responseJson = json.decode(response.body);

    List<BikeTypeModel> bikeTypes =
        responseJson.map((json) => BikeTypeModel.fromMap(json)).toList();

    return bikeTypes;
  }
}
