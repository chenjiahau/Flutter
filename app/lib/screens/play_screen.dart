import 'package:flutter/material.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen(this.landing, {super.key});

  final void Function() landing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.purple, Colors.cyan],
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 48),
                const Text(
                  "Puzzle",
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    landing();
                  },
                  child: const Text("Go back",
                      style: TextStyle(fontSize: 12, color: Colors.white)),
                ),
              ],
            ),
          )),
    );
  }
}
