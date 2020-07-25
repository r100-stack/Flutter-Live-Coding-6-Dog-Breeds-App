import 'package:flutter/material.dart';

enum Dimension {Height, Weight}

class MetricCard extends StatelessWidget {
  final Dimension dimension;
  final String imperial;
  final String metric;

  MetricCard({this.dimension, this.imperial, this.metric});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: Colors.lightGreen[100],
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(dimension == Dimension.Height ? 'Height' : 'Weight', style: Theme.of(context).textTheme.subtitle1,),
              SizedBox(height: 10,),
              Text('$imperial ${dimension == Dimension.Height ? 'in' : 'lb'} ', style: Theme.of(context).textTheme.headline5,),
              Text('$metric ${dimension == Dimension.Height ? 'cm' : 'kg'}', style: Theme.of(context).textTheme.headline5,)
            ],
          ),
        ),
      ),
    );
  }
}
