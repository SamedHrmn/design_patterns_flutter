import 'package:abstract_factory_pattern/factory/cupertino_widgets_factory.dart';
import 'package:abstract_factory_pattern/factory/material_widgets_factory.dart';
import 'package:abstract_factory_pattern/iwidgets_factory.dart';
import 'package:abstract_factory_pattern/widget/factory_selection_widget.dart';
import 'package:abstract_factory_pattern/widget_abstract/iactivity_indicator.dart';
import 'package:abstract_factory_pattern/widget_abstract/islider.dart';
import 'package:abstract_factory_pattern/widget_abstract/iswitch.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AbstractFactoryPatternView(),
    );
  }
}

class AbstractFactoryPatternView extends StatefulWidget {
  const AbstractFactoryPatternView({
    Key key,
  }) : super(key: key);

  @override
  _AbstractFactoryPatternViewState createState() => _AbstractFactoryPatternViewState();
}

class _AbstractFactoryPatternViewState extends State<AbstractFactoryPatternView> {
  final List<IWidgetsFactory> widgetsFactoryList = [
    MaterialWidgetsFactory(),
    CupertinoWidgetsFactory(),
  ];

  int _selectedFactoryIndex = 0;

  IActivityIndicator _activityIndicator;

  ISlider _slider;
  double _sliderValue = 50.0;
  String get _sliderValueString => _sliderValue.toStringAsFixed(0);

  ISwitch _switch;
  bool _switchValue = false;
  String get _switchValueString => _switchValue ? 'ON' : 'OFF';

  @override
  void initState() {
    super.initState();
    _createWidgets();
  }

  void _createWidgets() {
    _activityIndicator = widgetsFactoryList[_selectedFactoryIndex].createActivityIndicator();
    _slider = widgetsFactoryList[_selectedFactoryIndex].createSlider();
    _switch = widgetsFactoryList[_selectedFactoryIndex].createSwitch();
  }

  void _setSelectedFactoryIndex(int index) {
    setState(() {
      _selectedFactoryIndex = index;
      _createWidgets();
    });
  }

  void _setSliderValue(double value) {
    setState(() {
      _sliderValue = value;
    });
  }

  void _setSwitchValue(bool value) {
    setState(() {
      _switchValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Abstract Factory Pattern"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              FactorySelection(
                widgetsFactoryList: widgetsFactoryList,
                selectedIndex: _selectedFactoryIndex,
                onChanged: _setSelectedFactoryIndex,
              ),
              SizedBox(height: 8),
              Text(
                'Widgets showcase',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 8),
              Text(
                'Process indicator',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: 8),
              _activityIndicator.render(),
              SizedBox(height: 16),
              Text(
                'Slider ($_sliderValueString%)',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: 8),
              _slider.render(_sliderValue, _setSliderValue),
              SizedBox(height: 16),
              Text(
                'Switch ($_switchValueString)',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: 8),
              _switch.render(
                value: _switchValue,
                onChanged: _setSwitchValue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
