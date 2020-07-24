import 'dart:convert';

import 'package:dog_breeds_app/blocs/dog_bloc.dart';
import 'package:dog_breeds_app/constants.dart';
import 'package:dog_breeds_app/models/dog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class NetworkHelper {
  String url;

  NetworkHelper(this.url);

  dynamic getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }

  static downloadDogImage(BuildContext context, Dog dog) async {
    NetworkHelper helper =
        NetworkHelper('$kApiUrl/images/search?breed_id=${dog.id}&size=small&include_breeds=false');
    var data = await helper.getData();
    try {
      Provider.of<DogBloc>(context, listen: false).updateDogImageUrl(dog, data[0]['url']);
    } catch (e) {
      print(e);
    }

    Provider.of<DogBloc>(context, listen: false).updateDogIsDownloading(dog, false);
  }
}
