import 'package:abstract_factory_pattern/widget_abstract/islider.dart';
import 'package:flutter/material.dart';

class AndroidSlider implements ISlider {
  @override
  Widget render(double value, ValueSetter<double> onChanged) {
    return Slider(
      activeColor: Colors.black,
      inactiveColor: Colors.grey,
      max: 100.0,
      value: value,
      onChanged: onChanged,
    );
  }
}
