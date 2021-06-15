import 'package:dog_breeds_app/blocs/dog_bloc.dart';
import 'package:dog_breeds_app/constants.dart';
import 'package:dog_breeds_app/screens/dog_screen.dart';
import 'package:dog_breeds_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

// TODO: Remove it. It was for testing nested MaterialApps
class MyAppParent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.routeName,
      onGenerateRoute: (RouteSettings settings) {
        var routes = <String, Widget>{
          HomeScreen.routeName: MyApp(),
        };

        WidgetBuilder builder = (context) {
          // print('RETURNING MYAPP PARENT');
          return Center(
            child: Container(
              height: 500.0,
              child: routes[settings.name],
            ),
          );
        };
        return MaterialPageRoute(builder: (ctx) => builder(ctx));
      },
      // home: Builder(
      //   builder: (c) => MediaQuery(
      //     data: MediaQuery.of(c).copyWith(size: size),
      //     child: HomeScreen(),
      //   ),
      // ),
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        primaryColorLight: kPrimaryColorLight,
        accentColor: kAccentColor,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  final Size size;

  const MyApp({this.size});

  @override
  Widget build(BuildContext context) {
    // print("MY_APP_REBUILT");

    return ChangeNotifierProvider<DogBloc>(
      create: (context) => DogBloc(),
      child: MaterialApp(
        // initialRoute: HomeScreen.routeName,
        onGenerateRoute: (RouteSettings settings) {
          var routes = <String, Widget>{
            HomeScreen.routeName: HomeScreen(),
            DogScreen.routeName: DogScreen(settings.arguments)
          };

          WidgetBuilder builder = (context) {
            // print('RETURNING MEDIAQUERY: ${settings.name}');

            return LayoutBuilder(
              builder: (c, cd) {
                // print('RETURNING MEDIAQUERY: ${settings.name}, $cd');

                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(size: size),
                  child: routes[settings.name],
                );
              },
            );
          };
          return MaterialPageRoute(
              builder: (ctx) => builder(ctx), settings: settings);
        },
        home: MediaQuery(
          data: MediaQuery.of(context).copyWith(size: size),
          child: HomeScreen(),
        ),
        // home: Builder(
        //   builder: (c) => MediaQuery(
        //     data: MediaQuery.of(c).copyWith(size: size),
        //     child: HomeScreen(),
        //   ),
        // ),
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          primaryColorLight: kPrimaryColorLight,
          accentColor: kAccentColor,
        ),
      ),
    );
  }
}
