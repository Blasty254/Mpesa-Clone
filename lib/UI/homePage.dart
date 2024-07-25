import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:tollo_on_flutter/Providers/transactionsProvider.dart';
import 'package:tollo_on_flutter/shared/RoundedIconWidget.dart';
import 'package:tollo_on_flutter/shared/adsContainers.dart';
import 'package:tollo_on_flutter/shared/appstyle.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(transactionsProvider);
    final transaction = transactions.isNotEmpty ? transactions.first : null;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          floating: true,
          snap: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/tollopay.png'),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good morning ,',
                    style: appstyle(15, Theme.of(context).colorScheme.secondary,
                        FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Jeff',
                    style: appstyle(15, Theme.of(context).colorScheme.secondary,
                        FontWeight.w400),
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_active_outlined)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.pie_chart_rounded)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.qr_code_2_sharp)),
                ],
              )
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 100,
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Balance',
                      style: appstyle(
                          10,
                          Theme.of(context).colorScheme.secondary,
                          FontWeight.normal),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ksh. 3,523.55',
                        style: appstyle(
                            20,
                            Theme.of(context).colorScheme.secondary,
                            FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.remove_red_eye_outlined),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox())
                ],
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RoundIconTextWidget(
                    imagePath: 'assets/icons/banknote.png',
                    text: 'Send \nMoney'),
                RoundIconTextWidget(
                    imagePath: 'assets/icons/cash.png', text: 'Pay'),
                RoundIconTextWidget(
                    imagePath: 'assets/icons/money.png', text: 'Withdraw'),
                RoundIconTextWidget(
                    imagePath: 'assets/icons/sendmoney.png', text: 'Airtime'),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('M-PESA STATEMENTS',
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ))),
                TextButton(
                    onPressed: () {
                      context.go('/statements');
                    },
                    child: Text('SEE ALL',
                        style: appstyle(12, Colors.green, FontWeight.normal))),
              ],
            ),
          ),
        ),
        if (transaction != null) // Check if there is a transaction to display
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .primary, // Choose a suitable background color
                    child: Text(
                      transaction.initials,
                      style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .tertiary, // Ensure the text color contrasts with the background
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${transaction.firstName} ${transaction.lastName}',
                        style: appstyle(
                            14,
                            Theme.of(context).colorScheme.secondary,
                            FontWeight.bold),
                      ),
                      Text(transaction.phoneNumber),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Ksh ${transaction.amount.toStringAsFixed(2)}'),
                      Text(DateFormat('dd/MM HH:mm')
                          .format(transaction.dateTime)),
                    ],
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
          )
        else
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('No Statements available !!',
                      style: appstyle(
                          16,
                          Theme.of(context).colorScheme.secondary,
                          FontWeight.normal)),
                ],
              ),
            ),
          ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: AdsContainerWithIndicator(),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 170,
            margin: EdgeInsets.all(10),
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Financial Services',
                          style: appstyle(
                              14,
                              Theme.of(context).colorScheme.secondary,
                              FontWeight.normal),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text('View All',
                                style: appstyle(
                                    14, Colors.green, FontWeight.w400))),
                      ],
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RoundIconTextWidget(
                          imagePath: 'assets/icons/moneybag.png', text: 'Mali'),
                      RoundIconTextWidget(
                          lottiePath: 'assets/lottie/animationchecklist.json',
                          text: 'M-pesa Go'),
                      RoundIconTextWidget(
                          imagePath: 'assets/icons/moneybag.png',
                          text: 'M-Shwari'),
                      RoundIconTextWidget(
                          lottiePath: 'assets/lottie/animationfour.json',
                          text: 'KCB\nMpesa'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
            child: Container(
          child: Lottie.asset('assets/lottie/animationthree.json',
              animate: true, height: 150, width: 150),
        ))
      ]),
    );
  }
}
