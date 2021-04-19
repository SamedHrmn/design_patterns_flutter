import 'package:strategy_pattern/model/order_model.dart';

import '../ishipping_costs_strategy.dart';

class PriorityShippingStrategy implements IShippingCostsStrategy {
  @override
  String label = 'Priority shipping';

  @override
  double calculate(Order order) {
    return 9.99;
  }
}
