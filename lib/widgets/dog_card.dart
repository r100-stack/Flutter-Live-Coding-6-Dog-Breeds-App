import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_breeds_app/blocs/dog_bloc.dart';
import 'package:dog_breeds_app/constants.dart';
import 'package:dog_breeds_app/models/dog.dart';
import 'package:dog_breeds_app/services/networking.dart';
import 'package:dog_breeds_app/widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DogCard extends StatelessWidget {
  final Dog dog;

  DogCard(this.dog);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).primaryColorLight,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
            Expanded(
              child: Container(
                child: dog.isDownloading
                    ? CustomProgressIndicator()
                    : CachedNetworkImage(
                        imageUrl: dog.imageUrl,
                        placeholder: (context, url) =>
                            CustomProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            Icon(Icons.broken_image),
                      ),
              ),
            ),
            Text(dog.name, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline6,)
          ]),
        ));
  }
}

//Card(
//        color: Theme.of(context).primaryColorLight,
//        child: Padding(
//          padding: EdgeInsets.all(kSmallMargin),
//          child: Column(
//            children: <Widget>[
//              dog.isDownloading
//                  ? CircularProgressIndicator()
//                  : CachedNetworkImage(
//                      imageUrl: dog.imageUrl,
//                      placeholder: (context, url) =>
//                          CircularProgressIndicator(),
//                      errorWidget: (context, url, error) =>
//                          Icon(Icons.broken_image),
//                    ),
//              Text(
//                dog.name,
//                style: Theme.of(context)
//                    .textTheme
//                    .headline6
//                    .copyWith(color: Colors.black87),
//              )
//            ],
//          ),
//        ),
//      )
