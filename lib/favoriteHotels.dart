
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'home.dart';


class FavoriteHotelsPage extends StatefulWidget {
//  const DetailPage({Key key, this.productData}) : super(key: key);

  @override
  FavoriteHotelsPageState createState() => FavoriteHotelsPageState();
}

class FavoriteHotelsPageState extends State<FavoriteHotelsPage> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Search',
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

                title: Text('Favorite Hotels'),
            ),
          body:ListView.builder(
            itemCount: HomePageSate.saved.length,
            itemBuilder: (context, index) {
              final item = HomePageSate.saved.elementAt(index);

              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  setState(() {
                    HomePageSate.saved.remove(item);
                  });
                },
                background: Container(color: Colors.red),
                child: ListTile(
                  title: Text(
                    item.hotelName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
              );
            },
          ),
          ),
        );
  }

}