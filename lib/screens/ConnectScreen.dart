import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:pedalserviceapp/controllers/bike_type_controller.dart';
import '../commons/app_colors.dart';
import '../controllers/auth_controller.dart';
import '../examples/authentication.dart';
import '../models/auth_model.dart';
import '../widgets/app_btn.dart';
import 'Home.dart';
import 'RegisterBike.dart';
import 'package:strava_client/strava_client.dart';
import '../secret.dart';

class ConnectScreen extends StatefulWidget {
  @override
  _ConnectScreenState createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> {
  final List<String> imgList = [
    'assets/images/imgCarrousel1.png',
    'assets/images/imgCarrousel1.png',
    'assets/images/imgCarrousel1.png',
  ];
  final List<String> textList = [
    'Explore suas habilidades hoje',
    'Desenvolva-se com especialistas',
    'Aprimore seu conhecimento',
  ];
  final List<String> subtextList = [
    'Recursos práticos ministrados por especialistas em áreas criativas e digitais.',
    'Desenvolva-se com quem entende do assunto e alcance novos patamares.',
    'Aprimore suas habilidades e expanda seu conhecimento com conteúdos exclusivos.',
  ];

  late final StravaClient stravaClient;
  bool isLoggedIn = false;
  AuthModel? authModel;
  TokenResponse? token;

  final authController = AuthController();
  final bikeTypeController = BikeTypeController();

  PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    stravaClient = StravaClient(secret: secret, clientId: clientId);
  }

  void connectStrava() async {
    final auth = Authentication(stravaClient);
    final token = await auth.AuthenticationStrava(
      [
        AuthenticationScope.profile_read_all,
        AuthenticationScope.read_all,
        AuthenticationScope.activity_read_all,
      ],
      "pedalservice://redirect",
    );

    setState(() => this.token = token);

    final login =
        await authController.login(token.accessToken, token.refreshToken);

    if (login.firstAccess) {
      authController.updateFirstAccess();

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) => RegisterBike(),
      );
    } else {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) {
          return RegisterBike();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 50.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: PageView.builder(
                controller: _pageController,
                itemCount: imgList.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Image.asset(
                    imgList[index],
                    fit: BoxFit.contain,
                  );
                },
              ),
            ),
            Column(
              children: [
                Text(
                  textList[_currentIndex],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.contentTitle,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  subtextList[_currentIndex],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.contentBase,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                AnimatedSmoothIndicator(
                  activeIndex: _currentIndex,
                  count: imgList.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: AppColors.primary,
                    dotColor: Colors.grey,
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            AppBtn(
              text: "Conectar com STRAVA",
              bgColor: AppColors.primary,
              textColor: AppColors.contentTitleAlt,
              onPressed: connectStrava,
            ),
          ],
        ),
      ),
    );
  }
}
