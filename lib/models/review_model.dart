class DriverReviewModel {
  final double rate;
  final int reviews;
  final int betterDriver;
  final int points;
  final List<double> ratingValues;
  final SpeedBehavior speed;
  final CommitmentBehavior commitment;
  final CommunicationBehavior communication;

  DriverReviewModel(
      {required this.rate,
      required this.reviews,
      required this.ratingValues,
      required this.speed,
      required this.commitment,
      required this.communication,
      required this.betterDriver,
      required this.points});
}

abstract class DriverBehavior {
  final String title;
  final double fast;
  final double slow;

  const DriverBehavior(
      {required this.title, required this.fast, required this.slow});
}

class SpeedBehavior extends DriverBehavior {
  const SpeedBehavior({required double fast, required double slow})
      : super(title: 'Speed', fast: fast, slow: slow);
}

class CommunicationBehavior extends DriverBehavior {
  const CommunicationBehavior({required double fast, required double slow})
      : super(title: 'Communication', fast: fast, slow: slow);
}

class CommitmentBehavior extends DriverBehavior {
  CommitmentBehavior({required double fast, required double slow})
      : super(title: 'Commitment', fast: fast, slow: slow);
}

final reviews = DriverReviewModel(
    rate: 4,
    reviews: 49,
    ratingValues: [80, 40, 15, 7, 2],
    speed: SpeedBehavior(fast: 70, slow: 30),
    commitment: CommitmentBehavior(fast: 30, slow: 70),
    communication: CommunicationBehavior(fast: 40, slow: 60),
    betterDriver: 20,
    points: 3700);
