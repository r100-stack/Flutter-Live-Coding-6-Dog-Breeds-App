import 'package:dog_breeds_app/blocs/dog_bloc.dart';
import 'package:dog_breeds_app/constants.dart';
import 'package:dog_breeds_app/screens/dog_screen.dart';
import 'package:dog_breeds_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DogBloc>(
      create: (context) => DogBloc(),
      child: MaterialApp(
        initialRoute: HomeScreen.routeName,
        onGenerateRoute: (RouteSettings settings) {
          var routes = <String, WidgetBuilder> {
            HomeScreen.routeName: (context) => HomeScreen(),
            DogScreen.routeName: (context) => DogScreen(settings.arguments)
          };
          WidgetBuilder builder = routes[settings.name];
          return MaterialPageRoute(builder: (ctx) => builder(ctx));
        },
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          primaryColorLight: kPrimaryColorLight,
          accentColor: kAccentColor
        ),
      ),
    );
  }
}
