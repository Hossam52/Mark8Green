import 'package:driver_app/general_commponent/colors.dart';
import 'package:driver_app/general_commponent/components.dart';
import 'package:driver_app/general_commponent/default_button.dart';
import 'package:driver_app/models/company_model.dart';
import 'package:driver_app/models/driver_model.dart';
import 'package:driver_app/models/morag3at_model.dart';
import 'package:driver_app/models/review_model.dart';
import 'package:driver_app/models/vehicle_model.dart';
import 'package:driver_app/presentation/resourses/assets_manager.dart';
import 'package:driver_app/presentation/resourses/color_manager.dart';
import 'package:driver_app/presentation/resourses/styles_manager.dart';
import 'package:driver_app/screens/maps/store_map_locations.dart';
import 'package:driver_app/screens/orders_management/deliver_orders/delivery_page.dart';
import 'package:driver_app/screens/profiles/driver_profile/driver_profile_management.dart';
import 'package:driver_app/widgets/card_widget.dart';
import 'package:driver_app/widgets/custom_toggle_buttons.dart';
import 'package:driver_app/widgets/image_rounded.dart';
import 'package:driver_app/widgets/orders_view.dart';
import 'package:driver_app/widgets/store_owner_widget.dart';
import 'package:driver_app/widgets/table_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CollectOrders extends StatefulWidget {
  const CollectOrders({Key? key}) : super(key: key);

  @override
  State<CollectOrders> createState() => _CollectOrdersState();
}

class _CollectOrdersState extends State<CollectOrders> {
  int orderIndex = 0;

  int storeIndex = 0;

  int driverIndex = 0;

  List<StoreData> stores = [
    StoreData('asset/images/macdonals.png', 'Macdonals', 3, 3, true, true),
    StoreData('asset/images/starbucks.png', 'Starbucls', 2, 3, false, false),
    StoreData('asset/images/kfc.png', 'KFC', 2, 3, false, false),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _remainingOrders(height),
          _shopperIdentityColumn(),
          _buildStores(),
          _buyerIdentityColumn(),
          _arrived(),
          _recievingOrderData()
        ],
      ),
    );
  }

  Widget _remainingOrders(double height) {
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
        Divider(),
      ],
    );
  }

  Widget _buildStores() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
            text: TextSpan(
                style: getRegularStyle(fontSize: 18),
                text: 'Remaining stores ',
                children: [
              TextSpan(
                  text: '1/1',
                  style: getRegularStyle(
                      fontSize: 18, color: Theme.of(context).primaryColor))
            ])),
        SizedBox(height: 10),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.17,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stores.length,
              itemBuilder: (_, index) => InkWell(
                  onTap: () {
                    setState(() {
                      storeIndex = index;
                      for (var i
                          in List.generate(stores.length, (index) => index))
                        stores[i].isSelected = false;
                      stores[index].isSelected = true;
                    });
                  },
                  child: _buildStore(stores[index]))),
        ),
        Divider()
      ],
    );
  }

  Widget _buildStore(StoreData store) {
    return Builder(builder: (context) {
      return CardWidget(
          width: MediaQuery.of(context).size.width * 0.23,
          imagePath: store.imagePath,
          title: store.name,
          bottom: Text('${store.finished}/${store.total}',
              style: getRegularStyle(
                  color:
                      store.isFinishedPreparing ? Colors.green : Colors.red)),
          isSelected: store.isSelected);
    });
  }

  Column _buyerIdentityColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Buyer identity', style: getRegularStyle()),
        _BuyerIdentity(),
        SizedBox(height: 8),
      ],
    );
  }

  Widget _arrived() {
    return Column(
      children: [
        ConfimrArrival(),
        Divider(),
      ],
    );
  }

  Widget _recievingOrderData() {
    final List<TableRowItem> _invoiceData = [
      TableRowItem(title: 'Order number', widget: Text('#5544123699')),
      TableRowItem(title: 'Discount', widget: Text('5')),
      TableRowItem(title: 'Order commision', widget: Text('1 JD')),
      TableRowItem(title: 'Total order price', widget: Text('94 JD')),
      TableRowItem(
          title: 'Payment method',
          widget: buildIcon('asset/images/cash.png', size: 30.r)),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Shopping invoice', style: getSemiBoldStyle(fontSize: 16)),
        RecievingTableWidget(
          onPayInvoicePressed: () {},
          tableData: _invoiceData,
          onConfirmPressed: () {},
        ),
      ],
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
          Expanded(
              flex: 2,
              child: RoundedImage(
                  height: MediaQuery.of(context).size.height * 0.07,
                  imagePath: 'asset/images/store_owner.png')),
          SizedBox(width: 10),
          Expanded(
              flex: 6,
              child: Text('Mohamed Hassan  134',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: getRegularStyle())),
          Expanded(flex: 3, child: buildIcon(ImageAssets.phoneIcon))
        ]),
      ),
    );
  }
}

class _BuyerIdentity extends StatelessWidget {
  const _BuyerIdentity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(children: [
          Expanded(flex: 2, child: _image(context)),
          SizedBox(width: 10),
          Expanded(flex: 7, child: _buyerDetails()),
          Expanded(flex: 3, child: _actions(context))
        ]),
      ),
    );
  }

  RoundedImage _image(BuildContext context) {
    return RoundedImage(
        height: MediaQuery.of(context).size.height * 0.07,
        imagePath: 'asset/images/store_owner.png');
  }

  Row _actions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(onTap: () {}, child: buildIcon(ImageAssets.phoneIcon)),
        InkWell(
            onTap: () {
              To(context, StoreMapLocation());
            },
            child: buildIcon(ImageAssets.mapIcon)),
      ],
    );
  }

  Column _buyerDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('123456', style: getRegularStyle(color: ColorManager.grey1)),
        Text('Mohamed Hassan  134',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: getRegularStyle()),
        Text('Store owner', style: getRegularStyle(color: ColorManager.grey1)),
      ],
    );
  }
}

class StoreData {
  bool isSelected;
  bool isFinishedPreparing;
  String imagePath;
  String name;
  int finished;
  int total;
  StoreData(this.imagePath, this.name, this.finished, this.total,
      this.isSelected, this.isFinishedPreparing);
}
