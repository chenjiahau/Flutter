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
            children: const <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("images/login.png"),
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                "Sing In",
                style: TextStyle(
                  fontFamily: "Tapestry",
                  color: Colors.white,
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3.0,
                ),
              ),
              Text(
                "Developer",
                style: TextStyle(
                  fontFamily: "DidactGothic",
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w100,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 200.0,
                child: Divider(
                  height: 1.0,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
                child: Card(
                  child: ListTile(
                    tileColor: Colors.lightBlue,
                    leading: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 22.0,
                    ),
                    title: Text(
                      "Tell me who are you?",
                      style: TextStyle(
                        fontFamily: "DidactGothic",
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
