import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:h2_tracker_client/h2_tracker_client.dart';
import 'package:h2_tracker_flutter/components/exercise_card.dart';
import 'package:h2_tracker_flutter/extensions/date.dart';
import 'package:h2_tracker_flutter/extensions/string.dart';

class NewTrainHistory extends StatefulWidget {
  const NewTrainHistory({
    super.key,
    this.historico,
    required this.suggestionsCallback,
    required this.selectDate,
    required this.selectTrain,
    required this.selectedTrain,
  });

  final TreinoHistorico? historico;
  final List<Treino>? Function(String) suggestionsCallback;
  final void Function(String, DateTime) selectDate;
  final void Function(Treino) selectTrain;
  final Treino selectedTrain;

  @override
  TrainingHistoryState createState() => TrainingHistoryState();
}

class TrainingHistoryState extends State<NewTrainHistory> {
  final TextEditingController _typeAheadController = TextEditingController();

  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  Treino? _selectedTrain;

  @override
  void initState() {
    super.initState();

    load();
  }

  void load() {
    setState(() {
      _typeAheadController.text = widget.selectedTrain.descricao;
      _selectedTrain = widget.selectedTrain;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final hasHistory = widget.historico != null;

    return SizedBox(
      height: size.height * .7,
      width: size.width * .7,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (!hasHistory) ...[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TypeAheadField<Treino>(
                  itemBuilder: (context, train) {
                    return ListTile(
                      title: Text(train.descricao),
                      subtitle: Text(train.objetivo.toReadableTitle()),
                    );
                  },
                  controller: _typeAheadController,
                  onSelected: (value) async {
                    setState(() {
                      _typeAheadController.text = value.descricao;
                      _selectedTrain = value;
                    });
                    widget.selectTrain(value);
                  },
                  suggestionsCallback: widget.suggestionsCallback),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextFormField(
                controller: _startDateController,
                decoration: const InputDecoration(
                  labelText: 'Select Date',
                  suffixIcon: Icon(Icons.calendar_today), // Calendar icon
                ),
                readOnly: true,
                onTap: () {
                  _selectDate(context, 'start');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextFormField(
                controller: _endDateController, // Assign the controller
                decoration: const InputDecoration(
                  labelText: 'Select Date',
                  suffixIcon: Icon(Icons.calendar_today), // Calendar icon
                ),
                readOnly: true, // Make the field read-only
                onTap: () {
                  _selectDate(context, 'end');
                },
              ),
            ),
          ] else ...[
            const SizedBox(
              height: 24,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Iniciado em: ${widget.historico!.horarioInicio.formatToPtBr(PtBrFormat.medium)}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 20),
                textAlign: TextAlign.start,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Finalizado em: ${widget.historico!.horarioFim.formatToPtBr(PtBrFormat.medium)}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 20),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
          if (_selectedTrain != null &&
              _selectedTrain!.treinoExercicios != null)
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: _selectedTrain!.treinoExercicios!.length,
                itemBuilder: (context, index) {
                  final exercise = _selectedTrain!.treinoExercicios![index];
                  return ExerciseCard(
                      exercise: exercise.exercicio!,
                      trainExercise: exercise,
                      insertTrainExerciseHistory: hasHistory ? false : true,
                      trainExerciseHistory: hasHistory
                          ? widget.historico!.treinoHistoricoExercicios!
                              .firstWhere((element) =>
                                  element.treinoExercicioId == exercise.id)
                          : null);
                },
              ),
            )
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, String date) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now().subtract(
        const Duration(days: 7),
      ), // Minimum date
      lastDate: DateTime.now().add(const Duration(days: 1)), // Maximum date
      initialDate: DateTime.now(),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        // Combine date and time
        final selectedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        if (date == 'start') {
          setState(() {
            _startDateController.text =
                selectedDateTime.formatToPtBr(PtBrFormat.medium);
          });
          widget.selectDate(date, selectedDateTime);
        } else {
          setState(() {
            _endDateController.text =
                selectedDateTime.formatToPtBr(PtBrFormat.medium);
          });
          widget.selectDate(date, selectedDateTime);
        }
      }
    }
  }
}
