import 'package:flutter/material.dart';

class ProductRating extends StatelessWidget {
  ProductRating(this.rating, {Key key, this.color, this.size})
      : super(key: key);

  final double rating;
  final Color color;
  final double size;

  Widget _getIcon(IconData iconData) {
    return Icon(
      iconData,
      color: color,
      size: size,
    );
  }

  List<Widget> _renderRow() {
    final full = rating.floor();
    final half = rating.ceil() - full;
    final remaining = 5 - full - half;
    List<Widget> stars = [];

    // Full Stars
    for (int i = 0; i < full; i++) stars.add(_getIcon(Icons.star));

    // Half Stars
    if (half > 0) stars.add(_getIcon(Icons.star_half));

    int i;
    // Empty Stars
    for (i = 0; i < remaining; i++) stars.add(_getIcon(Icons.star_border));

    return stars;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (size * 5),
      child: Row(
        children: _renderRow()
            .map((s) => Container(
                  child: s,
                ))
            .toList(),
      ),
    );
  }
}
