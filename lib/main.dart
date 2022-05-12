import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("images/login.png"),
              ),
              const SizedBox(
                height: 12.0,
              ),
              const Text(
                "Sing In",
                style: TextStyle(
                  fontFamily: "Tapestry",
                  color: Colors.white,
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3.0,
                ),
              ),
              const Text(
                "Developer",
                style: TextStyle(
                  fontFamily: "DidactGothic",
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w100,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(
                height: 20.0,
                width: 200.0,
                child: Divider(
                  height: 1.0,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 60.0),
                child: Row(
                  children: const <Widget>[
                    Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 22.0,
                    ),
                    SizedBox(width: 10.0),
                    Text("Tell me who are you?",
                        style: TextStyle(
                          fontFamily: "DidactGothic",
                          color: Colors.white,
                          fontSize: 22.0,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
