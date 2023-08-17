import 'package:flutter/material.dart';

class WidgetsList extends StatefulWidget {
  const WidgetsList({Key? key}) : super(key: key);

  @override
  State<WidgetsList> createState() => _WidgetsListState();
}

class _WidgetsListState extends State<WidgetsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: const [
        Text('1- Text widget'),
        Text('2- Column widget'),
        Text('3- Row Widget '),
        Text('4- floating action button'),
        Text('5- Expanded widget'),
        Text('6- Sizebox widget'),
        Text('7- Container Widget'),
        Text('8- Padding widget'),
        Text('9- Singlechildscrollview widget'),
        Text('10- Elavated Button widget'),
        Text('11- Text button widget'),
        Text('12- Outline Button widget'),
        Text('textformfield'),
        Text('text field')
      ]),
    );
  }
}
