import 'package:flutter/material.dart';
import 'package:fondue_timer/UX/TimerBlock.dart';


class TimerViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Spacer(),
              TimerBlock(name: "Steak", time: 5, color: Colors.red,),
              Spacer(),
              TimerBlock(name: "Pork", time: 30, color: Colors.cyan,),
              Spacer(),
              TimerBlock(name: "Chicken", time: 45, color: Colors.amber,),
              Spacer(),
            ],
          ),
        ),
      ),

    );
  }
}