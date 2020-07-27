import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_breeds_app/constants.dart';
import 'package:dog_breeds_app/models/dog.dart';
import 'package:dog_breeds_app/utils/country_utils.dart';
import 'package:dog_breeds_app/widgets/custom_image.dart';
import 'package:dog_breeds_app/widgets/custom_progress_indicator.dart';
import 'package:dog_breeds_app/widgets/flag_view.dart';
import 'package:dog_breeds_app/widgets/images_page_view.dart';
import 'package:dog_breeds_app/widgets/metric_card.dart';
import 'package:dog_breeds_app/widgets/metrics_bar.dart';
import 'package:dog_breeds_app/widgets/origins_bar.dart';
import 'package:dog_breeds_app/widgets/title_desc_wrapped_card.dart';
import 'package:dog_breeds_app/widgets/wraped_card.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

class DogScreen extends StatelessWidget {
  static final String routeName = '/dog';
  final Dog dog;

  DogScreen(this.dog);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          dog.name,
          style: kAppBarTextStyle,
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: kDefaultBorderRadius),
        child: ClipRRect(
          borderRadius: kDefaultBorderRadius,
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .35,
                child: ImagesPageView(dog.imageUrls),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: kDefaultBorderRadius),
                  child: ClipRRect(
                    borderRadius: kDefaultBorderRadius,
                    child: ListView(
                      children: [
//                        WrappedCard(
//                          child: Text('${dog.breedGroup} Dog',
//                              textAlign: TextAlign.center,
//                              style: Theme.of(context).textTheme.headline6),
//                        ),
                        TitleDescWrappedCard(title: dog.breedGroup),
                        MetricsBar(dog),
                        OriginCard(dog.origin),
                        TitleDescWrappedCard(
                          title: 'Temperament',
                          descString: dog.temperament,
                        ),
                        TitleDescWrappedCard(
                          title: 'Bred For',
                          descString: dog.bredFor,
                        ),
                        TitleDescWrappedCard(
                          title: 'Life Span',
                          descString: dog.lifeSpan,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

////                        Row(
////                          mainAxisAlignment: MainAxisAlignment.center,
////                          children: [
////                            Padding(
////                              padding: EdgeInsets.all(10),
////                              child: Card(
////                                color: Theme.of(context).primaryColor,
////                                elevation: 3,
////                                child: Padding(
////                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
////                                  child: Text(
////                                    '${dog.breedGroup} Dog',
////                                    textAlign: TextAlign.center,
////                                    style: Theme.of(context).textTheme.headline6.apply(
////                                      color: Colors.white
////                                    ),
////                                  ),
////                                ),
////                              ),
////                            )
////                          ],
////                        ),
