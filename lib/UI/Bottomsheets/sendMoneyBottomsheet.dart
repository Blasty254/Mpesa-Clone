import 'package:flutter/material.dart';
import 'package:tollo_on_flutter/shared/RoundedIconHorizontal.dart';
import 'package:tollo_on_flutter/shared/appstyle.dart';

class SendmoneyBottomsheet extends StatelessWidget {
  const SendmoneyBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  width: 50,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Send and Request',
                style: appstyle(24, Theme.of(context).colorScheme.primary,
                    FontWeight.normal),
              ),
            ),
            RoundIconHorizontalTextWidget(
              imagePath: 'assets/icons/banknote.png',
              text: 'Send Money',
              onTap: () {},
            ),
            RoundIconHorizontalTextWidget(
              imagePath: 'assets/icons/banknote.png',
              text: 'Request Money',
              onTap: () {},
            ),
            RoundIconHorizontalTextWidget(
              imagePath: 'assets/icons/banknote.png',
              text: 'Global',
              onTap: () {},
            ),
            RoundIconHorizontalTextWidget(
              imagePath: 'assets/icons/banknote.png',
              text: 'Scan Q.R',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
