import 'package:flutter/material.dart';

class CircleStory extends StatelessWidget {
  const CircleStory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(6.0),
      child: ClipOval(
        child: Image(
          height: 68,
          width: 68,
          image: NetworkImage(
              'https://cdn.pixabay.com/photo/2018/07/29/23/05/woman-3571298_960_720.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
