import 'package:driver_app/presentation/resourses/styles_manager.dart';
import 'package:flutter/material.dart';

class TableDataWidget extends StatelessWidget {
  const TableDataWidget({Key? key, required this.rows}) : super(key: key);
  final List<TableRowItem> rows;
  @override
  Widget build(BuildContext context) {
    return _orderData();
  }

  Widget _orderData() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
          columnWidths: {
            0: FlexColumnWidth(3),
            1: FlexColumnWidth(3),
          },
          border: TableBorder(
              bottom: BorderSide(color: Colors.grey.withOpacity(0.2)),
              horizontalInside:
                  BorderSide(color: Colors.grey.withOpacity(0.2))),
          children: rows.map((e) => _orderRowTableWidget(e)).toList()),
    );
  }

  TableRow _orderRowTableWidget(TableRowItem rowItem) {
    final style = getSemiBoldStyle(
      fontSize: 19,
    );
    final padding = const EdgeInsets.all(10);
    return TableRow(
      children: [
        Padding(
          padding: padding,
          child: Text(
            rowItem.title,
            style: style,
          ),
        ),
        Padding(padding: padding, child: Center(child: rowItem.widget)),
      ],
    );
  }
}

class TableRowItem {
  String title;
  Widget widget;
  Color rowColor;
  TableRowItem(
      {required this.title,
      required this.widget,
      this.rowColor = Colors.black});
}
