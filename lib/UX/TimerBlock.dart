import 'dart:async';

import 'package:flutter/material.dart';

import '../data/ClkTimer.dart';

class TimerBlock extends StatefulWidget {
  int? time;
  String? name;
  Color? color;
  @override
  _TimerBlockState createState() => _TimerBlockState();

  TimerBlock({Key? key, this.name, this.time, this.color}) : super(key: key);
}

class _TimerBlockState extends State<TimerBlock> {
  void initState() {
    super.initState();
    Timer.periodic(
        Duration(milliseconds: 800), (Timer timer) => setState(() {}));
    clkTimer = ClkTimer(timeDur: Duration(seconds: widget.time!));
  }

  ClkTimer? clkTimer;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: 75,
        width: 100,
        decoration: ShapeDecoration(
            shape: Border.all(color: Colors.transparent),),
        child: Material(
          color: widget.color,
          child: InkWell(
            onTap: () {
              if (clkTimer!.remainingTime < Duration.zero) {
                clkTimer!.pause();
                clkTimer!.reset();
              } else {
                clkTimer!.start();
              }
              setState(() {});
            },
            child: FittedBox(
              fit: BoxFit.contain,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(clkTimer!.paused
                    ? widget.name!
                    : clkTimer!.remainingTime.inSeconds.toString()),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
