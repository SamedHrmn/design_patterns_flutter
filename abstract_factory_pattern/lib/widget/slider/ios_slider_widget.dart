import 'package:abstract_factory_pattern/widget_abstract/islider.dart';
import 'package:flutter/cupertino.dart';

class IosSlider implements ISlider {
  @override
  Widget render(double value, ValueSetter<double> onChanged) {
    return CupertinoSlider(
      max: 100.0,
      value: value,
      onChanged: onChanged,
    );
  }
}
