class MoteRating {
  MoteRating({
    required this.totalDates,
    required this.successefulDates,
    required this.failedDate,
  });

  late double averageRating;

  final int totalDates;
  final int successefulDates;
  final int failedDate;
}
