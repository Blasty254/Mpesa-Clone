import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tollo_on_flutter/shared/RoundedIconHorizontal.dart';
import 'package:tollo_on_flutter/shared/appstyle.dart';

class SelectContact extends ConsumerWidget {
  const SelectContact({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          context.go('/homepage');
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: Theme.of(context).colorScheme.primary,
                        )),
                    Text(
                      'Select Contact',
                      style: appstyle(16, Theme.of(context).colorScheme.primary,
                          FontWeight.normal),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search Contacts',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RoundIconHorizontalTextWidget(
                    text: 'Enter Phone Number',
                    imagePath: 'assets/icons/keyboard.png',
                    onTap: () {
                      context.go('/EnterPhoneNumber');
                    },
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.amber,
                        height: 200,
                        child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return (Text('contact $index'));
                            }),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
