import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fondue_timer/data/ClkTimer.dart';
import 'package:fondue_timer/data/TimerData.dart';

class TimerBlock extends StatefulWidget {
  final TimerData data;
  @override
  _TimerBlockState createState() => _TimerBlockState();

  TimerBlock.fromTimerData(this.data);
}

class _TimerBlockState extends State<TimerBlock> {
  late Timer tmpTimer;
  void initState() {
    super.initState();
    tmpTimer = Timer.periodic(
        Duration(milliseconds: 800), (Timer timer) => setState(() {}));

  }
  @override
  void dispose() {
    tmpTimer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 75,
      width: 100,
      decoration: ShapeDecoration(
          shape: Border.all(color: Colors.transparent),),
      child: Material(
        color: widget.data.color,
        child: InkWell(
          onTap: () {
            if (widget.data.time.remainingTime < Duration.zero) {
              widget.data.time.pause();
              widget.data.time.reset();
            } else {
              widget.data.time.start();
            }
            setState(() {});
          },
          child: FittedBox(
            fit: BoxFit.contain,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(widget.data.time.paused
                  ? widget.data.name
                  : widget.data.time.remainingTime.inSeconds.toString()),
            ),
          ),
        ),
      ),
    );
  }
}
