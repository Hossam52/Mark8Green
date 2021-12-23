import 'package:common_widgets/morag3at_model.dart';
import 'package:driver_app/models/company_model.dart';
// import 'package:driver_app/models/morag3at_model.dart';
import 'package:driver_app/models/review_model.dart';
import 'package:driver_app/models/vehicle_model.dart';

class DriverModel {
  DriverModel({
    required this.name,
    required this.employmentNumber,
    required this.type,
    required this.work,
    required this.age,
    required this.gender,
    required this.experience,
    required this.nationality,
    this.nationalityFlagImagePath,
    required this.points,
    required this.bestBuyer,
    required this.comapny,
    required this.vehicle,
    required this.reviews,
    required this.morag3at,
    required this.imagePath,
    required this.coverImagePath,
  });

  final String imagePath;
  final String coverImagePath;
  final String name;
  final String employmentNumber;
  final String type;
  final String work;
  final int age;
  final String gender;
  final int experience;
  final String nationality;
  final String? nationalityFlagImagePath;
  final int points;
  final int bestBuyer;
  final CompanyModel comapny;
  final VehicleModel vehicle;
  final DriverReviewModel reviews;
  final List<Morag3atModel> morag3at;
}

final driverProfile = DriverModel(
    imagePath: 'asset/images/userProfile.png',
    coverImagePath: 'asset/images/company_cover.png',
    name: 'Hossam Hassan',
    employmentNumber: '225547',
    type: 'Store owner',
    work: 'Resturant owner',
    age: 21,
    gender: 'Male',
    experience: 7,
    nationality: 'Egyption',
    points: 2000,
    bestBuyer: 100,
    comapny: companyModel,
    vehicle: vehicle,
    reviews: reviews,
    morag3at: allMorg3at);
