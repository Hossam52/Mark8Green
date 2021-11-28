class VehicleModel {
  VehicleModel({
    required this.type,
    required this.model,
    required this.loadPerOrder,
    required this.pannelNumer,
    required this.owner,
    required this.classification,
    required this.coverImagePath,
    required this.imagePath,
  });

  final String imagePath;
  final String coverImagePath;
  final String type;
  final String model;
  final String classification;
  final String loadPerOrder;
  final String pannelNumer;
  final String owner;
}

final vehicle = VehicleModel(
    imagePath: 'asset/images/vehicle_profile.png',
    coverImagePath: 'asset/images/vehicle_cover.png',
    type: 'DHL',
    model: '2012',
    classification: 'Bike',
    loadPerOrder: '30 KG',
    pannelNumer: '1-s5547',
    owner: 'Driver');
