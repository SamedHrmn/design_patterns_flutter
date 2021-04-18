import 'package:factory_pattern/custom_dialog.dart';
import 'package:factory_pattern/widget/alert_dialog/android_alert_dialog.dart';
import 'package:factory_pattern/widget/alert_dialog/ios_alert_dialog.dart';
import 'package:factory_pattern/widget/dialog_selection_widget.dart';
import 'package:factory_pattern/widget/platform_button_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FactoryPatternView(),
    );
  }
}

class FactoryPatternView extends StatefulWidget {
  const FactoryPatternView({
    Key key,
  }) : super(key: key);

  @override
  _FactoryPatternViewState createState() => _FactoryPatternViewState();
}

class _FactoryPatternViewState extends State<FactoryPatternView> {
  final List<CustomDialogFactory> customDialogList = [
    AndroidAlertDialog(),
    IOSAlertDialog(),
  ];

  int _selectedDialogIndex = 0;

  // _showCustomDialog metodu hangi tür bir alert dialog göstereceği ile ilgilenmez.
  // Ayrıca diyalog penceresinin gösterimi create() metodu ile factory sınıfında kapsüllenmiştir.
  // Böylece UI logic herhangi bir alert dialog ile bağımlı değildir.
  // UI etkilenmeden istenen alert dialog eklenebilir veya çıkartılabilir.
  Future _showCustomDialog(BuildContext context) async {
    var selectedDialog = customDialogList[_selectedDialogIndex];
    await selectedDialog.show(context);
  }

  selectedDialogIndexCallBack(int index) {
    setState(() {
      _selectedDialogIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Factory Method Design Pattern Example'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              DialogSelection(
                customDialogList: customDialogList,
                selectedIndex: _selectedDialogIndex,
                onChanged: selectedDialogIndexCallBack,
              ),
              SizedBox(height: 16),
              PlatformButton(
                materialColor: Theme.of(context).primaryColor,
                materialTextColor: Colors.white,
                onPressed: () => _showCustomDialog(context),
                text: 'Show Dialog',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
