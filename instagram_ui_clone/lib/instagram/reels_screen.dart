import 'package:flutter/material.dart';

import '../data/reel_ex1.dart';
import '../data/reel_ex2.dart';

class ReelsScreen extends StatelessWidget {
  ReelsScreen({Key? key}) : super(key: key);

  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.vertical,
        children: [ReelEx1(), ReelEx2()],
      ),
    );
  }
}
