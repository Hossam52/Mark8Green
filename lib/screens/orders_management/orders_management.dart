import 'package:driver_app/general_commponent/colors.dart';
import 'package:driver_app/general_commponent/default_button.dart';
import 'package:driver_app/screens/orders_management/recieve_orders/recieve_orders.dart';
import 'package:driver_app/screens/orders_management/collect_orders/collect_orders.dart';
import 'package:driver_app/screens/orders_management/deliver_orders/deliver_orders.dart';
import 'package:driver_app/widgets/appbar_with_ToggleButtons.dart';
import 'package:driver_app/widgets/custom_toggle_buttons.dart';
import 'package:driver_app/widgets/image_rounded.dart';
import 'package:flutter/material.dart';

class OrdersManagement extends StatefulWidget {
  OrdersManagement({Key? key}) : super(key: key);

  @override
  State<OrdersManagement> createState() => _OrdersManagementState();
}

class _OrdersManagementState extends State<OrdersManagement> {
  @override
  void initState() {
    ordersStates = [
      ToggleItemDataWithWidget(
          title: 'Recieve orders',
          onPressed: () => onChangeIndex(0),
          page: RecieveOrders()),
      ToggleItemDataWithWidget(
          title: 'Collect orders',
          onPressed: () => onChangeIndex(1),
          page: CollectOrders()),
      ToggleItemDataWithWidget(
          title: 'Deliver orders',
          onPressed: () => onChangeIndex(2),
          page: DeliverOrders()),
    ];
    super.initState();
  }

  late List<ToggleItemDataWithWidget> ordersStates;

  int selectedIndex = 0;
  void onChangeIndex(int index) {
    controller.jumpToPage(index);
    setState(() {
      selectedIndex = index;
    });
  }

  final controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildToggleButtons(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: PageView(
                  controller: controller,
                  children: ordersStates.map((e) => e.page).toList(),
                  onPageChanged: (index) {
                    setState(() {
                      onChangeIndex(index);
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButtons() {
    final toggleButtons = CustomToggleButtons(
      tabs: ordersStates,
      selectedIndex: selectedIndex,
    );
    return AppBarWithToggleButtons(toggleButtons: toggleButtons);
  }
}
