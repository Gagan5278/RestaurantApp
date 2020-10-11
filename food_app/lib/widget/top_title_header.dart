import 'package:flutter/material.dart';

class TopTitleHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color color;
  TopTitleHeader(
      {Key key,
      @required this.title,
      @required this.subTitle,
      @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.green.withAlpha(100)),
          color: Colors.white.withAlpha(150),
          borderRadius: BorderRadius.circular(24),
        ),
        child: RichText(
          text: TextSpan(
            text: title, //'Healthy ',
            style: TextStyle(
                fontSize: 32, color: this.color, fontWeight: FontWeight.w600),
            children: <TextSpan>[
              TextSpan(
                  text: subTitle, //'food',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w300)),
            ],
          ),
        ),
      ),
    );
  }
}
