class CompanyModel {
  CompanyModel({
    required this.name,
    required this.deliveryType,
    required this.vehiclesCount,
    required this.rating,
    required this.discription,
    required this.coverImagePath,
    required this.imagePath,
  });

  final String imagePath;
  final String coverImagePath;
  final String name;
  final String deliveryType;
  final int vehiclesCount;
  final double rating;
  final String discription;
}

final companyModel = CompanyModel(
    imagePath: 'asset/images/company_profile.png',
    coverImagePath: 'asset/images/company_cover.png',
    name: 'DHL',
    deliveryType: 'Logistic service',
    vehiclesCount: 100,
    rating: 4,
    discription: 'Hello this is description for the comapny');
