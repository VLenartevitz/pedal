import '../commons/app_colors.dart';
import '../widgets/app_btn.dart';
import 'package:flutter/material.dart';

import 'RegisterBike.dart';

class RegisterEquips extends StatelessWidget {
  const RegisterEquips({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.9,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 38.0, bottom: 38.0, left: 16.0, right: 16.0),
              child: Column(
                children: [
                  const Text(
                    'Boas-vindas',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    'Cadastre seus Equipamentos',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.contentTitle,
                      fontSize: 32,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 40),
                  Column(
                    children: [
                      buildEquipItem(
                        context,
                        'Tópico 1',
                        'Acesse, monitore e controle acessórios',
                      ),
                      SizedBox(height: 15),
                      buildEquipItem(
                        context,
                        'Tópico 2',
                        'Novos controles para acessórios como termostatos e outros',
                      ),
                      SizedBox(height: 15),
                      buildEquipItem(
                        context,
                        'Tópico 3',
                        'Compartilhe o histórico de atividades de acessórios e manutenções',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // SizedBox(height: 40),
            Container(
              height: 48,
              child: AppBtn(
                textColor: AppColors.contentTitleAlt,
                text: "Cadastrar Equipamento",
                bgColor: AppColors.primary,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) {
                      return RegisterBike();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEquipItem(BuildContext context, String title, String subtitle) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: ShapeDecoration(
              color: const Color(0xFFEEF2F6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Center(
              child: FlutterLogo(size: 24),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF121926),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      color: Color(0xB7121926),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
