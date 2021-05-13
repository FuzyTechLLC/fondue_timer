import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fondue_timer/UX/CreateTimerDialog.dart';
import 'package:fondue_timer/UX/LoadPresetDialog.dart';
import 'package:fondue_timer/UX/TimerBlock.dart';
import 'package:fondue_timer/UX/ViewPresetsDialog.dart';
import 'package:fondue_timer/data/TimerData.dart';
import 'package:fondue_timer/data/ClkTimer.dart';

class TimerViewPage extends StatefulWidget {
  @override
  _TimerViewPageState createState() => _TimerViewPageState();
}

class _TimerViewPageState extends State<TimerViewPage> {
  late List<TimerData> dataList;

  @override
  void initState() {
    super.initState();
    dataList = [TimerData(name: 'steak', color: Colors.blue, time: ClkTimer(duration: Duration(seconds: 15)))];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150.0,
          ),
          itemCount: dataList.length,
          itemBuilder: (BuildContext context, int index) => TimerBlock.fromTimerData(dataList[index], ()=>setState(()=>dataList.removeAt(index)))),
      floatingActionButton: _optionsFAB(),
    );
  }

  SpeedDial _optionsFAB() {
    return SpeedDial(
      tooltip: "menu",
      icon: Icons.menu,
      activeIcon: Icons.clear,
      activeBackgroundColor: Theme.of(context).primaryColor,
      activeForegroundColor: Theme.of(context).accentColor,
      children: [
        _loadPreset(),
        _viewPresets(),
        _newTimer(),
      ],
    );
  }

  SpeedDialChild _newTimer() => _baseSpeedDialChild(
        context,
        child: Icon(Icons.add),
        label: "New Timer",
        onTap: () => showDialog(context: context, builder: (context) => CreateTimerDialog()).then((value) {
          if (value != null) setState(() => dataList.add(value));
        }),
      );
  SpeedDialChild _viewPresets() => _baseSpeedDialChild(
        context,
        child: Icon(Icons.list),
        label: "View Presets",
        onTap: () => showDialog(context: context, builder: (context) => ViewPresetsDialog()),
      );
  SpeedDialChild _loadPreset() => _baseSpeedDialChild(
        context,
        child: Icon(Icons.timer),
        label: "Load Preset",
        onTap: () => showDialog(context: context, builder: (context) => LoadPresetDialog()).then((value) {
          if (value != null) setState(() => dataList.add(value));
        }),
      );
}

SpeedDialChild _baseSpeedDialChild(BuildContext context, {Widget? child, VoidCallback? onTap, VoidCallback? onLongPress, ShapeBorder? shape, String? label, Key? key}) => SpeedDialChild(
      child: child,
      backgroundColor: Theme.of(context).primaryColor,
      foregroundColor: Theme.of(context).accentColor,
      elevation: null,
      onTap: onTap,
      onLongPress: onLongPress,
      shape: shape,
      label: label,
      labelBackgroundColor: Theme.of(context).primaryColor,
      key: key,
    );
