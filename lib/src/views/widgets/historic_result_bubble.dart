import 'package:flutter/widgets.dart';

class HistoricResultBubble extends StatelessWidget {
  final String poolName;
  final String first;
  final String second;
  final String third;

  const HistoricResultBubble(
      {Key key, this.poolName, this.first, this.second, this.third})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(poolName, style: TextStyle(fontWeight: FontWeight.bold)),
        Container(
          padding: EdgeInsets.only(top: 10),
          child: Column(children: [
            Text(
              'I  ' + first,
            ),
            Text('II ' + second),
            Text('III ' + third)
          ]),
        ),
      ],
    );
  }
}
