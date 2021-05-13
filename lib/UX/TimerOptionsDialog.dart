import 'package:flutter/material.dart';
import 'package:fondue_timer/FuzSingleton.dart';
import 'package:fondue_timer/UX/ColorChangeButton.dart';
import 'package:fondue_timer/UX/PresetDisplay.dart';
import 'package:fondue_timer/data/ClkTimer.dart';
import 'package:fondue_timer/data/TimerData.dart';

import 'TimeTextField.dart';

class TimerOptionDialog extends StatefulWidget {
  final TimerData timerData;

  const TimerOptionDialog(
    this.timerData, {
    Key? key,
  }) : super(key: key);
  @override
  _TimerOptionDialogState createState() => _TimerOptionDialogState();
}

class _TimerOptionDialogState extends State<TimerOptionDialog> {
  late Color chosenColor;
  late TextEditingController secondController;
  late TextEditingController minuteController;
  late TextEditingController nameController;


  @override
  void initState() {
    super.initState();
    chosenColor = widget.timerData.color;
    secondController = TextEditingController(text: (widget.timerData.time.timeDur.inSeconds%60).toString());
    minuteController = TextEditingController(text: widget.timerData.time.timeDur.inMinutes.toString());
    nameController = TextEditingController(text: widget.timerData.name);
  }

  @override
  Widget build(BuildContext context) {
    List<PresetDisplay> presetViews = [];

    for (int i = 0; i < FuzSingleton().presets.length; i++) {
      presetViews.add(PresetDisplay(
        FuzSingleton().presets[i],
        onTap: () => Navigator.pop(context, FuzSingleton().presets[i]),
      ));
    }
    return SimpleDialog(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: BorderSide(color: Colors.white, width: 3)),
      title: Text("Options"),
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
        TextButton(
          child: Text("DELETE"),
          onPressed: () =>Navigator.pop(context, "DELETE"),
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
                    TimerData(name: nameController.text, color: chosenColor, time: ClkTimer(duration: Duration(minutes: int.parse(minuteController.text), seconds: int.parse(secondController.text)))),
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
