import 'package:flutter/material.dart';

class StepperUI extends StatefulWidget {
  final Function updatePrice;
  const StepperUI({
    Key key,
    @required this.updatePrice,
  }) : super(key: key);

  @override
  _StepperState createState() => _StepperState();
}

class _StepperState extends State<StepperUI> {
  // ignore: non_constant_identifier_names
  int current_value = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (current_value > 1) {
              setState(() {
                current_value -= 1;
              });
              widget.updatePrice(current_value);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(4)),
            child: Text(
              '-',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            current_value.toString(),
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              current_value += 1;
            });
            widget.updatePrice(current_value);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(4)),
            child: Text(
              '+',
              style: TextStyle(color: Colors.red, fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}
