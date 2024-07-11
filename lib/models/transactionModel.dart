class Transaction {
  final String profilePhotoUrl;
  final String firstName;
  final String lastName;
  final double amount;
  final String phoneNumber;
  final DateTime dateTime;

  Transaction({
    required this.profilePhotoUrl,
    required this.firstName,
    required this.lastName,
    required this.amount,
    required this.phoneNumber,
    required this.dateTime,
  });

  String get initials => '${firstName[0]}${lastName[0]}';
}
