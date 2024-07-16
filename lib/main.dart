import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tollo_on_flutter/Providers/connectivityStreamProvider.dart';
import 'package:tollo_on_flutter/SplashActivity/Splashscreen.dart';
import 'package:tollo_on_flutter/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //listen to internet connectivity changes in realtime
    ref.listen<AsyncValue<ConnectivityResult>>(connectivityStreamProvider,
        (_, state) {
      state.when(
        data: (data) {
          final message = data == ConnectivityResult.none
              ? "No internet connection"
              : "You are back online";
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              duration: Duration(seconds: 25),
            ),
          );
        },
        error: (e, _) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error Checking connectivity: $e"),
          ),
        ),
        loading: () => {},
      );
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mpesa Clone',
      theme: lightMode,
      darkTheme: darkMode,
      home: const splashscreen(),
    );
  }
}
