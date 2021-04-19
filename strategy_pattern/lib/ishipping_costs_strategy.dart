import 'model/order_model.dart';

abstract class IShippingCostsStrategy {
  String label;
  double calculate(Order order);
}
