import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tollo_on_flutter/Providers/transactionsProvider.dart';
import 'package:tollo_on_flutter/shared/appstyle.dart';
import 'package:intl/intl.dart';

class Statements extends ConsumerWidget {
  const Statements({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(transactionsProvider);
    final transaction = transactions.isNotEmpty ? transactions.first : null;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    context.push(
                        '/homepage'); // Navigate back to the previous screen
                  },
                  child: const Icon(Icons.arrow_back),
                ),
                Text(
                  'M-Pesa Statements',
                  style: appstyle(15, Theme.of(context).colorScheme.primary,
                      FontWeight.w700),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            if (transaction != null)
              Container(
                height: 35,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      transaction.month,
                      style: appstyle(12, Colors.white, FontWeight.normal),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 15),
            if (transactions.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final currentTransaction = transactions[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            child: Text(
                              currentTransaction.initials,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.tertiary,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${currentTransaction.firstName} ${currentTransaction.lastName}',
                                style: appstyle(
                                    14,
                                    Theme.of(context).colorScheme.secondary,
                                    FontWeight.bold),
                              ),
                              Text(currentTransaction.phoneNumber),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                  'Ksh ${currentTransaction.amount.toStringAsFixed(2)}'),
                              Text(DateFormat('dd/MM HH:mm')
                                  .format(currentTransaction.dateTime)),
                            ],
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    );
                    // or any other widget to display when currentTransaction is null
                  },
                ),
              )
            else
              Expanded(
                  child: Center(
                child: Text(
                  'No Statements Available!!',
                  style: appstyle(20, Theme.of(context).colorScheme.primary,
                      FontWeight.bold),
                ),
              ))
          ],
        ),
      ),
    );
  }
}
