import 'package:flutter/material.dart';
import 'package:h2_tracker_flutter/utils/decimal_text_input_formatter.dart';

class BasicFormField extends StatelessWidget {
  const BasicFormField(
      {super.key,
      required this.label,
      this.controller,
      this.obscureText = false,
      this.textInputType = TextInputType.text});

  final String label;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: TextInputType.datetime,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Insira algum valor!';
            }
            return null;
          },
          inputFormatters: [
            if (textInputType == TextInputType.number) ...[
              DecimalTextInputFormatter(decimalRange: 2)
            ]
          ],
        ),
      ],
    );
  }
}
