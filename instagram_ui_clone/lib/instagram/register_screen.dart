import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'main_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 60,
                      width: 180,
                      child: Image(
                        image: AssetImage('assets/img/logo.png'),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign up to see photos and pictures from your friends",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 327,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.facebook),
                    SizedBox(
                      width: 7,
                    ),
                    Center(
                        child: Text(
                      'Log in with Facebook',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1,
                    width: 150,
                    color: Colors.grey.shade700,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'OR',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: 150,
                    color: Colors.grey.shade700,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11)),
                  fillColor: Colors.grey.shade700,
                  prefixIconColor: Colors.white,
                  filled: true,
                  constraints: BoxConstraints.tightFor(width: 327, height: 50),
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: 'Password',
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
                  constraints: BoxConstraints.tightFor(width: 327, height: 50),
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: 'Password',
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
                  constraints: BoxConstraints.tightFor(width: 327, height: 50),
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: 'Password',
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
                  constraints: BoxConstraints.tightFor(width: 327, height: 50),
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
                    'Register',
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
                    "By signing up, you agree to our Terms and Policy",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 120,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Have an account ? ",
                    style: TextStyle(color: Colors.white),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      " Log in",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
