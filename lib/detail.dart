import 'package:Shrine/model/product.dart';
import 'package:flutter/material.dart';

import 'app.dart';

class DetailPage extends StatefulWidget {
  final Product productData;
  final Set<Product> saved;
  const DetailPage(this.productData, this.saved);

//  const DetailPage({Key key, this.productData}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState(productData, saved);
}

class _DetailPageState extends State<DetailPage> {
  Product productData;
  Set<Product> saved;
  _DetailPageState(this.productData,this.saved);


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



      // ignore: non_constant_identifier_names
      Widget ImageSection = Container(
          child:GestureDetector(
            onDoubleTap: (){
              setState(() {
                if (saved.contains(productData)) {
                  saved.remove(productData);
                } else {
                  saved.add(productData);
                }
              });
            },
            child: Stack(
                children: <Widget>[
                  Hero(
                  tag: productData.hotelName,
                  child: Image.asset(
                    productData.assetName,
                    fit: BoxFit.cover,
                    width: 600,
                    height: 240,
                  ),
                ),
                Positioned(
                  top: 15, right: 15,
                  child: Icon(
                    saved.contains(productData) ? Icons.favorite : Icons.favorite_border,
                    color: saved.contains(productData) ? Colors.red : Colors.red,
                  ),
                ),
              ],
            ),

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
              ImageSection,
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


