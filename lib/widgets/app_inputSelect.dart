import '../commons/app_colors.dart';
import 'package:flutter/material.dart';

import '../models/bike_type_model.dart';

class InputSelect extends StatefulWidget {
  final String labelText;
  final List<BikeTypeModel> options;
  final BikeTypeModel? selectedValue;
  final Function(BikeTypeModel?)? onChanged;
  final String hintText;
  final Future<void> Function()? onTap;

  InputSelect({
    required this.labelText,
    required this.options,
    this.selectedValue,
    this.onChanged,
    required this.hintText,
    this.onTap,
  });

  @override
  _InputSelectState createState() => _InputSelectState();
}

class _InputSelectState extends State<InputSelect> {
  BikeTypeModel? _selectedValue; // Valor selecionado

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: const TextStyle(
            color: AppColors.contentTitle,
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<BikeTypeModel>(
          borderRadius: BorderRadius.circular(8),
          value: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
          items: widget.options.map((bikeType) {
            return DropdownMenuItem<BikeTypeModel>(
              value: bikeType,
              child: Text(
                bikeType.name,
                style: const TextStyle(
                  color: AppColors.contentBase,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          }).toList(),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              color: AppColors.placeholder,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.primary,
              ),
            ),
          ),
          icon: const Icon(
            Icons.arrow_drop_down,
            color: AppColors.contentTitle,
          ),
          style: const TextStyle(
            color: AppColors.primary,
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
          dropdownColor: Colors.white,
          onTap: () async {
            if (widget.onTap != null) {
              await widget.onTap!(); // Executa o onTap dinâmico se fornecido
            }
          },
        ),
      ],
    );
  }
}
