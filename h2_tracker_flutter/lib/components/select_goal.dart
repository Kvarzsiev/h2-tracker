import 'package:flutter/material.dart';

class SelectGoal extends StatefulWidget {
  const SelectGoal({super.key, required this.updateValue});

  final void Function(String newValue) updateValue;

  @override
  SelectGoalState createState() => SelectGoalState();
}

class SelectGoalState extends State<SelectGoal> {
  String _dropdownValue = 'PERDA_DE_PESO';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: DropdownButton<String>(
                value: _dropdownValue,
                padding: const EdgeInsets.all(8),
                isExpanded: true,
                onChanged: (String? value) {
                  if (value != null) {
                    // This is called when the user selects an item.
                    setState(() {
                      _dropdownValue = value;
                    });

                    widget.updateValue(value);
                  }
                },
                focusColor: Colors.lightBlueAccent[100]?.withOpacity(0.1),
                items: const [
                  DropdownMenuItem<String>(
                    key: Key('PERDA_DE_PESO'),
                    value: 'PERDA_DE_PESO',
                    child: Text('Perda de Peso'),
                  ),
                  DropdownMenuItem<String>(
                    key: Key('GANHO_DE_PESO'),
                    value: 'GANHO_DE_PESO',
                    child: Text('Ganho de Peso'),
                  ),
                  DropdownMenuItem<String>(
                    key: Key('GANHO_DE_MASSA_MAGRA'),
                    value: 'GANHO_DE_MASSA_MAGRA',
                    child: Text('Ganho de Massa Magra'),
                  ),
                  DropdownMenuItem<String>(
                    key: Key('MANUTENCAO_DE_PESO'),
                    value: 'MANUTENCAO_DE_PESO',
                    child: Text('Manutenção de Peso'),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
