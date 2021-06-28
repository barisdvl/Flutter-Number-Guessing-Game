import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:numberguessing/resultscreen.dart';

class GuessScreen extends StatefulWidget {
  const GuessScreen({Key? key}) : super(key: key);

  @override
  _GuessScreenState createState() => _GuessScreenState();
}

class _GuessScreenState extends State<GuessScreen> {
  var tfGuess = TextEditingController();
  int randomNumber = 0;
  int remaining = 5;
  String guidance = "";

  @override
  void initState() {
    super.initState();
    randomNumber = Random().nextInt(101);
    print("Random Number: $randomNumber");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GUESS SCREEN"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Remaining: $remaining",
              style: const TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Hint : $guidance",
              style: const TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: tfGuess,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  labelText: "Guess",
                  labelStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.deepOrangeAccent,
                      fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrangeAccent),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
                width: 200.0,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      remaining = remaining - 1;
                    });

                    int guess = int.parse(tfGuess.text);

                    if (guess == randomNumber) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                    result: true,
                                  )));
                      return;
                    }
                    if (guess > randomNumber) {
                      setState(() {
                        guidance = "Reduce the Number";
                      });
                    }
                    if (guess < randomNumber) {
                      setState(() {
                        guidance = "Increase the Number";
                      });
                    }
                    if (remaining == 0) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                    result: false,
                                  )));
                    }
                    tfGuess.text = "";
                  },
                  child: const Text(
                    "GUESS",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
