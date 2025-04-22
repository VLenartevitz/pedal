import 'package:flutter/material.dart';
import '../commons/app_colors.dart';
import '../widgets/app_btn.dart';
import '../widgets/app_checkbox.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  _QuestionScreen createState() => _QuestionScreen();
}

class _QuestionScreen extends State<QuestionScreen> {


  final Map<String, bool> _options = {
    'Manutenção do Meu Equipamento': false,
    'Melhorar Minha Performance': false,
    'Participar de Eventos e Competições': false,
    'Socializar com Pessoas que Pedalam': false,
    'Outros': false,
  };
  bool get _optionSelected {
    return _options.containsValue(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 56.0, bottom: 48.0, left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Qual seu principal objetivo com a Pedal Service?',
                style: TextStyle(
                  color: AppColors.contentTitle,
                  fontSize: 32,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Selecione quantas opções desejar',
                style: TextStyle(
                  color: AppColors.contentBase,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: ListView(
                  children: _options.keys.map((String key) {
                    return Column(
                      children: [
                        AppCheckbox(
                          text: key,
                          isChecked: _options[key]!,
                          onChanged: (bool? value) {
                            setState(() {
                              _options[key] = value!;
                            });
                          },
                        ),
                        const SizedBox(height: 8),
                      ],
                    );
                  }).toList(),
                ),
              ),
              Container(
                height: 48,
                child: AppBtn(
                  textColor: AppColors.contentTitleAlt,
                  text: "Continuar",
                  icon: const Icon(
                    Icons.arrow_forward_outlined,
                    color: AppColors.contentTitleAlt,
                  ),
                  bgColor:
                  _optionSelected ? AppColors.primary : AppColors.disabled,
                  onPressed: _optionSelected
                      ? () {
                    Navigator.pushNamed(context, "/welcome");
                  }
                      : null,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
