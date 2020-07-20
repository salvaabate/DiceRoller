import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  return runApp(DiceRoller());
}

class DiceRoller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNum = 1;
  int rightDiceNum = 1;
  final player = AudioCache();

  @override
  Widget build(BuildContext context) {
    player.load('rollingDice.wav');
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: MaterialButton(
              enableFeedback: false,
              onPressed: () {
                player.play('rollingDice.wav');
                rollDice();
              },
              child: Image.asset('images/dice$leftDiceNum.png'),
            ),
          ),
          Expanded(
            child: MaterialButton(
              enableFeedback: false,
              onPressed: () {
                player.play('rollingDice.wav');
                rollDice();
              },
              child: Image.asset('images/dice$rightDiceNum.png'),
            ),
          )
        ],
      ),
    );
  }

  void rollDice() {
    var random = new Random();
    setState(() {
      leftDiceNum = 1 + random.nextInt(6);
      rightDiceNum = 1 + random.nextInt(6);
    });
  }
}
