import 'package:abstract_factory_pattern/iwidgets_factory.dart';
import 'package:abstract_factory_pattern/widget/activity_indicator/android_activity_indicator_widget.dart';
import 'package:abstract_factory_pattern/widget/slider/android_slider_widget.dart';
import 'package:abstract_factory_pattern/widget/switch/android_switch_widget.dart';
import 'package:abstract_factory_pattern/widget_abstract/iactivity_indicator.dart';
import 'package:abstract_factory_pattern/widget_abstract/islider.dart';
import 'package:abstract_factory_pattern/widget_abstract/iswitch.dart';

class MaterialWidgetsFactory implements IWidgetsFactory {
  @override
  String getTitle() {
    return 'Android widgets';
  }

  @override
  IActivityIndicator createActivityIndicator() {
    return AndroidActivityIndicator();
  }

  @override
  ISlider createSlider() {
    return AndroidSlider();
  }

  @override
  ISwitch createSwitch() {
    return AndroidSwitch();
  }
}
