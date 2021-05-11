import 'package:flutter/material.dart';
import 'package:fondue_timer/UX/TimerBlock.dart';
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
    dataList = [TimerData(name: 'steak', color: Colors.blue, time: ClkTimer(timeDur: Duration(seconds:15))),TimerData(name: 'chicken', color: Colors.red, time: ClkTimer(timeDur: Duration(seconds: 2))),TimerData(name: 'chicken', color: Colors.red, time: ClkTimer(timeDur: Duration(seconds: 2))),TimerData(name: 'chicken', color: Colors.red, time: ClkTimer(timeDur: Duration(seconds: 2))),TimerData(name: 'chicken', color: Colors.red, time: ClkTimer(timeDur: Duration(seconds: 2))),TimerData(name: 'chicken', color: Colors.red, time: ClkTimer(timeDur: Duration(seconds: 2)))];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150.0, crossAxisSpacing: 20, mainAxisSpacing: 20), itemCount: dataList.length, itemBuilder: (BuildContext context, int index) =>  TimerBlock.fromTimerData(dataList[index])),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: (){
        setState(() {
          dataList.add(TimerData(name:"chicken", color: Colors.red, time: ClkTimer(timeDur: Duration(seconds: 2))));
        });
        }),

    );
  }
}

