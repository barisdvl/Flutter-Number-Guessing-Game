import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  bool result;
  ResultScreen({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RESULT"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 500.0,
              height: 250.0,
              child: widget.result
                  ? Image.asset("images/happy_face.png")
                  : Image.asset("images/unhappy_face.png"),
            ),
            Text(
              widget.result ? "Win" : "Lose",
              style: const TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
                width: 200.0,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "TRY AGAIN",
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
