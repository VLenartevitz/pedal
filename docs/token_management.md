# Gerenciamento de Tokens

Este documento descreve a implementação do gerenciamento de tokens de autenticação em um aplicativo Flutter. A solução utiliza uma classe Singleton chamada `TokenManager` para armazenar, recuperar e gerenciar tokens de autenticação de forma segura e eficiente.

## Estrutura da Classe `TokenManager`

### Instância Única

A classe `TokenManager` é implementada como um Singleton, garantindo que apenas uma instância da classe esteja ativa durante o ciclo de vida do aplicativo. Isso é crucial para garantir que o token seja gerenciado de forma consistente.

```dart
class TokenManager {
  static final TokenManager _instance = TokenManager._internal();
  
  TokenManager._internal();
  
  factory TokenManager() {
    return _instance;
  }
}
```

## Persistência de Tokens

O `TokenManager` utiliza a biblioteca `flutter_secure_storage` para armazenar o token de forma segura no dispositivo do usuário. Essa abordagem é preferível ao uso de `SharedPreferences`, pois `flutter_secure_storage` oferece uma camada adicional de segurança, criptografando os dados.

```dart
final FlutterSecureStorage _storage = FlutterSecureStorage();
final String _tokenKey = 'auth_token';
```

## Armazenamento e Recuperação

O token é armazenado e recuperado utilizando operações assíncronas, garantindo que a aplicação não bloqueie a execução enquanto realiza essas operações. O token é mantido em cache na memória para melhorar a performance.

### Salvar Token

O método `saveToken` salva o token tanto no cache em memória quanto no armazenamento seguro:

```dart
Future<void> saveToken(Map<String, dynamic> token) async {
  _tokenCache = token;
  final String tokenString = token.toString();
  await _storage.write(key: _tokenKey, value: tokenString);
}
```

## Verificação de Expiração de Token

O `TokenManager` também inclui um método para verificar se o token armazenado já expirou. Isso é feito verificando o campo `exp` do token (que deve ser fornecido no próprio token) e comparando com o tempo atual.

```dart
Future<bool> isTokenExpired() async {
  final token = await getToken();
  if (token == null) return true;
  
  final int exp = token['exp'];
  final currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  return exp < currentTime;
}
```

## Remoção do Token

O método `removeToken` remove o token tanto do cache quanto do armazenamento seguro:

```dart
Future<void> removeToken() async {
  _tokenCache = null;
  await _storage.delete(key: _tokenKey);
}
```

## Uso no Processo de Login

Durante o processo de login, o token de autenticação obtido da API é salvo utilizando o `TokenManager`. Isso permite que o aplicativo acesse o token de forma segura para autenticar futuras requisições.

### Exemplo de Uso:

```dart
Future<void> _login() async {
  final response = await http.post(
    Uri.parse('https://api.exemplo.com/login'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode({'username': username, 'password': password}),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> token = json.decode(response.body)['token'];
    await TokenManager().saveToken(token);
    Navigator.pushReplacementNamed(context, '/home');
  } else {
    _showError('Falha ao fazer login.');
  }
}
```
