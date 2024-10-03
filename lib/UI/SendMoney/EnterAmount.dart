import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tollo_on_flutter/Providers/auth_provider.dart';
import 'package:tollo_on_flutter/shared/appstyle.dart';

class EnterAmount extends ConsumerWidget {
  const EnterAmount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(authNotifierProvider.notifier);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            Row(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 25,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.green,
                      ),
                    ),
                    Container(
                      width: 25,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Image.asset('assets/images/profile.png', fit: BoxFit.cover,),
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Trial '),
                    Text('Name'),
                  ],
                ),
                TextFormField(
                  style: appstyle(20, Theme.of(context).colorScheme.secondary,FontWeight.normal),

                )

              ],
            )

          ],
        
        
        ),
      ),
    );
  }
}
