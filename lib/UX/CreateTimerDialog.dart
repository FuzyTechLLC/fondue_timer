import 'package:flutter/material.dart';
import 'package:fondue_timer/UX/ColorChangeButton.dart';
import 'package:fondue_timer/UX/TimeTextField.dart';
import 'package:fondue_timer/data/ClkTimer.dart';
import 'package:fondue_timer/data/TimerData.dart';

class CreateTimerDialog extends StatefulWidget {
  final String title;

  const CreateTimerDialog({Key? key, this.title = "New Timer"}) : super(key: key);

  @override
  _CreateTimerDialogState createState() => _CreateTimerDialogState();
}

class _CreateTimerDialogState extends State<CreateTimerDialog> {
  late Color chosenColor;
  late TextEditingController secondController;
  late TextEditingController minuteController;
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    chosenColor = Colors.black;
    secondController = TextEditingController();
    minuteController = TextEditingController();
    nameController = TextEditingController();
  }

  int _parseIntOrZero(String val) {
    try {
      return int.parse(val);
    } catch (e) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: BorderSide(color: Colors.white, width: 3)),
      title: Text(widget.title),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                width: 14,
              ),
              ColorChangeButton(
                displyColor: chosenColor,
                onChange: (c) => setState(() => chosenColor = c),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TimeTextField(minuteController),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Icon(
                    Icons.fiber_manual_record,
                    size: 13,
                  ),
                  Icon(
                    Icons.fiber_manual_record,
                    size: 13,
                  ),
                ],
              ),
            ),
            TimeTextField(secondController),
          ],
        ),
        ButtonBar(
          children: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text("OK"),
              onPressed: () {
                try {
                  Navigator.pop(
                    context,
                    TimerData(name: nameController.text, color: chosenColor, time: ClkTimer(duration: Duration(minutes: _parseIntOrZero(minuteController.text), seconds: _parseIntOrZero(secondController.text)))),
                  );
                } catch (_) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("invalid data"),
                    duration: Duration(milliseconds: 800),
                  ));
                }
              },
            ),
          ],
        )
      ],
    );
  }
}
