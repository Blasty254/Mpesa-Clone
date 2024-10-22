import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tollo_on_flutter/shared/appstyle.dart';

import '../Providers/auth_provider.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef  ref) {
    final authNotifier = ref.watch(authNotifierProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      authNotifier.refreshUser();
    });

    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  context.go('/SettingsPage');
                },
                child: Consumer(
                  builder: (context, ref, _) {
                    final authNotifier =
                    ref.watch(authNotifierProvider.notifier);
                    return CircleAvatar(
                      backgroundImage: authNotifier.userPhotoUrl != null
                          ? NetworkImage(authNotifier.userPhotoUrl!)
                          : const AssetImage('assets/images/tollopay.png')
                      as ImageProvider,
                    );
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getGreetingMessage(),
                    style: appstyle(15, Theme.of(context).colorScheme.secondary,
                        FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Consumer(
                    builder: (context, ref, _) {
                      final authNotifier =
                      ref.watch(authNotifierProvider.notifier);
                      return Text(
                        authNotifier.userFirstName ?? 'User',
                        style: appstyle(
                            15,
                            Theme.of(context).colorScheme.secondary,
                            FontWeight.w400),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Function to determine greeting based on time
  String getGreetingMessage() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return 'Good morning,';
    } else if (hour < 17) {
      return 'Good afternoon,';
    } else {
      return 'Good evening,';
    }
  }
}
