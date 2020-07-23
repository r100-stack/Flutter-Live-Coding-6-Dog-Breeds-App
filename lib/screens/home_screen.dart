import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_breeds_app/blocs/dog_bloc.dart';
import 'package:dog_breeds_app/constants.dart';
import 'package:dog_breeds_app/models/dog.dart';
import 'package:dog_breeds_app/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomeScreen extends StatefulWidget {
  static final String routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void getDogBreeds() async {
    NetworkHelper helper = NetworkHelper('$kApiUrl/breeds');
    var data = await helper.getData();
    try {
      List<Dog> dogs = [];
      for (var dog in data) {
        Dog dogObject = Dog(
          bredFor: dog['bred_for'],
          breedGroup: dog['breed_group'],
          id: dog['id'],
          lifeSpan: dog['life_span'],
          name: dog['name'],
          origin: dog['origin'],
          temperament: dog['temperament'],
        );
        dogObject.height['imperial'] = dog['height']['imperial'];
        dogObject.height['metric'] = dog['height']['metric'];
        dogObject.weight['imperial'] = dog['weight']['imperial'];
        dogObject.weight['metric'] = dog['weight']['metric'];
        dogs.add(dogObject);
      }

      for (Dog dogObject in dogs) {
        NetworkHelper helper = NetworkHelper('$kApiUrl/images/search?breed_id${dogObject.id}');
        var data = await helper.getData();
        try {
          dogObject.imageUrl = data[0]['url'];
        } catch (e) {
          print(e);
        }
      }

      Provider.of<DogBloc>(context, listen: false).updateDogsList(dogs);
    } catch (e) {
      print(e);
      Alert(context: context, title: 'Error downloading dog breeds').show();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDogBreeds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dog Breeds'),
      ),
      body: Scrollbar(
        child: ListView.builder(
          cacheExtent: 100,
          itemBuilder: (context, index) {
            Dog dog = Provider.of<DogBloc>(context).dogs[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: kSmallMargin, vertical: kSmallMargin/2),
              child: Card(
                color: Theme.of(context).primaryColorLight,
                child: Padding(
                  padding: EdgeInsets.all(kSmallMargin),
                  child: Column(
                    children: <Widget>[
                      CachedNetworkImage(
                        height: 300,
                        imageUrl: dog.imageUrl,
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.broken_image),
                      ),
                      Text(dog.name, style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.black87
                      ),)
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: Provider.of<DogBloc>(context).dogs.length,),
      ),
//      body: GridView.builder(
//          gridDelegate:
//              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//          itemBuilder: (context, index) {
//            Dog dog = Provider.of<DogBloc>(context).dogs[index];
//            return Card(
//              color: Theme.of(context).primaryColorLight,
//              child: Column(
//                children: <Widget>[
//                  Flexible(
//                    child: CachedNetworkImage(
//                      imageUrl: dog.imageUrl,
//                      placeholder: (context, url) => CircularProgressIndicator(),
//                      errorWidget: (context, url, error) => Icon(Icons.broken_image),
//                    ),
//                  ),
//                  Text(dog.name, style: Theme.of(context).textTheme.subtitle1,)
//                ],
//              ),
//            );
//          },
//      itemCount: Provider.of<DogBloc>(context).dogs.length,),
    );
  }
}
