import 'package:book_app/models/categories.dart';
import 'package:flutter/material.dart';

class AdProvider with ChangeNotifier {
  var cats = Categories.storedCategories;

  void addCategory(String cat) {
    cats.add(cat);
  }
}
