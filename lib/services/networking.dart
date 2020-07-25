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

  static downloadDogImages(BuildContext context, Dog dog) async {
    NetworkHelper helper =
        NetworkHelper('$kApiUrl/images/search?breed_id=${dog.id}&size=med&include_breeds=false&limit=100');
    var data = await helper.getData();
    try {
      List<String> imageUrls = [];
      for (var image in data) {
        imageUrls.add(image['url']);
      }
      Provider.of<DogBloc>(context, listen: false).updateDogImageUrls(dog, imageUrls);
    } catch (e) {
      print(e);
    }

    Provider.of<DogBloc>(context, listen: false).updateDogIsDownloading(dog, false);
  }
}
