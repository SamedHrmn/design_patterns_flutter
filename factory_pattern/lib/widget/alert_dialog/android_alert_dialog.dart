import 'package:factory_pattern/custom_dialog.dart';
import 'package:flutter/material.dart';

class AndroidAlertDialog extends CustomDialogFactory {
  @override
  String getTitle() {
    return 'Android Alert Dialog';
  }

  @override
  Widget create(BuildContext context) {
    return AlertDialog(
      title: Text(getTitle()),
      content: Text('This is material-style alert dialog'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        )
      ],
    );
  }
}
