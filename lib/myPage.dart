
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
//  const DetailPage({Key key, this.productData}) : super(key: key);

  @override
  MyPageState createState() => MyPageState();
}

class MyPageState extends State<MyPage> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Page',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),

          title: Text('My Page'),
        ),

        body:Column(
          children: [

          ],
        )
      ),
    );
  }

}