import 'package:abstract_factory_pattern/widget_abstract/iactivity_indicator.dart';
import 'package:abstract_factory_pattern/widget_abstract/islider.dart';
import 'package:abstract_factory_pattern/widget_abstract/iswitch.dart';

abstract class IWidgetsFactory {
  String getTitle();
  IActivityIndicator createActivityIndicator();
  ISlider createSlider();
  ISwitch createSwitch();
}
