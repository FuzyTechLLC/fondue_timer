import 'package:flutter/material.dart';
import 'package:fondue_timer/UX/FuzColors.dart';
import 'package:fondue_timer/data/TimerData.dart';

class PresetDisplay extends StatelessWidget {
  final TimerData timerData;
  final Function()? onDoubleTap;
  final Function()? onTap;
  final Function()? onLongPress;

  const PresetDisplay(this.timerData, {Key? key, this.onDoubleTap, this.onTap, this.onLongPress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ColorDisplay(timerData.color),
          ),
          Text(timerData.name),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(timerData.totalTimeString),
          ),
        ],
      ),
    );
  }
}
