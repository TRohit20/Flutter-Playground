import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// We are creating a widget that is going to be adaptive (Adapt based on platform or device and more)
// Ofcourse, this does not work for all widgets or Cupertino style but for a lot of widgets you can do this
// And reduce the boilerplate code to write which reduces the duplication of code and performance boost

class AdaptiveButton extends StatelessWidget {
  final String text;
  final VoidCallback handler;

  AdaptiveButton(this.text, this.handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: handler,
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ))
        : ElevatedButton(
            onPressed: handler,
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ));
  }
}
