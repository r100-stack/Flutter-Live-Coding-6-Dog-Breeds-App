import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_breeds_app/widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';

// import 'dart:io' show Platform;

class CustomImage extends StatelessWidget {
  final String imageUrl;

  CustomImage(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    bool isMobile = true;
    // try {
    //   if (!Platform.isAndroid) {
    //     isMobile = false;
    //   }
    // } catch (e) {
    //   print(e);
    // }

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Hero(
        tag: imageUrl,
        child: isMobile
            ? CachedNetworkImage(
                // imageUrl: 'https://flutter-cors-proxy.herokuapp.com/' + imageUrl,
                imageUrl: imageUrl,
                placeholder: (context, url) => CustomProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.broken_image))
            : Image(
                image: NetworkImage(imageUrl),
              ),
//        child: CachedNetworkImage(
//            imageUrl: imageUrl,
//            placeholder: (context, url) => CustomProgressIndicator(),
//            errorWidget: (context, url, error) => Icon(Icons.broken_image)),
//      child: Image(
//        image: NetworkImage(imageUrl),
//      ),
      ),
    );

//    return Container(
//      child: Row(
//        mainAxisSize: MainAxisSize.min,
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          Flexible(
//            child: Container(
//              decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(kDefaultBorderMargin)
//              ),
//              child: ClipRRect(
//                borderRadius: BorderRadius.circular(kDefaultBorderMargin),
//                child: CachedNetworkImage(
//                  imageUrl: imageUrl,
//                  placeholder: (context, url) => CustomProgressIndicator(),
//                  errorWidget: (context, url, error) =>
//                      Icon(Icons.broken_image),
//                ),
//              ),
//            ),
//          ),
//        ],
//      ),
//    );
  }
}
