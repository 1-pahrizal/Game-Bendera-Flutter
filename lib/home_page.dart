import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = ConfettiController();
  bool isPlaying = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            title: const Text(
              '          Beri Bendera Buat Indonesia',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Center(
            child: MaterialButton(
              onPressed: () {
                if (isPlaying) {
                  _controller.stop();
                } else {
                  _controller.play();
                }
                isPlaying = !isPlaying;
              },
              child: Text("Kasih Bendera"),
              color: Colors.redAccent[200],
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: _controller,
          blastDirection: pi / 2,
          colors: const [Colors.red, Colors.white],
          gravity: 0.02,
        ),
      ],
    );
  }
}
