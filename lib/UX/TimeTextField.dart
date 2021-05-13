import 'package:flutter/material.dart';

class TimeTextField extends StatelessWidget {
  final TextEditingController controller;

  const TimeTextField(
    this.controller, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Center(
        child: TextField(

          textAlignVertical: TextAlignVertical.center,

          style: Theme.of(context).textTheme.headline3,
          controller: controller,
          maxLength: 2,
          keyboardType: TextInputType.number,
          buildCounter: (_, {required int currentLength, required bool isFocused, required int? maxLength}) => null,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(1),

            hintText: "00",
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
