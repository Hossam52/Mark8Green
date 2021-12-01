import 'package:driver_app/general_commponent/components.dart';
import 'package:driver_app/general_commponent/default_button.dart';
import 'package:driver_app/presentation/resourses/assets_manager.dart';
import 'package:driver_app/presentation/resourses/color_manager.dart';
import 'package:driver_app/presentation/resourses/styles_manager.dart';
import 'package:driver_app/screens/maps/shopper_delivery_location.dart';
import 'package:driver_app/screens/orders_management/deliver_orders/delivery_page.dart';
import 'package:driver_app/widgets/border_container_light.dart';
import 'package:driver_app/widgets/custom_stepper.dart';
import 'package:driver_app/widgets/custom_toggle_buttons.dart';
import 'package:driver_app/widgets/image_rounded.dart';
import 'package:driver_app/widgets/orders_view.dart';
import 'package:driver_app/widgets/table_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliverOrders extends StatefulWidget {
  DeliverOrders({Key? key}) : super(key: key);

  @override
  State<DeliverOrders> createState() => _DeliverOrdersState();
}

class _DeliverOrdersState extends State<DeliverOrders> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          _chooseOrders(height),
          _shopperIdentityColumn(),
          _confirmArrival(),
          _InvoiceDetails()
        ],
      ),
    );
  }

  Widget _chooseOrders(double height) {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Choose orders', style: getRegularStyle()),
          OrdersViewList(items: List.generate(5, (index) => 1)),
          Divider()
        ],
      );
    });
  }

  Column _shopperIdentityColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Shopper identity', style: getRegularStyle()),
        _ShopperIdentity(),
        SizedBox(height: 8),
      ],
    );
  }

  Widget _confirmArrival() {
    return Column(
      children: [ConfimrArrival(), Divider()],
    );
  }
}

class _ShopperIdentity extends StatelessWidget {
  const _ShopperIdentity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(children: [
          Expanded(flex: 2, child: _image(context)),
          SizedBox(width: 10),
          Expanded(flex: 7, child: _shopperDetails()),
          Expanded(flex: 3, child: _actions())
        ]),
      ),
    );
  }

  RoundedImage _image(BuildContext context) {
    return RoundedImage(
        height: MediaQuery.of(context).size.height * 0.07,
        imagePath: 'asset/images/store_owner.png');
  }

  Widget _actions() {
    return Builder(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildIcon(ImageAssets.phoneIcon),
          InkWell(
              onTap: () {
                To(context, ShopperDeliveryLocation());
              },
              child: buildIcon(ImageAssets.mapIcon)),
        ],
      );
    });
  }

  Widget _shopperDetails() {
    return Text('Mohamed Hassan  134',
        maxLines: 1, overflow: TextOverflow.ellipsis, style: getRegularStyle());
  }
}

class _InvoiceDetails extends StatefulWidget {
  const _InvoiceDetails({Key? key}) : super(key: key);

  @override
  State<_InvoiceDetails> createState() => _InvoiceDetailsState();
}

class _InvoiceDetailsState extends State<_InvoiceDetails> {
  @override
  void initState() {
    _invoiceSteppers = [
      StepDescription('Delivery invoice', () {}, page: _DeliveryStepperItem(
        onConfirmPressed: () {
          setState(() {
            selectedPricingStepper = 1;
          });
        },
      )),
      StepDescription('Purchases invoice', () {}, page: _PurchaseStepperItem()),
    ];
    super.initState();
  }

  late List<StepDescription> _invoiceSteppers;
  int selectedPricingStepper = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        _pricintDetails(height),
        _invoiceSteppers[selectedPricingStepper].page
      ],
    );
  }

  Widget _pricintDetails(height) {
    return Card(
      elevation: 3,
      child: Container(
        // margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(),
        child: FittedBox(
          child: SizedBox(
            height: height * 0.14,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: CustomStepper(_invoiceSteppers, selectedPricingStepper),
            ),
          ),
        ),
      ),
    );
  }
}

///////////////// Purchasing stepper/////
class _PurchaseStepperItem extends StatelessWidget {
  _PurchaseStepperItem({Key? key}) : super(key: key);

  final List<TableRowItem> _purchaseTableRows = [
    TableRowItem(title: 'Order number', widget: Text('#5544123699')),
    TableRowItem(title: 'Discount', widget: Text('5')),
    TableRowItem(title: 'Order commision', widget: Text('1 JD')),
    TableRowItem(title: 'Total order price', widget: Text('94 JD')),
    TableRowItem(
        title: 'Payment method',
        widget: buildIcon('asset/images/cash.png', size: 30.r)),
  ];
  @override
  Widget build(BuildContext context) {
    return RecievingTableWidget(
        tableData: _purchaseTableRows,
        onPayInvoicePressed: () {},
        onConfirmPressed: () => _confirmPurchase(context));
  }

  void _confirmPurchase(context) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        child: _FinishTourDialog(),
      ),
    );
  }
}

class _DeliveryStepperItem extends StatelessWidget {
  _DeliveryStepperItem({Key? key, required this.onConfirmPressed})
      : super(key: key);
  final VoidCallback onConfirmPressed;
  final List<TableRowItem> _deliveryTableRows = [
    TableRowItem(title: 'Total stores', widget: Text('3')),
    TableRowItem(title: 'Total weight', widget: Text('12 KG')),
    TableRowItem(title: 'Delivery commision', widget: Text('1 PSD')),
    TableRowItem(title: 'Total delivery cost', widget: Text('3 JD')),
    TableRowItem(title: 'Total price', widget: Text('2 JD')),
    TableRowItem(
        title: 'Payment method',
        widget: buildIcon('asset/images/cash.png', size: 30.r)),
  ];
  @override
  Widget build(BuildContext context) {
    return RecievingTableWidget(
      onPayInvoicePressed: () {},
      tableData: _deliveryTableRows,
      onConfirmPressed: onConfirmPressed,
    );
  }
}

class _FinishTourDialog extends StatelessWidget {
  const _FinishTourDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10),
          Image.asset(
            ImageAssets.success,
          ),
          SizedBox(height: 10),
          Text('Congratulations!!',
              style: getLightStyle(
                  color: Theme.of(context).primaryColor, fontSize: 18)),
          SizedBox(height: 10),
          Text('Done finishing the tour.',
              textAlign: TextAlign.center,
              style: getRegularStyle(fontSize: 20)),
          SizedBox(height: 15),
          Text('12:30 AM 15/9/2021',
              style: getRegularStyle(
                  color: Theme.of(context).primaryColor, fontSize: 15)),
          SizedBox(height: 15),
          _facingProble(context)
        ],
      ),
    );
  }

  Widget _facingProble(BuildContext context) {
    return Wrap(children: [
      Text('Did you encounter a problem? ', style: getRegularStyle()),
      Text('press ', style: getRegularStyle()),
      InkWell(
        onTap: () {},
        child: Text('help ',
            style: getRegularStyle(color: Theme.of(context).primaryColor)),
      )
    ]);

    return RichText(
      text: TextSpan(
          style: getRegularStyle(),
          text: 'Did you encounter a problem? ',
          children: [
            TextSpan(text: 'press '),
            TextSpan(
                text: 'help',
                style: getRegularStyle(color: Theme.of(context).primaryColor)),
          ]),
    );
  }
}
