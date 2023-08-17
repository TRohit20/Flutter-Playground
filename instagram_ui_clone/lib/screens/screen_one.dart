import 'package:flutter/material.dart';

import 'media_query.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (() {})),
      appBar: AppBar(backgroundColor: Colors.blue, title: Text('Screen One ')),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                'hello',
                style: TextStyle(color: Colors.red),
              ),
              const SizedBox(
                height: 10,
              ),
              const ElevatedButton(
                onPressed: null,
                child: Text('REGISTER'),
                style: ButtonStyle(),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.red,
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 30,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              /////////////////////////////////////////////////////////////////////////////////buttons///////////////////////////////////////////////////////////////
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  primary: Colors.blue,
                  backgroundColor: Colors.pink,
                ),
                child: const Text('text button'),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const ScreenThree()),
                  );
                },
                child: Text(
                  'Elevated button',
                  style: TextStyle(fontSize: 30),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    side: BorderSide(width: 2, color: Colors.black),
                    primary: Colors.purple,
                    onPrimary: Colors.blue,
                    padding: const EdgeInsets.all(20),
                    elevation: 20
                    // minimumSize: Size(100, 60)
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text('outline button'),
                style: OutlinedButton.styleFrom(
                    primary: Colors.black,
                    padding: const EdgeInsets.all(20),
                    side: const BorderSide(color: Colors.red)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton.icon(
                  style: TextButton.styleFrom(),
                  onPressed: () {},
                  icon: const Icon(Icons.house_outlined),
                  label: const Text('Icon button')),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(),
                  onPressed: () {},
                  icon: const Icon(Icons.house_outlined),
                  label: const Text('Elevated Icon button')),
              ///////////////////////////////////////////////////////////////////////////////////////////buttons end///////////////////////////////////////////////////////////////////////
            ],
          ),
        ),
      ),
    );
  }
}
