import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingWidget extends StatefulWidget {
  RatingWidget({Key key, this.icon, this.color, this.itemCount})
      : super(key: key);

  final IconData icon;
  final Color color;
  final int itemCount;

  @override
  RatingState createState() {
    return RatingState(icon, color, itemCount);
  }
}

class RatingState extends State<RatingWidget> {
  double rating;

  IconData _icon;
  Color _color;
  int _itemCount;

  RatingState(IconData icon, Color color, int itemCount) {
    _icon = icon;
    _color = color;
    _itemCount = itemCount;
  }

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 3,
      minRating: 0.5,
      direction: Axis.horizontal,
      allowHalfRating: true,
      unratedColor: _color.withAlpha(50),
      itemCount: _itemCount,
      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
      itemBuilder: (context, _) => Icon(
        _icon,
        color: _color, 
      ),
      onRatingUpdate: (rate) {
        setState(() {
          rating = rate;
        });
      },
      updateOnDrag: true,
    );
  }
}
