import 'package:flutter/material.dart';
import 'package:instagram_ui_clone/instagram/register_screen.dart';

import 'main_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
              child: Center(
                  child: Text(
            'English',
            style: TextStyle(color: Colors.white),
          ))),
          Expanded(
              flex: 2,
              child: Center(
                  child: Text(
                '',
                style: TextStyle(color: Colors.white),
              ))),
          Expanded(
              flex: 4,
              child: Column(
                children: [
                  Container(
                      height: 60,
                      width: 180,
                      child: Image(
                        image: AssetImage('assets/img/logo.png'),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11)),
                      fillColor: Colors.grey.shade700,
                      prefixIconColor: Colors.white,
                      filled: true,
                      constraints:
                          BoxConstraints.tightFor(width: 327, height: 50),
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: 'Phone number, email or username',
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11)),
                      fillColor: Colors.grey.shade700,
                      prefixIconColor: Colors.white,
                      filled: true,
                      constraints:
                          BoxConstraints.tightFor(width: 327, height: 50),
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: 'Password',
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: 327,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                          child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Forgot your login details? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Get help logging in.",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              )),
          Expanded(
              flex: 2,
              child: Center(
                  child: Text(
                '',
                style: TextStyle(color: Colors.white),
              ))),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(color: Colors.white),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      ),
                    );
                  },
                  child: Text(
                    " Sign up",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
