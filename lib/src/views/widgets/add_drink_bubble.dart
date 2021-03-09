import 'package:flutter/material.dart';

class AddDrinkBubble extends StatelessWidget {
  final Image image;
  final String drinkName;

  const AddDrinkBubble({Key key, this.image, this.drinkName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 100,
        child: Column(
          children: [
            Container(
              height: 80,
              width: 80,
              child: FittedBox(
                  child: Image.network(
                'https://picsum.photos/250?image=9',
                fit: BoxFit.cover,
              )),
            ),
            Text(
              drinkName,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}
