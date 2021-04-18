import 'package:abstract_factory_pattern/iwidgets_factory.dart';
import 'package:abstract_factory_pattern/widget/activity_indicator/ios_activity_indicator_widget.dart';
import 'package:abstract_factory_pattern/widget/slider/ios_slider_widget.dart';
import 'package:abstract_factory_pattern/widget/switch/ios_switch_widget.dart';
import 'package:abstract_factory_pattern/widget_abstract/iactivity_indicator.dart';
import 'package:abstract_factory_pattern/widget_abstract/islider.dart';
import 'package:abstract_factory_pattern/widget_abstract/iswitch.dart';

class CupertinoWidgetsFactory implements IWidgetsFactory {
  @override
  String getTitle() {
    return 'iOS widgets';
  }

  @override
  IActivityIndicator createActivityIndicator() {
    return IosActivityIndicator();
  }

  @override
  ISlider createSlider() {
    return IosSlider();
  }

  @override
  ISwitch createSwitch() {
    return IosSwitch();
  }
}
