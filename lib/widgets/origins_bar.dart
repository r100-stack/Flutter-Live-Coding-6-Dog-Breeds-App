import 'package:dog_breeds_app/utils/country_utils.dart';
import 'package:dog_breeds_app/widgets/flag_view.dart';
import 'package:dog_breeds_app/widgets/title_desc_wrapped_card.dart';
import 'package:dog_breeds_app/widgets/wraped_card.dart';
import 'package:flutter/material.dart';

class OriginCard extends StatelessWidget {
  final String originString;

  OriginCard(this.originString);

  @override
  Widget build(BuildContext context) {
    List<String> origins = originString.split(', ');
    origins.removeWhere((element) => element == '');
    print(origins);
    List<FlagView> flagViews = [];
    for (String origin in origins) {
      flagViews.add(FlagView(CountryUtils.countryCodesFromName[origin]));
    }

    return TitleDescWrappedCard(
      title: 'Origins',
      desc: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: flagViews,
      ),
    );

//    return WrappedCard(
//      child: Column(
//        children: <Widget>[
//          Text(
//            'Origins:',
//            style: Theme.of(context).textTheme.headline6,
//          ),
//          SizedBox(
//            width: 20,
//          ),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: flagViews,
//          )
//        ],
//      ),
//    );
  }
}
