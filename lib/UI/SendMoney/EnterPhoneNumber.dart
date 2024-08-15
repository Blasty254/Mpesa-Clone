import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tollo_on_flutter/shared/appstyle.dart';

class Enterphonenumber extends ConsumerWidget {
  const Enterphonenumber({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 15.0,
              bottom: 25.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      context.go('/HomePage');
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Theme.of(context).colorScheme.secondary,
                    )),
                Container(
                  height: 5,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Send Money',
                  style: appstyle(25, Colors.green, FontWeight.w400),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      child: TextFormField(
                        style: appstyle(
                            15,
                            Theme.of(context).colorScheme.secondary,
                            FontWeight.normal),
                        showCursor: true,
                        cursorColor: Colors.green.shade400,
                        decoration: const InputDecoration(
                          labelText: 'Enter phone number',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: UnderlineInputBorder(),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.green.shade400),
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Expanded(child: SizedBox()),
                          Text('Continue'),
                          Expanded(child: SizedBox()),
                        ],
                      )),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
