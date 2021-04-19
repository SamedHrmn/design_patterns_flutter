import 'package:flutter/material.dart';
import 'package:strategy_pattern/ishipping_costs_strategy.dart';
import 'package:strategy_pattern/model/order_model.dart';
import 'package:strategy_pattern/widget/order_buttons.dart';
import 'package:strategy_pattern/widget/order_items_table.dart';
import 'package:strategy_pattern/widget/order_summary.dart';
import 'package:strategy_pattern/widget/shipping_options.dart';

import 'strategy/in_store_pickup_strategy.dart';
import 'strategy/parcel_terminal_shipping_strategy.dart';
import 'strategy/priority_shipping_strategy.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StrategyPatternView(),
    );
  }
}

class StrategyPatternView extends StatefulWidget {
  @override
  _StrategyPatternViewState createState() => _StrategyPatternViewState();
}

class _StrategyPatternViewState extends State<StrategyPatternView> {
  final List<IShippingCostsStrategy> _shippingCostsStrategyList = [
    InStorePickupStrategy(),
    ParcelTerminalShippingStrategy(),
    PriorityShippingStrategy(),
  ];
  int _selectedStrategyIndex = 0;
  Order _order = Order();

  void _addToOrder() {
    setState(() {
      _order.addOrderItem(OrderItem.random());
    });
  }

  void _clearOrder() {
    setState(() {
      _order = Order();
    });
  }

  void _setSelectedStrategyIndex(int index) {
    setState(() {
      _selectedStrategyIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Strategy Pattern Example"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              OrderButtons(
                onAdd: _addToOrder,
                onClear: _clearOrder,
              ),
              SizedBox(height: 16),
              Stack(
                children: <Widget>[
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 500),
                    opacity: _order.items.isEmpty ? 1.0 : 0.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Your order is empty',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  ),
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 500),
                    opacity: _order.items.isEmpty ? 0.0 : 1.0,
                    child: Column(
                      children: <Widget>[
                        OrderItemsTable(
                          orderItems: _order.items,
                        ),
                        SizedBox(height: 16),
                        ShippingOptions(
                          selectedIndex: _selectedStrategyIndex,
                          shippingOptions: _shippingCostsStrategyList,
                          onChanged: _setSelectedStrategyIndex,
                        ),
                        OrderSummary(
                          shippingCostsStrategy: _shippingCostsStrategyList[_selectedStrategyIndex],
                          order: _order,
                        ),
                      ],
                    ),
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
