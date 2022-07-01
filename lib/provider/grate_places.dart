import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:greatplaces/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Place getItem(int index) {
    return _items[index];
  }

  void addPalce(String title, File image) {
    final newPalce = Place(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
      location: null,
    );
    _items.add(newPalce);
    notifyListeners();
  }
}
