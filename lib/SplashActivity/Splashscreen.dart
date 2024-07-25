import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:tollo_on_flutter/Authenticate/loginScreen.dart';
import 'package:tollo_on_flutter/UI/homePage.dart';

class splashscreen extends ConsumerStatefulWidget {
  const splashscreen({super.key});

  @override
  splashscreenState createState() => splashscreenState();
}

class splashscreenState extends ConsumerState<splashscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 7),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          checkAuthentication();
        }
      });
    _controller.forward();
  }

  void checkAuthentication() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    print(connectivityResult);

    if (connectivityResult == ConnectivityResult.none) {
      showCustomAlertDialog(context);
      print('Lost connection');
    } else {
      FirebaseAuth auth = FirebaseAuth.instance;
      if (auth.currentUser != null) {
        context.push('/homepage');
        print("navigating to homepage");
      } else {
        context.push('/login');
      }
    }
  }

  void showCustomAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Lottie.asset('assets/lottie/no_internet_connection.json',
                  width: 150, height: 150), // Adjust path as needed
              Text("No Internet Connection"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).pop(), // Dismiss the dialog
                child: Text('Dismiss'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: FadeTransition(
              opacity: _animation,
              child: Container(
                child: Lottie.asset('assets/lottie/animationseven.json',
                    fit: BoxFit.contain),
              ),
            ),
          )
        ],
      ),
    );
  }
}
