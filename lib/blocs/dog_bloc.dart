import 'dart:collection';

import 'package:dog_breeds_app/models/dog.dart';
import 'package:flutter/material.dart';

class DogBloc extends ChangeNotifier {
  List<Dog> _dogs = [];

  List<Dog> get dogs => UnmodifiableListView(_dogs);

  void updateDogsList(List<Dog> dogs) {
    _dogs = dogs;
    notifyListeners();
  }
}