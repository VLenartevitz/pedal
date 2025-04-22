import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Para formatar a data
import 'package:pedalserviceapp/controllers/bike_controller.dart';
import 'package:pedalserviceapp/controllers/bike_type_controller.dart';
import 'package:pedalserviceapp/models/bike_type_model.dart';
import 'package:pedalserviceapp/screens/Home.dart';
import '../commons/app_colors.dart';
import '../widgets/app_btn.dart';
import '../widgets/app_inputSelect.dart';
import '../widgets/app_inputText.dart';
import '../widgets/app_inputTextarea.dart';

class RegisterBike extends StatefulWidget {
  @override
  State<RegisterBike> createState() => _RegisterBikeState();
}

class _RegisterBikeState extends State<RegisterBike> {
  final _formKey = GlobalKey<FormState>();

  final bikeTypeController = BikeTypeController();
  var bikeController = BikeController();
  Future<List<BikeTypeModel>>? typeModel;
  BikeTypeModel? _selectedType;
  String nickname = '';
  String model = '';
  String weight = '';
  String year = '';
  String buy_date = ''; // Data de compra como string
  String notes = '';

  @override
  void initState() {
    super.initState();
    typeModel = bikeTypeController.fetchBikeType();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      // Formatando a data como string no formato "yyyy-MM-dd"
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        buy_date = formattedDate; // Armazenando a data como string
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.9,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.contentTitleAlt,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 155,
                  height: 50,
                  child: AppBtn(
                    textColor: AppColors.primary,
                    text: "Cancelar",
                    bgColor: AppColors.contentTitleAlt,
                    onPressed: () {},
                  ),
                ),
                Container(
                  width: 130,
                  height: 50,
                  child: AppBtn(
                    textColor: AppColors.contentTitleAlt,
                    text: "Salvar",
                    bgColor: AppColors.primary,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        bikeController.store(_selectedType!.id, nickname, model,
                            weight, year, buy_date, notes);
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          builder: (context) {
                            return Home();
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<BikeTypeModel>>(
                future: typeModel,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Erro: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                        child: Text('Nenhum tipo de bicicleta encontrado'));
                  } else {
                    List<BikeTypeModel> bikeTypes = snapshot.data!;
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          const Text(
                            'Cadastrar Bicicleta',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF121926),
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Image.asset(
                            "assets/images/Trek-Bike-PNG-Picture 1.png",
                          ),
                          const SizedBox(height: 20),
                          Form(
                            key: _formKey,
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: ShapeDecoration(
                                color: const Color(0xFFEEF2F6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: Column(
                                children: [
                                  InputSelect(
                                    labelText: 'Tipo*',
                                    options: bikeTypes,
                                    selectedValue: _selectedType,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedType = value;
                                      });
                                    },
                                    hintText: 'Selecione um tipo de bicicleta',
                                  ),
                                  const SizedBox(height: 20),
                                  InputText(
                                    placeholder: 'Insira um apelido',
                                    inputType: TextInputType.text,
                                    labelText: "Apelido*",
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Por favor, insira um apelido';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      nickname = value!;
                                    },
                                    onChanged: (value) {
                                      nickname = value;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  InputText(
                                    placeholder: 'E-VIBE ELITE FS PRO',
                                    inputType: TextInputType.text,
                                    labelText: "Modelo",
                                    onSaved: (value) {
                                      model = value!;
                                    },
                                    onChanged: (value) {
                                      model = value;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Peso',
                                                style: TextStyle(
                                                  color: Color(0xFF121926),
                                                  fontSize: 14,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              TextFormField(
                                                onSaved: (value) {
                                                  weight = value!;
                                                },
                                                onChanged: (value) {
                                                  weight = value;
                                                },
                                                decoration: InputDecoration(
                                                  hintText: '0,0 kg',
                                                  hintStyle: const TextStyle(
                                                    color: Color(0xA3202939),
                                                    fontSize: 14,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 16),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0x14202939),
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Ano',
                                                style: TextStyle(
                                                  color: Color(0xFF121926),
                                                  fontSize: 14,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              TextFormField(
                                                onSaved: (value) {
                                                  year = value!;
                                                },
                                                onChanged: (value) {
                                                  year = value;
                                                },
                                                decoration: InputDecoration(
                                                  hintText: '2024',
                                                  hintStyle: const TextStyle(
                                                    color: Color(0xA3202939),
                                                    fontSize: 14,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 16),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0x14202939),
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),

                                  // Campo de data
                                  GestureDetector(
                                    onTap: () => _selectDate(context),
                                    child: AbsorbPointer(
                                      child: InputText(
                                        placeholder: 'dd/mm/aa',
                                        inputType: TextInputType.datetime,
                                        labelText: "Data da Compra",
                                        controller: TextEditingController(
                                            text: buy_date),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 10),
                                  InputTextArea(
                                    placeholder: "Insira as observações",
                                    onSaved: (value) {
                                      notes = value!;
                                    },
                                    onChanged: (value) {
                                      notes = value;
                                    },
                                  ),
                                  // a
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
