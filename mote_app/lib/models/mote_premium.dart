class MotePremium {
  final String id;
  final MotePremiumType type;
  final MotePremiumStatus status;
  final DateTime startDate;
  final DateTime endDate;

  MotePremium({
    required this.id,
    required this.type,
    required this.status,
    required this.startDate,
    required this.endDate,
  });
}

enum MotePremiumType {
  basic,
  advanced,
  premium,
}

enum MotePremiumStatus {
  active,
  inactive,
  expired,
}
