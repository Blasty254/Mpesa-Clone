import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectivityStreamProvider = StreamProvider<ConnectivityResult>((ref) {
  // Assuming Connectivity().onConnectivityChanged returns Stream<List<ConnectivityResult>>
  // and you are interested in the first ConnectivityResult in the list.
  // Adjust the logic inside map() as needed based on your requirements.
  return Connectivity().onConnectivityChanged.map((list) => list.first);
});
