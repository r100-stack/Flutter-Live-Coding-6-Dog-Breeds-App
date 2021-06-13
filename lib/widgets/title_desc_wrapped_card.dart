import 'package:dog_breeds_app/utils/style_utils.dart';
import 'package:dog_breeds_app/widgets/wraped_card.dart';
import 'package:flutter/material.dart';

class TitleDescWrappedCard extends StatelessWidget {
  final String title;
  final Widget desc;
  final String descString;

  TitleDescWrappedCard({this.title, this.desc, this.descString});

  @override
  Widget build(BuildContext context) {
    bool displayDesc = desc != null || descString != null;

    return WrappedCard(
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: StyleUtils.getTitleTextStyle(context),
          ),
          SizedBox(
            height: 10,
          ),
          Visibility(
            visible: displayDesc,
            child: desc != null
                ? desc
                : Text(
                    descString != null ? descString : '' ,
                    style: StyleUtils.getDescTextStyle(context),
                  ),
          )
        ],
      ),
    );
  }
}
