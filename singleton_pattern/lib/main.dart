import 'package:flutter/material.dart';
import 'package:singleton_pattern/base/base_state.dart';
import 'package:singleton_pattern/base_state_singleton_by_definition.dart';
import 'package:singleton_pattern/base_state_singleton_with_factory.dart';
import 'package:singleton_pattern/widget/custom_card_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SingletonPatternView(),
    );
  }
}

class SingletonPatternView extends StatefulWidget {
  @override
  _SingletonPatternViewState createState() => _SingletonPatternViewState();
}

class _SingletonPatternViewState extends State<SingletonPatternView> {
  final List<BaseState> stateList = [
    BaseStateSingletonWithFactory(),
    BaseStateSingletonByDefition.getState(),
  ];

  void _setTextValues([String text = 'Singleton']) {
    for (final state in stateList) {
      state.setStateText(text);
    }
    setState(() {});
  }

  void _reset() {
    for (final state in stateList) {
      state.reset();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Singleton Pattern"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: <Widget>[
              for (var state in stateList)
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: CustomCardWidget(
                    text: state.currentText,
                  ),
                ),
              SizedBox(height: 8),
              TextButton(
                onPressed: _setTextValues,
                child: Text(
                  "Change states' text to 'Singleton'",
                ),
              ),
              TextButton(
                onPressed: _reset,
                child: Text('Reset'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
