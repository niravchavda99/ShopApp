import 'package:flutter/material.dart';

import '../models/Brand.dart';

class Brands with ChangeNotifier {
  List<Brand> _brands = [
    Brand(
      id: '607d7b7be9489b13d02f66fd',
      name: 'Red Cherry',
      imageUrl: 'https://www.iconsdb.com/icons/preview/red/cherry-xxl.png',
    ),
    Brand(
      id: '607d4ffc5cc5682098258ab4',
      name: 'Blue Dragon',
      imageUrl:
          'https://pixfeeds.com/images/astrology/zodiac-signs/1200-92040747-dragon-zodiac-sign.jpg',
    ),
    Brand(
      id: '607d4ffc5cc5682098258ab6',
      name: 'White Fish',
      imageUrl: 'https://www.iconsdb.com/icons/preview/white/fish-8-xxl.png',
    ),
    Brand(
      id: '607d7b7be9489b13d02f66fc',
      name: 'Black Horse',
      imageUrl: 'https://image.flaticon.com/icons/png/512/32/32707.png',
    ),
    Brand(
      id: '607d4ffc5cc5682098258ab5',
      name: 'Orange Jelly',
      imageUrl:
          'https://image.freepik.com/free-vector/orange-slice-jelly-candy-icon_100011-189.jpg',
    ),
  ];

  List<Brand> get brands {
    return [..._brands];
  }

  Brand find(String name) {
    return _brands.firstWhere((brand) => brand.name == name, orElse: null);
  }

  Brand findById(String id) {
    return _brands.firstWhere((brand) => brand.id == id, orElse: null);
  }
}
