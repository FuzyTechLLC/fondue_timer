import 'package:flutter/material.dart';
import 'package:fondue_timer/FuzSingleton.dart';
import 'package:fondue_timer/UX/CreateTimerDialog.dart';
import 'package:fondue_timer/UX/PresetDisplay.dart';
import 'package:fondue_timer/data/PresetData.dart';

class ViewPresetsDialog extends StatefulWidget {
  @override
  _ViewPresetsDialogState createState() => _ViewPresetsDialogState();
}

class _ViewPresetsDialogState extends State<ViewPresetsDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> presetViews = [];

    for (int i = 0; i < FuzSingleton().presets.length; i++) {
      presetViews.add(InkWell(
          onTap: () {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Column(children: [Text("Delete this preset?"), PresetDisplay(FuzSingleton().presets[i])]),
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: BorderSide(color: Colors.white, width: 3)),
                actions: [
                  TextButton(onPressed: () => Navigator.pop(context), child: Text("No")),
                  TextButton(
                      onPressed: () {
                        FuzSingleton().presets.removeAt(i);
                        FuzSingleton().savePresets();
                        Navigator.pop(context);
                      },
                      child: Text("Yes")),
                ],
              ),
            );
          },
          child: PresetDisplay(FuzSingleton().presets[i])));
    }
    return SimpleDialog(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: BorderSide(color: Colors.white, width: 3)),
      title: Text("Presets"),
      children: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              showDialog(
                  context: context,
                  builder: (context) => CreateTimerDialog(
                        title: "New Preset",
                      )).then((value) {
                if (value != null) {
                  FuzSingleton().presets.add(PresetData(value.name, value.time.duration, value.color));
                  FuzSingleton().savePresets();
                }
              });
            },
            child: Text("ADD")),
        ...presetViews
      ],
    );
  }
}
