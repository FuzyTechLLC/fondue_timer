import 'package:flutter/material.dart';
import 'package:fondue_timer/UX/FuzColors.dart';
import 'package:fondue_timer/data/ColorsOptions.dart';

class ColorChangeButton extends StatelessWidget {
  final Function(Color) onChange;
  final Color displyColor;

  const ColorChangeButton({Key? key, required this.onChange, required this.displyColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        child: PopupMenuButton(
          child: Row(
            children: [
              ColorDisplay(displyColor),
              Icon(Icons.arrow_drop_down),
            ],
          ),
          itemBuilder: (context) {
            List<PopupMenuEntry<Color>> vals = [];
            for (int i = 0; i < ColorOptions.colors.length; i++) {
              vals.add(PopupMenuItem<Color>(
                value: ColorOptions.colors[i],
                child: Center(child: ColorDisplay(ColorOptions.colors[i])),
              ));
            }
            return vals;
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: BorderSide(color: Colors.white)),
          color: Colors.black,
          onSelected: onChange,
        ),
      ),
    );
  }
}
