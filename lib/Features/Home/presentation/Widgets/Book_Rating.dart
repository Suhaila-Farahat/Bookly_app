import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, required this.rating,});

  final dynamic rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 25,
        ),
        Text(
          '$rating',
          style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: AppFont().cairoRegular

          ),
        ),
      ],
    );
  }
}