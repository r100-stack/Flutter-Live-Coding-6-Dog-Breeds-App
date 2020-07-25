import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_breeds_app/constants.dart';
import 'package:dog_breeds_app/widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imageUrl;

  CustomImage(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kDefaultBorderMargin)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(kDefaultBorderMargin),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) => CustomProgressIndicator(),
            errorWidget: (context, url, error) =>
                Icon(Icons.broken_image),
          ),
        ),
      ),
    );
  }
}
