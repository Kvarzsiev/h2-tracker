import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

enum InputType { email, height, weigth, age, text, cpf, smallNumber, sex }

class BasicFormField extends StatefulWidget {
  const BasicFormField({
    super.key,
    this.label,
    this.labelTrailing,
    this.hint,
    this.controller,
    this.obscureText = false,
    this.textInputType = InputType.text,
    this.enabled = true,
  });

  final String? label;
  final String? labelTrailing;
  final String? hint;
  final TextEditingController? controller;
  final bool obscureText;
  final InputType textInputType;
  final bool enabled;

  @override
  BasicFormFieldState createState() => BasicFormFieldState();
}

class BasicFormFieldState extends State<BasicFormField> {
  @override
  void initState() {
    super.initState();

    setState(() {
      switch (widget.textInputType) {
        case InputType.text:
          break;
        case InputType.email:
          break;
        case InputType.height:
          {
            _mask = MaskTextInputFormatter(
                mask: "###", filter: {"#": RegExp(r'[0-9]')});
            break;
          }
        case InputType.weigth:
          {
            _mask = MaskTextInputFormatter(
                mask: "##,##", filter: {"#": RegExp(r'[0-9]')});
            break;
          }
        case InputType.smallNumber:
        case InputType.age:
          {
            _mask = MaskTextInputFormatter(
                mask: "###", filter: {"#": RegExp(r'[0-9]')});
            break;
          }
        case InputType.cpf:
          {
            _mask = MaskTextInputFormatter(
                mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});
            break;
          }
        case InputType.sex:
          {
            _mask = MaskTextInputFormatter(
                mask: "#", filter: {"#": RegExp(r'[mfMF]')});
            break;
          }
      }
    });
  }

  MaskTextInputFormatter? _mask;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  widget.label!,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              if (widget.labelTrailing != null)
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    widget.labelTrailing!,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
            ],
          ),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.obscureText,
          keyboardType: TextInputType.datetime,
          enabled: widget.enabled,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Insira algum valor!';
            }

            if (widget.textInputType == InputType.email) {
              if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                  .hasMatch(value)) {
                return 'Insira um email válido!';
              }
            }

            return null;
          },
          inputFormatters: [if (_mask != null) _mask!],
          onChanged: (String value) {
            if (widget.textInputType == InputType.weigth && _mask != null) {
              if (_mask!.getUnmaskedText().length > 4) {
                _mask!.updateMask(
                    mask: "###,##", filter: {"#": RegExp(r'[0-9]')});
              } else {
                _mask!
                    .updateMask(mask: "##,##", filter: {"#": RegExp(r'[0-9]')});
              }
            }
          },
          decoration: InputDecoration(hintText: widget.hint),
        ),
      ],
    );
  }
}
