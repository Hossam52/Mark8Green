class Morag3atModel {
  Morag3atModel(
      {required this.name,
      required this.rate,
      required this.date,
      required this.review,
      required this.time,
      required this.imagePath});
  final String imagePath;
  final String name;
  final double rate;
  final String date;
  final String review;
  final String time;
}

final List<Morag3atModel> allMorg3at = List.generate(
    10,
    (_) => Morag3atModel(
        imagePath: 'asset/images/userProfile.png',
        name: 'Hossam Hassan',
        rate: 4.5,
        date: '26/11/2021',
        review: 'This is description from me',
        time: '10:00 AM'));
