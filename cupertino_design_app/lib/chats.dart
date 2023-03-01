import 'package:flutter/cupertino.dart';

class CupertinoChatPage extends StatelessWidget {
  const CupertinoChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Chats'),
        ),
        child: Center(
          child: Text('This is the chats page'),
        ));
  }
}
