import 'package:flutter/widgets.dart';

class AnswerBubble extends StatelessWidget {
  final double maxVoters;
  final String poolName;
  final double votersNumber;
  final double questionsAmount;
  final String timeLeft;
  final String description;

  const AnswerBubble(
      {Key key,
      this.maxVoters = 16,
      this.poolName,
      this.votersNumber,
      this.questionsAmount,
      this.timeLeft,
      this.description = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(poolName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      ]),
      description != '' ? buildCommunityLeftSide() : buildPrivateLeftSide(),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Time left: '), Text(timeLeft.toString())])
    ]);
  }

  Widget buildPrivateLeftSide() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Text(
          votersNumber.toInt().toString() + '/' + maxVoters.toInt().toString()),
      Text('Q: ' + questionsAmount.toInt().toString())
    ]);
  }

  Widget buildCommunityLeftSide() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Text(description),
      Text('Q: ' + questionsAmount.toInt().toString())
    ]);
  }
}
