import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

enum InputType { email, height, weigth, age, text, cpf, smallNumber }

class BasicFormField extends StatelessWidget {
  const BasicFormField(
      {super.key,
      this.label,
      this.controller,
      this.obscureText = false,
      this.textInputType = InputType.text});

  final String? label;
  final TextEditingController? controller;
  final bool obscureText;
  final InputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              label!,
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

            if (textInputType == InputType.email) {
              if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                  .hasMatch(value)) {
                return 'Insira um email válido!';
              }
            }

            return null;
          },
          inputFormatters: [
            if (textInputType == InputType.cpf)
              MaskTextInputFormatter(
                  mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')}),
            if (textInputType == InputType.height)
              MaskTextInputFormatter(
                  mask: "###", filter: {"#": RegExp(r'[0-9]')}),
            if (textInputType == InputType.weigth)
              MaskTextInputFormatter(
                  mask: "###,##", filter: {"#": RegExp(r'[0-9]')}),
            if (textInputType == InputType.age ||
                textInputType == InputType.smallNumber)
              MaskTextInputFormatter(
                  mask: "###", filter: {"#": RegExp(r'[0-9]')}),
          ],
        ),
      ],
    );
  }
}
