import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stisla_application_with_flutter/api/http_helper.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _MainProfilState();
}

class _MainProfilState extends State<ProfilePage> {
  int currentPageIndex = 0;
  String token = '';
  String name = '';
  String email = '';

  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      const key = 'token';
      const key1 = 'name';
      const key2 = 'email';
      final value = pref.get(key);
      final value1 = pref.get(key1);
      final value2 = pref.get(key2);
      token = '$value';
      name = '$value1';
      email = '$value2';
      txtName.text = name;
      txtToken.text = token;
      txtEmail.text = email;
    });
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.remove("token");
      preferences.clear();
    });
    final token = txtToken.text;
    final response = await HttpHelper().logout(token);
    print(response.body);
  }

  final txtName = TextEditingController();
  final txtToken = TextEditingController();
  final txtEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Profile',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 148, 67, 67),
        automaticallyImplyLeading: false,
      ),
      body: <Widget>[
        Container(
          color: Color.fromARGB(255, 148, 67, 67),
          child: Container(
            margin: const EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.yellow,
                        radius: 50.0,
                        backgroundImage: AssetImage('assets/images/user.jpg'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        name,
                        style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'e-mail : ' + email,
                        style: TextStyle(
                          color: Colors.yellow,
                          // fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Token : ',
                        style: TextStyle(
                          color: Colors.yellow,
                          // fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        token,
                        style: TextStyle(
                          color: Colors.yellow,
                          // fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2)),
                          ),
                          onPressed: () {
                            logOut();
                            Navigator.pushNamed(context, "/");
                          },
                          child: const Text(
                            'Log Out',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ][currentPageIndex],
    );
  }
}
