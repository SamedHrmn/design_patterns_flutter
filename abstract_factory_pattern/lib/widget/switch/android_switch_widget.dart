import 'package:abstract_factory_pattern/widget_abstract/iswitch.dart';
import 'package:flutter/material.dart';

class AndroidSwitch implements ISwitch {
  @override
  Widget render({@required bool value, @required ValueSetter<bool> onChanged}) {
    return Switch(
      activeColor: Colors.black,
      value: value,
      onChanged: onChanged,
    );
  }
}
