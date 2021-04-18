import 'package:abstract_factory_pattern/widget_abstract/iswitch.dart';
import 'package:flutter/cupertino.dart';

class IosSwitch implements ISwitch {
  @override
  Widget render({@required bool value, @required ValueSetter<bool> onChanged}) {
    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
    );
  }
}
