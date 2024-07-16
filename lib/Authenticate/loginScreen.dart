import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:tollo_on_flutter/Providers/auth_provider.dart';
import 'package:tollo_on_flutter/UI/homePage.dart';
import 'package:tollo_on_flutter/shared/appstyle.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AuthNotifier = ref.watch(authNotifierProvider.notifier);
    final _formKey = GlobalKey<FormState>();
    String _email = '';
    String _password = '';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Login',
                      style: appstyle(25, Colors.black, FontWeight.bold)),
                )),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Welcome to the Tollo app',
                    style: appstyle(15, Colors.black, FontWeight.bold),
                  ),
                ),
                Container(
                  child:
                      Lottie.asset('assets/lottie/animationloginscreen.json'),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(color: Colors.blue, width: 2.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        showCursor: true,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelStyle: TextStyle(color: Colors.black),
                          icon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _email = value!;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(
                          color: Colors.blue,
                          width: 2.0,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'password',
                            labelStyle: TextStyle(color: Colors.black),
                            icon: Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 5.0)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _password = value!;
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          bool loginSuccessful =
                              await AuthNotifier.login(_email, _password);
                          if (loginSuccessful) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          }
                        }
                      },
                      child: Text(
                        'Login',
                        style: appstyle(15, Colors.black, FontWeight.bold),
                      )),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have you registered yet?',
                      style: appstyle(10, Colors.black, FontWeight.normal),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Register Now',
                          style:
                              appstyle(10, Colors.blueAccent, FontWeight.w400),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
