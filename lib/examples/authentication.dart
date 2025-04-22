import 'package:strava_client/strava_client.dart';

class Authentication {
  final StravaClient stravaClient;

  // Construtor que recebe o cliente Strava
  Authentication(this.stravaClient);

  // Método para autenticar e obter o token
  Future<TokenResponse> AuthenticationStrava(
      List<AuthenticationScope> scopes, String redirectUrl) {
    return stravaClient.authentication.authenticate(
        scopes: scopes, // Escopos de autorização
        redirectUrl: redirectUrl,
        forceShowingApproval: true, // Força a exibição da aprovação
        callbackUrlScheme: "pedalservice", // Esquema da URL de callback
        preferEphemeral: true
    );
  }
}
