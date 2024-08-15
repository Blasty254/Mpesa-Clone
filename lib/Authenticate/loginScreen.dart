import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:tollo_on_flutter/Providers/auth_provider.dart';
import 'package:tollo_on_flutter/shared/appstyle.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AuthNotifier = ref.watch(authNotifierProvider.notifier);
    final formKey = GlobalKey<FormState>();
    String email = '';
    String password = '';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
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
                  padding: const EdgeInsets.all(8.0),
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
                        style: const TextStyle(color: Colors.black),
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
                          email = value!;
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
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
                        style: const TextStyle(color: Colors.black),
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
                          password = value!;
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
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          bool loginSuccessful =
                              await AuthNotifier.login(email, password);
                          if (loginSuccessful) {
                            context.go('/homepage');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Login failed')));
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
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: OutlinedButton(
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(width: 1.0),
                          backgroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 50)),
                      onPressed: () async {
                        bool loginSuccessful =
                            await AuthNotifier.signInWithGoogle();
                        print('Login Successful : $loginSuccessful');
                        if (loginSuccessful) {
                          context.go('/homepage');
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                                'assets/images/android_light_rd_na@4x.png'),
                          ),
                          const Expanded(child: SizedBox()),
                          const Text('Continue with google'),
                          const Expanded(child: SizedBox()),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
