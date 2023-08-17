import 'package:flutter/material.dart';

import '../data/image_data.dart';
import '../screens/image_cart.dart';
import '../widgets/text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: CustomText()),
      body: GridView.builder(
        itemCount: imageList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
        ),
        itemBuilder: (context, index) => ImageCart(
          imageData: imageList[index],
        ),
      ),
    );
  }
}
