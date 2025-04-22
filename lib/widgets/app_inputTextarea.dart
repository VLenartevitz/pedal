import 'package:flutter/material.dart';

class InputTextArea extends StatelessWidget {
  final String placeholder;
  final Function(String?)? onSaved; // Add onSaved parameter
  final Function(String)? onChanged;

  InputTextArea({
    required this.placeholder,
    this.onSaved, // Initialize onSaved
    this.onChanged,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 118,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Observações',
            style: TextStyle(
              color: Color(0xFF121926),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              onSaved: onSaved,
              maxLines: null,
              decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: TextStyle(
                  color: Color(0xA3202939),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
                contentPadding: EdgeInsets.all(16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Color(0x14202939),
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
