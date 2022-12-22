import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class RoutePage extends StatefulWidget {
  const RoutePage({super.key});

  @override
  State<RoutePage> createState() => _RoutePage();
}

class _RoutePage extends State<RoutePage> {
  String token = '0';
  getPref() async {
    // SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      const key = 'token';
      //  final value = pref.get(key);
      //  token = '$value';
    });
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 148, 67, 67),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    CircleAvatar(
                      backgroundColor: Colors.yellow,
                      radius: 50.0,
                      backgroundImage: AssetImage('assets/images/logo.jfif'),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    Text(
                      "Aplikasi Stisla",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 24.0,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    // Text(token),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 255, 255, 255),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, "/login");
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 164, 165, 168),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              //to set border radius to button
                              borderRadius: BorderRadius.circular(2)),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, "/register");
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        )),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
