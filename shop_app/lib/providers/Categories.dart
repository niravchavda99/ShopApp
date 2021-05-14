import 'package:flutter/material.dart';

import '../models/Category.dart';

class Categories with ChangeNotifier {
  List<Category> _categories = [
    Category(
      id: '607d4ffc5cc5682098258ab4',
      name: 'Electronics',
      imageUrl:
          'https://www.iconsdb.com/icons/preview/black/electronics-xxl.png',
    ),
    Category(
      id: '607d4ffc5cc5682098258ab6',
      name: 'Fashion',
      imageUrl:
          'https://cdn4.iconfinder.com/data/icons/geometrica-1/48/crutch-coat-hanger-dress-512.png',
    ),
    Category(
      id: '607d7b7be9489b13d02f66fc',
      name: 'Home',
      imageUrl: 'https://www.iconsdb.com/icons/preview/black/home-xxl.png',
    ),
    Category(
      id: '607d4ffc5cc5682098258ab5',
      name: 'Others',
      imageUrl:
          'https://cdn1.iconfinder.com/data/icons/smoothline-action/30/action_028-detail-more-info-others-512.png',
    ),
  ];

  List<Category> get categories {
    return [..._categories];
  }

  Category find(String name) {
    return _categories.firstWhere((category) => category.name == name,
        orElse: null);
  }

  Category findById(String id) {
    return _categories.firstWhere((category) => category.id == id,
        orElse: null);
  }
}
