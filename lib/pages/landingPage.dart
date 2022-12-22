import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stisla_application_with_flutter/pages/routePage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => RoutePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 66, 131, 168)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50.0,
                      backgroundImage: AssetImage('assets/images/user.jpg'),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    Text(
                      "Aplikasi Stisla",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 24.0,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
