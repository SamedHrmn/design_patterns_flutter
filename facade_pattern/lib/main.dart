import 'package:facade_pattern/smart_home_state.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'facade/smart_home_facade.dart';
import 'widget/device_icon_widget.dart';
import 'widget/mode_switcher_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FacadePatternView(),
    );
  }
}

class FacadePatternView extends StatefulWidget {
  @override
  _FacadePatternViewState createState() => _FacadePatternViewState();
}

class _FacadePatternViewState extends State<FacadePatternView> {
  final SmartHomeFacade _smartHomeFacade = SmartHomeFacade();
  final SmartHomeState _smartHomeState = SmartHomeState();

  bool _homeCinemaModeOn = false;
  bool _gamingModeOn = false;
  bool _streamingModeOn = false;

  bool get _isAnyModeOn => _homeCinemaModeOn || _gamingModeOn || _streamingModeOn;

  void _changeHomeCinemaMode(bool activated) {
    if (activated) {
      _smartHomeFacade.startMovie(_smartHomeState, 'Movie title');
    } else {
      _smartHomeFacade.stopMovie(_smartHomeState);
    }

    setState(() {
      _homeCinemaModeOn = activated;
    });
  }

  void _changeGamingMode(bool activated) {
    if (activated) {
      _smartHomeFacade.startGaming(_smartHomeState);
    } else {
      _smartHomeFacade.stopGaming(_smartHomeState);
    }

    setState(() {
      _gamingModeOn = activated;
    });
  }

  void _changeStreamingMode(bool activated) {
    if (activated) {
      _smartHomeFacade.startStreaming(_smartHomeState);
    } else {
      _smartHomeFacade.stopStreaming(_smartHomeState);
    }

    setState(() {
      _streamingModeOn = activated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Facade Pattern Example"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: <Widget>[
              ModeSwitcher(
                title: 'Home cinema mode',
                activated: _homeCinemaModeOn,
                onChanged: !_isAnyModeOn || _homeCinemaModeOn ? _changeHomeCinemaMode : null,
              ),
              ModeSwitcher(
                title: 'Gaming mode',
                activated: _gamingModeOn,
                onChanged: !_isAnyModeOn || _gamingModeOn ? _changeGamingMode : null,
              ),
              ModeSwitcher(
                title: 'Streaming mode',
                activated: _streamingModeOn,
                onChanged: !_isAnyModeOn || _streamingModeOn ? _changeStreamingMode : null,
              ),
              SizedBox(height: 32),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      DeviceIcon(
                        iconData: FontAwesomeIcons.tv,
                        activated: _smartHomeState.tvOn,
                      ),
                      DeviceIcon(
                        iconData: FontAwesomeIcons.film,
                        activated: _smartHomeState.netflixConnected,
                      ),
                      DeviceIcon(
                        iconData: Icons.speaker,
                        activated: _smartHomeState.audioSystemOn,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      DeviceIcon(
                        iconData: FontAwesomeIcons.playstation,
                        activated: _smartHomeState.gamingConsoleOn,
                      ),
                      DeviceIcon(
                        iconData: FontAwesomeIcons.video,
                        activated: _smartHomeState.streamingCameraOn,
                      ),
                      DeviceIcon(
                        iconData: FontAwesomeIcons.lightbulb,
                        activated: _smartHomeState.lightsOn,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
