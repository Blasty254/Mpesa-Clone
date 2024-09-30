import 'package:flutter/material.dart';

class AdsContainerWithIndicator extends StatefulWidget {
  const AdsContainerWithIndicator({super.key});

  @override
  _AdsContainerWithIndicatorState createState() =>
      _AdsContainerWithIndicatorState();
}

class _AdsContainerWithIndicatorState extends State<AdsContainerWithIndicator> {
  final List<String> imageUrls = [
    'assets/images/adcardafricanboy.jpg',
    'assets/images/adcardafrowoman.jpg',
    'assets/images/adcardmillenial.jpg',
    'assets/images/adcardtwo.jpg',
    'assets/images/adcardpinklady.jpg',
  ]; // Your image URLs here
  int _currentIndex = 0; // To keep track of the current index

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180,
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              var currentItem = (scrollInfo.metrics.pixels / 250)
                  .round(); // Assuming each item is 250 pixels wide
              if (currentItem != _currentIndex) {
                setState(() {
                  _currentIndex = currentItem;
                });
              }
              return true; // Return true to cancel the notification bubbling.
            },
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 425,
                  height: double.maxFinite,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(imageUrls[index]),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
              controller: ScrollController(
                  initialScrollOffset:
                      0.0), // Optional: Controller to manage scroll position
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(imageUrls.length,
              (index) => buildIndicator(index == _currentIndex)),
        ),
      ],
    );
  }

  Widget buildIndicator(bool isActive) {
    return Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.blue : Colors.grey,
      ),
    );
  }
}
