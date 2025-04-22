import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenManager {
  // Instância única da classe
  static final TokenManager _instance = TokenManager._internal();

  // Construtor privado
  TokenManager._internal();

  // Fábrica que retorna a instância única
  factory TokenManager() {
    return _instance;
  }

  // Armazenamento seguro para persistir o token
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  // Chave para armazenar o token
  final String _tokenKey = 'auth_token';

  // Cache do token na memória
  Map<String, dynamic>? _tokenCache;

  // Salva o token de forma persistente e em cache
  Future<void> saveToken(Map<String, dynamic> token) async {
    _tokenCache = token;
    final String tokenString = token.toString();
    await _storage.write(key: _tokenKey, value: tokenString);
  }

  // Retorna o token armazenado, carregando do armazenamento seguro se necessário
  Future<Map<String, dynamic>?> getToken() async {
    if (_tokenCache != null) {
      return _tokenCache;
    }
    String? tokenString = await _storage.read(key: _tokenKey);
    if (tokenString != null) {
      _tokenCache = _parseToken(tokenString);
      return _tokenCache;
    }
    return null;
  }

  // Remove o token do cache e do armazenamento seguro
  Future<void> removeToken() async {
    _tokenCache = null;
    await _storage.delete(key: _tokenKey);
  }

  // Verifica se o token está expirado (baseado em um campo 'exp' no token)
  Future<bool> isTokenExpired() async {
    final token = await getToken();
    if (token == null) return true;

    final int exp = token['exp'];
    final currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    return exp < currentTime;
  }

  // Método auxiliar para converter string em mapa
  Map<String, dynamic> _parseToken(String tokenString) {
    // Implementação para parsear o token string em um Map
    // Por exemplo, usando json.decode(tokenString)
    // Isso depende de como o token é salvo
    return {}; // Substituir pela implementação real
  }
}
