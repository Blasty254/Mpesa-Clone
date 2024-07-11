import 'package:flutter/material.dart';

class HorizontalScrollingImages extends StatelessWidget {
  final List<String> imageUrls = [
    'assets/images/adcardafricanboy.jpg', // Replace with your actual image asset or network URL
    'assets/images/adcardafrowoman.jpg',
    'assets/images/adcardmillenial.jpg',
    'assets/images/adcardtwo.jpg',
    'assets/images/adcardpinklady.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      // Set the height of the container
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length, // Number of items in the list
        itemBuilder: (context, index) {
          return Container(
            width: 250,
            height: double.maxFinite, // Set the width of each container
            margin: EdgeInsets.symmetric(
                horizontal: 5), // Add some spacing around each container
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrls[
                    index]), // Use AssetImage for asset images or NetworkImage for network images
                fit: BoxFit.cover, // Cover the entire container
              ),
            ),
          );
        },
      ),
    );
  }
}
