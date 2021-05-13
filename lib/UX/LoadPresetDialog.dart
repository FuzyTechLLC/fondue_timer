import 'package:flutter/material.dart';
import 'package:fondue_timer/FuzSingleton.dart';
import 'package:fondue_timer/UX/PresetDisplay.dart';

class LoadPresetDialog extends StatefulWidget {
  @override
  _LoadPresetDialogState createState() => _LoadPresetDialogState();
}

class _LoadPresetDialogState extends State<LoadPresetDialog> {
  late Color chosenColor;
  late TextEditingController secondController;
  late TextEditingController minuteController;
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<PresetDisplay> presetViews = [];

    for (int i = 0; i < FuzSingleton().presets.length; i++) {
      presetViews.add(PresetDisplay(FuzSingleton().presets[i], onTap: () => Navigator.pop(context, FuzSingleton().presets[i]),));
    }
    return SimpleDialog(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: BorderSide(color: Colors.white, width: 3)),
      title: Text("Presets"),
      children: [...presetViews],
    );
  }
}
