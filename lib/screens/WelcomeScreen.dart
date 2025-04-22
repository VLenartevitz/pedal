import '../commons/app_colors.dart';
import '../screens/RegisterEquips.dart';
import '../widgets/app_btn.dart';
import 'package:flutter/material.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(
              top: 58.0, bottom: 48.0, left: 16.0, right: 16.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          child: Image.asset(
                            'assets/images/Img.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, bottom: 0.0, left: 10.0, right: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Boas-vindas, Lucio!',
                                style: TextStyle(
                                  color: AppColors.contentTitle,
                                  fontSize: 32,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              // SizedBox(height: 8.0),
                              SizedBox(
                                child: Text(
                                  'Tudo pronto. Comece a cadastrar equipamentos, juntar-se com amigos, faça parte da nossa comunidade e, o mais importante, divirta-se!',
                                  style: TextStyle(
                                    color: AppColors.contentBase,
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 48,
                      child: AppBtn(
                        textColor: AppColors.contentTitleAlt,
                        text: "Feito",
                        bgColor: AppColors.primary,
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20)),
                            ),
                            builder: (context) {
                              return RegisterEquips();
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
