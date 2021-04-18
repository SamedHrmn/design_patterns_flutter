import 'package:abstract_factory_pattern/iwidgets_factory.dart';
import 'package:flutter/material.dart';

class FactorySelection extends StatelessWidget {
  final List<IWidgetsFactory> widgetsFactoryList;
  final int selectedIndex;
  final ValueSetter<int> onChanged;

  const FactorySelection({
    @required this.widgetsFactoryList,
    @required this.selectedIndex,
    @required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (var i = 0; i < widgetsFactoryList.length; i++)
          RadioListTile(
            title: Text(widgetsFactoryList[i].getTitle()),
            value: i,
            groupValue: selectedIndex,
            selected: i == selectedIndex,
            activeColor: Colors.black,
            controlAffinity: ListTileControlAffinity.platform,
            onChanged: onChanged,
          ),
      ],
    );
  }
}
