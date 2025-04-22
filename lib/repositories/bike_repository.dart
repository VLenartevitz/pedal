import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/bike_model.dart';
import '../services/token_manager.dart';

class BikeRepository {
  Future<int> store(int bikeTypeId, String nickname, String model, String weight, String year, String buy_date, String notes,  ) async {
    var apiIp = const String.fromEnvironment('API_IP');

    Map<String, dynamic>? tokenMap = await TokenManager().getToken();

    if (tokenMap == null || tokenMap['token'] == null) {
      throw Exception('Token não encontrado ou inválido.');
    }
    String token = tokenMap['token'];

    var url = Uri.http(apiIp, 'api/bikes');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var body = jsonEncode({'bike_type_id': bikeTypeId, 'nickname': nickname, 'model':model, 'weight': weight, 'year': year, 'buy_date':buy_date, 'notes': notes });

    var response = await http.post(url, headers: headers, body: body);

    return response.statusCode;
  }

}
