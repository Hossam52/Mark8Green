import 'package:driver_app/general_commponent/components.dart';
import 'package:driver_app/presentation/resourses/color_manager.dart';
import 'package:driver_app/screens/notifications/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:driver_app/models/company_model.dart';
import 'package:driver_app/models/driver_model.dart';
import 'package:driver_app/models/vehicle_model.dart';
import 'package:driver_app/screens/profiles/driver_profile/driver_reviews_management.dart';
// import 'package:driver_app/screens/profiles/store_profiles/store_profile.dart';
// import 'package:driver_app/widgets/indicator_widget.dart';
// import 'package:driver_app/widgets/table_data_widget.dart';
import 'package:common_widgets/indicator_widget.dart';
import 'package:common_widgets/table_data_widget.dart';
import 'package:common_widgets/profile.dart';

class DriverProfileManagement extends StatelessWidget {
  DriverProfileManagement(this.configs, {Key? key})
      : driverInfo = configs.driverModel,
        companyInfo = configs.driverModel.comapny,
        vehicleInfo = configs.driverModel.vehicle,
        super(key: key) {
    storeInformations = [
      Builder(builder: (context) {
        return ProfileStructure(
          profileData: ProfileDataConfigs(
              imagePath: driverInfo.imagePath,
              coverImagePath: driverInfo.coverImagePath,
              detailsTable: getDriverInformation,
              showBackButton: false,
              onNotificationPressed: () {
                To(context, NotificationScreen());
              },
              notificationColor: Theme.of(context).primaryColor,
              showDiscription: false),
        );
      }),
      ProfileStructure(
          profileData: ProfileDataConfigs(
              imagePath: companyInfo.imagePath,
              coverImagePath: companyInfo.coverImagePath,
              detailsTable: getCompnayInformation,
              showBackButton: false)),
      ProfileStructure(
          profileData: ProfileDataConfigs(
              imagePath: vehicleInfo.imagePath,
              coverImagePath: vehicleInfo.coverImagePath,
              detailsTable: getVehicleDetails,
              showDiscription: false,
              showBackButton: false)),
      DriverReviewsManagement(
        driverReviewModel: driverInfo.reviews,
        morag3atModel: driverInfo.morag3at,
      ),
    ];
  }
  final DriverScreenConfigs configs;
  final DriverModel driverInfo;
  final CompanyModel companyInfo;
  final VehicleModel vehicleInfo;
  List<TableRowItem> get getDriverInformation {
    return [
      TableRowItem(
          title: 'Employment number',
          widget: Text(driverInfo.employmentNumber)),
      TableRowItem(title: 'Name', widget: Text(driverInfo.name)),
      TableRowItem(title: 'Type', widget: Text(driverInfo.type)),
      TableRowItem(title: 'Work', widget: Text(driverInfo.work)),
      TableRowItem(title: 'Age', widget: Text(driverInfo.age.toString())),
      TableRowItem(title: 'Gender', widget: Text(driverInfo.gender)),
      TableRowItem(
          title: 'Experience', widget: Text('${driverInfo.experience}')),
      TableRowItem(title: 'Nationality', widget: _nationalityFlag()),
      // TableRowItem(title: 'Points', widget: Text('${driverInfo.points}')),
      // TableRowItem(
      //     title: 'Best buyer', widget: Text('${driverInfo.bestBuyer}')),
    ];
  }

  List<TableRowItem> get getCompnayInformation {
    return [
      TableRowItem(title: 'Company name', widget: Text('${companyInfo.name}')),
      TableRowItem(
          title: 'Delivery type', widget: Text('${companyInfo.deliveryType}')),
      TableRowItem(
          title: 'Number vehicles',
          widget: Text('${companyInfo.vehiclesCount}')),
      // TableRowItem(
      //   title: 'Rating',
      //   widget: RatingRow(
      //     rating: companyInfo.rating,
      //   ),
      // ),
    ];
  }

  List<TableRowItem> get getVehicleDetails {
    return [
      TableRowItem(title: 'Vehicle type', widget: Text('${vehicleInfo.type}')),
      TableRowItem(title: 'Model', widget: Text('${vehicleInfo.model}')),
      TableRowItem(
          title: 'Load/Order', widget: Text('${vehicleInfo.loadPerOrder}')),
      TableRowItem(
          title: 'Vehicle classification',
          widget: Text('${vehicleInfo.classification}')),
      TableRowItem(
          title: 'Pannel number', widget: Text('${vehicleInfo.model}')),
      TableRowItem(title: 'Owner', widget: Text('${vehicleInfo.owner}')),
    ];
  }

  Widget _nationalityFlag() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Text("${driverInfo.nationality}"),
      Image.asset('asset/images/jordan.png'),
    ]);
  }

  late final List<Widget> storeInformations;
  final _pagesController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                  controller: _pagesController, children: storeInformations),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IndicatorWidget(
                activeColor: ColorManager.grey,
                pageController: _pagesController,
                count: storeInformations.length,
              ),
            ),
            configs.bottomButton ?? Container()
          ],
        ),
      ),
    );
  }
}

class DriverScreenConfigs {
  final Widget? bottomButton;
  final DriverModel driverModel;

  DriverScreenConfigs(
    this.driverModel, {
    this.bottomButton,
  });
}
