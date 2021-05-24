import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fondue_timer/UX/TimerOptionsDialog.dart';
import 'package:fondue_timer/data/TimerData.dart';
import 'package:google_fonts/google_fonts.dart';

class TimerBlock extends StatefulWidget {
  final TimerData data;
  final Function() deleteThis;

  

  @override
  _TimerBlockState createState() => _TimerBlockState();

  TimerBlock.fromTimerData(this.data, this.deleteThis);
}

class _TimerBlockState extends State<TimerBlock> {
  late Timer tmpTimer;
  void initState() {
    super.initState();
    tmpTimer = Timer.periodic(Duration(milliseconds: 500), (Timer timer) => setState(() {}));
  }

  @override
  void dispose() {
    tmpTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Flexible(
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: ShapeDecoration(color: widget.data.color == Colors.black ? Colors.white : widget.data.color, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                  child: Material(
                    color: widget.data.color,
                    child: InkWell(

                      onTap: () {
                        if (widget.data.time.remainingTime < Duration.zero) {
                          widget.data.time.reset();
                        } else if (!widget.data.time.paused) {
                          widget.data.time.pause();
                        } else {
                          widget.data.time.start();
                        }
                        setState(() {});
                      },
                      onDoubleTap: () => showDialog(context: context, builder: (context) => TimerOptionDialog(widget.data)).then((value) {
                        if (value != null) {
                          if (value == "DELETE") {
                            widget.deleteThis();
                          } else if (value.runtimeType == TimerData) {
                            widget.data.color = value.color;
                            widget.data.time = value.time;
                            widget.data.name = value.name;
                            setState(() {});
                          }
                        }
                      }),
                      onLongPress: () => setState(() => widget.data.time.reset()),
                      child: FittedBox(
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.fitWidth,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text((widget.data.remainingTimeString), style: GoogleFonts.roboto(color: widget.data.color == Colors.white ? Colors.black : Colors.white)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            widget.data.name,
            style: GoogleFonts.ubuntu(),
          )
        ],
      ),
    );
  }
}
