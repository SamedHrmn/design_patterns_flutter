import 'package:factory_pattern/custom_dialog.dart';
import 'package:flutter/cupertino.dart';

class IOSAlertDialog extends CustomDialogFactory {
  @override
  String getTitle() {
    return 'iOS Alert Dialog';
  }

  @override
  Widget create(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(getTitle()),
      content: Text('This is cupertino-style alert dialog'),
      actions: <Widget>[
        CupertinoButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        )
      ],
    );
  }
}
