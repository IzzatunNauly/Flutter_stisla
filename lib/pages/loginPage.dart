import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stisla_application_with_flutter/pages/landingHomePage.dart';
import 'package:stisla_application_with_flutter/pages/landingPage.dart';
import 'package:stisla_application_with_flutter/api/http_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final txtEmail = TextEditingController(text: 'superadmin@gmail.com');
  final txtPassword = TextEditingController(text: 'password');

  Future doLogin() async {
    final email = txtEmail.text;
    final password = txtPassword.text;
    const deviceId = "12345";
    final response = await HttpHelper().login(email, password, deviceId);
    print(response.body);

    SharedPreferences pref = await SharedPreferences.getInstance();
    const key = 'token';
    final value = pref.get(key);
    final token = value;
    if (token == null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LandingHome()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Color.fromARGB(255, 99, 177, 212),
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 24,
                    color: Color.fromARGB(255, 26, 17, 17)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                controller: txtEmail,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
                  filled: true,
                  fillColor: Color.fromARGB(255, 0, 0, 0),
                  labelText: 'E-mail',
                  labelStyle: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 3, color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 3, color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                controller: txtPassword,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
                  filled: true,
                  fillColor: Color.fromARGB(255, 0, 0, 0),
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 3, color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 3, color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  onPressed: () {
                    doLogin();
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
