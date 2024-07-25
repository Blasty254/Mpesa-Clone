import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tollo_on_flutter/models/transactionModel.dart';

final transactionsProvider = Provider<List<Transaction>>((Ref) {
  return [
    Transaction(
      profilePhotoUrl: 'https/google.com',
      firstName: 'Jeff',
      lastName: 'Njogu',
      amount: 30070.0,
      phoneNumber: '+254722260688',
      dateTime: DateTime.now(),
      month: DateFormat('MMMM').format(DateTime.now()),
    ),
    Transaction(
      profilePhotoUrl: 'https/google.com',
      firstName: 'Jeff',
      lastName: 'Njogu',
      amount: 30070.0,
      phoneNumber: '+254722260688',
      dateTime: DateTime.now(),
      month: DateFormat('MMMM').format(DateTime.now()),
    ),
    Transaction(
      profilePhotoUrl: 'https/google.com',
      firstName: 'Jeff',
      lastName: 'Njogu',
      amount: 30070.0,
      phoneNumber: '+254722260688',
      dateTime: DateTime.now(),
      month: DateFormat('MMMM').format(DateTime.now()),
    ),
    Transaction(
      profilePhotoUrl: 'https/google.com',
      firstName: 'Jeff',
      lastName: 'Njogu',
      amount: 30070.0,
      phoneNumber: '+254722260688',
      dateTime: DateTime.now(),
      month: DateFormat('MMMM').format(DateTime.now()),
    ),
    Transaction(
      profilePhotoUrl: 'https/google.com',
      firstName: 'Jeff',
      lastName: 'Njogu',
      amount: 30070.0,
      phoneNumber: '+254722260688',
      dateTime: DateTime.now(),
      month: DateFormat('MMMM').format(DateTime.now()),
    ),
  ];
});
