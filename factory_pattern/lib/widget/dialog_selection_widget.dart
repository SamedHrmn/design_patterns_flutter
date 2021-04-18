import 'package:factory_pattern/custom_dialog.dart';
import 'package:flutter/material.dart';

class DialogSelection extends StatelessWidget {
  final List<CustomDialogFactory> customDialogList;
  final int selectedIndex;
  final ValueSetter<int> onChanged;

  const DialogSelection({
    @required this.customDialogList,
    @required this.selectedIndex,
    @required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (var i = 0; i < customDialogList.length; i++)
          RadioListTile(
            title: Text(customDialogList[i].getTitle()),
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
