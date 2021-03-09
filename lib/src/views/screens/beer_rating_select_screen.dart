import 'package:beer_team_stable/constants.dart';
import 'package:beer_team_stable/src/views/utils/rating_widget.dart';
import 'package:flutter/material.dart';

class BeerRatingSelectScreen extends StatefulWidget {
  final String beerName;
  final double fontSize;

  const BeerRatingSelectScreen(
      {Key key, this.beerName = 'Placeholder', this.fontSize = 16})
      : super(key: key);
  @override
  BeerRatingSelectState createState() =>
      BeerRatingSelectState(beerName, fontSize);
}

class BeerRatingSelectState extends State<BeerRatingSelectScreen> {
  BeerRatingSelectState(String beerName, double fontSize) {
    _fontSize = fontSize;
    _beerName = beerName;
  }
  List<String> categories = ['Apperance', 'Aroma', 'Flavour', 'Mouthfeel'];
  double _fontSize;
  String _beerName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            _beerName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: _fontSize),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Image.network('https://picsum.photos/250?image=1035'),
            ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: categories.length,
                itemBuilder: (context, index) => RatingTile(
                    fontSize: constPrimaryFontSize,
                    tileDescription: '',
                    tileName: categories[index])),
            Container(
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                    color: constPrimaryColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(2, 2),
                          blurRadius: 3)
                    ]),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                // child: ElevatedButton(
                //   child: Container(
                // margin: EdgeInsets.symmetric(horizontal: 40),
                child: Text('Submit score',
                    style: TextStyle(fontSize: _fontSize + 5)))
            //   ),
            // ),
            //   onPressed: () {
            //     print('submit');
            //   },
            // ),
            // )
          ],
        ));
  }
}

class RatingTile extends StatefulWidget {
  final double fontSize;
  final String tileName;
  final String tileDescription;

  const RatingTile(
      {Key key, this.fontSize, this.tileName, this.tileDescription})
      : super(key: key);

  @override
  _RatingTileState createState() => _RatingTileState();
}

class _RatingTileState extends State<RatingTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 5),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 20),
          child: Text(
            widget.tileName,
            style: TextStyle(fontSize: widget.fontSize),
          ),
        ),
        Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(2, 2), blurRadius: 3)
                ]),
            child: Column(children: [
              RatingWidget(color: Colors.amber, icon: Icons.star, itemCount: 5)
            ])),
      ],
    );
  }
}
