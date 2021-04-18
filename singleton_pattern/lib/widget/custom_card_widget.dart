import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final String text;

  const CustomCardWidget({
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 64.0,
        padding: EdgeInsets.all(8),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
