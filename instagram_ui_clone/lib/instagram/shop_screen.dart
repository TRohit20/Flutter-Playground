import 'package:flutter/material.dart';
import '../data/image_data.dart';
import '../screens/image_cart.dart';
import '../widgets/text_field.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: CustomText(),
        actions: [
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.shopping_cart,
                  size: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.table_rows_rounded,
                  size: 30,
                ),
              ),
            ],
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: GridView.builder(
        itemCount: imageList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
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
