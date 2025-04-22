import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputText extends StatelessWidget {
  final String placeholder;
  final TextInputType inputType;
  final bool isRequired;
  final String labelText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final Function(String?)? onSaved; // Add onSaved parameter
  final String? Function(String?)? validator; // Add validator parameter

  InputText({
    required this.placeholder,
    this.inputType = TextInputType.text,
    this.isRequired = false,
    this.labelText = '',
    this.onChanged,
    this.controller,
    this.onSaved, // Initialize onSaved
    this.validator, // Initialize validator
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: TextStyle(
              color: Color(0xFF121926),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          TextFormField(
            controller: controller,
            onChanged: onChanged,
            onSaved: onSaved, // Add onSaved to TextFormField
            validator: validator, // Add validator to TextFormField
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: TextStyle(
                color: Color(0xA3202939),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Color(0x14202939),
                  width: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
