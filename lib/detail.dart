import 'package:Shrine/model/product.dart';
import 'package:flutter/material.dart';

import 'app.dart';

class DetailPage extends StatefulWidget {
  final Product productData;
  const DetailPage(this.productData);

//  const DetailPage({Key key, this.productData}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState(productData);
}

class _DetailPageState extends State<DetailPage> {

  final Product productData;
  _DetailPageState(this.productData);

  @override
  Widget build(BuildContext context) {

      Widget titleSection = Container(
        padding: const EdgeInsets.fromLTRB(30, 30, 0, 20),
          child: Column(
            // TODO: Align labels to the bottom and center (103)
              crossAxisAlignment: CrossAxisAlignment.start,
              // TODO: Change innermost Column (103)
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                  child: Row(
                    children:List.generate(productData.star, (index){
                      return
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 23,
                        );
                    },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                  child: Text(
                    productData.hotelName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.indigo
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 10.0, 0.0),
                      child:Icon(Icons.location_on, size:20, color:Colors.blue),

                    ),


                    Padding(
                      padding: EdgeInsets.fromLTRB(3, 5, 10.0, 0.0),
                      child: Container(
                        width: 260,
                        child: Text(
                          productData.location,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 10.0, 0.0),
                      child: Icon(Icons.phone, size:20, color:Colors.blue),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 10.0, 0.0),
                      child:  Text(
                          productData.callNumber,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 12),
                        ),
                      ),
                  ],
                ),
              ]
          )

      );


      Widget textSection = Container(
        padding: const EdgeInsets.all(32),

        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Icon(Icons.message, size:40),
              Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Text(
                          'Recent Message',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Long time no see!',
                        )
                      ]
                  )
              )
            ]
        ),
      );

      return MaterialApp(
        title: 'Flutter layout demo',
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

          title: Text('Detail'),
        ),
          body: ListView(
            children: [
              Image.asset(
                'assets/hotel/'+productData.id.toString()+'.png',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
              titleSection,
              const Divider(
                  height: 1,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 20),
                child: Container(
                  width: 260,
                  child: Text(
                    productData.detail,
                    maxLines: 10,
                    style: TextStyle(
                        fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }


class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 12;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.yellow[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
}