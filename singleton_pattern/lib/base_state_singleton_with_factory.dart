import 'package:singleton_pattern/base/base_state.dart';

class BaseStateSingletonWithFactory extends BaseState {
  static final BaseStateSingletonWithFactory _instance = BaseStateSingletonWithFactory._internal();

  factory BaseStateSingletonWithFactory() {
    return _instance;
  }

  BaseStateSingletonWithFactory._internal() {
    initialText = "A new 'BaseStateSingletonWithFactory' instance has been created.";
    stateText = initialText;
  }
}
