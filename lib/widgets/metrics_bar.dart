import 'package:dog_breeds_app/constants.dart';
import 'package:dog_breeds_app/models/dog.dart';
import 'package:dog_breeds_app/utils/style_utils.dart';
import 'package:dog_breeds_app/widgets/metric_card.dart';
import 'package:dog_breeds_app/widgets/title_desc_wrapped_card.dart';
import 'package:dog_breeds_app/widgets/wraped_card.dart';
import 'package:flutter/material.dart';

class MetricsBar extends StatelessWidget {
  final Dog dog;

  MetricsBar(this.dog);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TitleDescWrappedCard(
            title: 'Height',
            desc: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('${dog.height['imperial']} in', style: StyleUtils.getDescTextStyle(context)),
                Text('${dog.height['metric']} cm', style: StyleUtils.getDescTextStyle(context)),
              ],
            ),
          ),
        ),
        Expanded(
          child: TitleDescWrappedCard(
            title: 'Weight',
            desc: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('${dog.weight['imperial']} lb', style: StyleUtils.getDescTextStyle(context),),
                Text('${dog.weight['metric']} kg', style: StyleUtils.getDescTextStyle(context),),
              ],
            ),
          ),
        )
      ],
    );
  }
}

//Row(
//      children: <Widget>[
//        MetricCard(
//          dimension: Dimension.Height,
//          imperial: dog.height['imperial'],
//          metric: dog.height['metric'],
//          borderRadius: BorderRadius.only(
//              topLeft:
//              Radius.circular(kDefaultBorderMargin)),
//        ),
//        SizedBox(
//          width: 10,
//        ),
//        MetricCard(
//          dimension: Dimension.Weight,
//          imperial: dog.weight['imperial'],
//          metric: dog.weight['metric'],
//          borderRadius: BorderRadius.only(
//              topRight:
//              Radius.circular(kDefaultBorderMargin)),
//        ),
//      ],
//    )
