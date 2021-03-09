import 'package:beer_team_stable/constants.dart';
import 'package:beer_team_stable/src/business_logic/models/drink_selection_model.dart';
import 'package:beer_team_stable/src/business_logic/services/database_helper.dart';
import 'package:beer_team_stable/src/views/screens/add_selection_screen.dart';
import 'package:beer_team_stable/src/views/widgets/answer_bubble.dart';
import 'package:beer_team_stable/src/views/widgets/historic_result_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // DatabaseHelper.getUserSelections()
    //     .then((snapshot) => print("here: ${snapshot.value}"));
    List<DrinkSelection> comunityList = [];
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration:
            new BoxDecoration(color: Color.fromRGBO(250, 250, 250, 1.0)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(500, 50),
            )),
            title: Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  CircleAvatar(
                    child: Icon(Icons.person_add_alt),
                  ),
                  CircleAvatar(
                    child: Icon(Icons.settings),
                  )
                ],
              ),
            ),
          ),
          body: Stack(children: [
            ListView(
              children: <Widget>[
                Text(
                  'Pending votes',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                FutureBuilder(
                    future: DatabaseHelper.getUserSelections().once(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        comunityList.clear();
                        Map<dynamic, dynamic> map = snapshot.data.value;
                        List<dynamic> list = map.values.toList();
                        return SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return HomeTile(
                                    child: AnswerBubble(
                                  votersNumber: 16,
                                  poolName: list[index]["selectionName"],
                                  questionsAmount: 1,
                                  timeLeft: '2 days',
                                  description: list[index]
                                      ["selectionDescription"],
                                ));
                              },
                              itemCount: list.length,
                              // )
                              // ;
                              // },
                            ));
                      }
                      return SizedBox(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: Text('no data yet'));
                    }),
                HomeRowTile(
                  header: 'Community pools',
                  items: [
                    HomeTile(
                        child: AnswerBubble(
                          votersNumber: 10,
                          poolName: 'Polish best',
                          questionsAmount: 12,
                          timeLeft: '2 days',
                          description: 'all the classics of polish culture',
                        ),
                        fontSize: constPrimaryFontSize),
                    HomeTile(
                        child: AnswerBubble(
                          votersNumber: 1,
                          poolName: 'Classic lagers',
                          questionsAmount: 5,
                          timeLeft: '10 days',
                          description: 'all time best lagers',
                        ),
                        fontSize: constPrimaryFontSize),
                    HomeTile(
                        child: AnswerBubble(
                          votersNumber: 2,
                          poolName: 'Classic pils',
                          questionsAmount: 12,
                          timeLeft: '4 hours',
                          description: 'finest selection of pils',
                        ),
                        fontSize: constPrimaryFontSize,
                        header: 'secondTile')
                  ],
                ),
                HomeRowTile(
                  header: 'Historic results',
                  items: [
                    HomeTile(
                        child: HistoricResultBubble(
                          poolName: 'Polish cheap',
                          first: 'Piast',
                          second: 'Warka',
                          third: 'Lech',
                        ),
                        fontSize: constPrimaryFontSize,
                        header: 'secondTile')
                  ],
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                  child: GestureDetector(
                    onTapUp: (tapUpDetails) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddSelectionScreen()),
                      );
                    },
                    child: LayoutBuilder(builder: (context, constrain) {
                      return Icon(Icons.add_circle,
                          size: constrain.biggest.height,
                          color: constPrimaryColor);
                    }),
                  )),
            )
          ]),
        ));
  }
}

class HomeRowTile extends StatelessWidget {
  final List<Widget> items;
  final String header;

  const HomeRowTile({
    Key key,
    this.header,
    this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 20),
          child: Text(
            header,
            style: GoogleFonts.openSans(fontSize: 24),
          ),
        ),
        SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: items),
        )
      ],
    );
  }
}

class HomeTile extends StatelessWidget {
  final Widget child;
  final String header;
  final double fontSize;

  const HomeTile({
    Key key,
    this.child,
    this.header,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          height: 150,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)]),
          child: child,
        )
      ],
    );
  }
}
