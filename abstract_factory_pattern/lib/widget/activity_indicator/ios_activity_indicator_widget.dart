import 'package:abstract_factory_pattern/widget_abstract/iactivity_indicator.dart';
import 'package:flutter/cupertino.dart';

class IosActivityIndicator implements IActivityIndicator {
  @override
  Widget render() {
    return CupertinoActivityIndicator();
  }
}
