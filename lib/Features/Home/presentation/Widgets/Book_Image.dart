import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookImage extends StatelessWidget {
  const BookImage({super.key, required this.imageUrl, });

  final String imageUrl;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: AspectRatio(
          aspectRatio: 0.60,
          child: CachedNetworkImage(
              imageUrl: imageUrl,
              errorWidget: (context, url, error) => const Icon(Icons.error,size: 40,),
              fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
  
}
