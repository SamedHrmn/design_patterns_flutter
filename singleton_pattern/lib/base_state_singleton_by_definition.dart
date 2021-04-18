import 'package:singleton_pattern/base/base_state.dart';

class BaseStateSingletonByDefition extends BaseState {
  static BaseStateSingletonByDefition _instance;

  BaseStateSingletonByDefition._internal() {
    initialText = "A new 'BaseStateSingletonByDefition' instance has been created.";
    stateText = initialText;
  }

  static BaseStateSingletonByDefition getState() {
    return _instance ??= BaseStateSingletonByDefition._internal();
  }
}
