import 'package:flutter/material.dart';
import 'package:stisla_application_with_flutter/api/http_helper.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  doRegister() async {
    final name = txtName.text;
    final email = txtEmail.text;
    final password = txtPassword.text;
    const deviceId = "12345";
    final response =
        await HttpHelper().register(name, email, password, deviceId);
    print(response.body);
    Navigator.pushNamed(context, "/");
  }

  final TextEditingController txtName = TextEditingController(text: 'test');
  final TextEditingController txtEmail =
      TextEditingController(text: 'test@mail.com');
  final TextEditingController txtPassword =
      TextEditingController(text: 'password');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 99, 177, 212),
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: const EdgeInsets.all(30),
          margin: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Register Page',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 24,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                controller: txtName,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
                  filled: true,
                  fillColor: Colors.black,
                  labelText: 'Name',
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
              TextFormField(
                style: TextStyle(color: Colors.white),
                controller: txtEmail,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
                  filled: true,
                  fillColor: Colors.black,
                  labelText: 'Email',
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.white),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.white),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                controller: txtPassword,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
                  filled: true,
                  fillColor: Colors.black,
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.white),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.white),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 45,
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
                    doRegister();
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
