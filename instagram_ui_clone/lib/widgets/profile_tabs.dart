import 'package:flutter/material.dart';

class ProfileTabs extends StatelessWidget {
  const ProfileTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
          body: Column(),
        ));
  }
}
