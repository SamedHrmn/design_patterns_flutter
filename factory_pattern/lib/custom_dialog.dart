import 'package:flutter/material.dart';

abstract class CustomDialogFactory {
  String getTitle();
  Widget create(BuildContext context);

  Future<void> show(BuildContext context) async {
    var dialog = create(context);

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => dialog,
    );
  }
}
