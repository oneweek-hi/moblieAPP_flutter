// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model/products_repository.dart';
import 'model/product.dart';

final isSelected = <bool> [true, false];


class HomePage extends StatefulWidget{
  HomePageSate createState()=> HomePageSate();
}

class HomePageSate extends State<HomePage>{

  //Your code here
  // TODO: Add a variable for Category (104)


  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products == null || products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        // TODO: Adjust card heights (103)
        child: Column(
          // TODO: Center items on the card (103)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  // TODO: Align labels to the bottom and center (103)
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // TODO: Change innermost Column (103)
                  children: <Widget>[
                    // TODO: Handle overflowing labels (103)
                    Text(
                      product.name,
                      style: theme.textTheme.headline6,
                      maxLines: 1,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      formatter.format(product.price),
                      style: theme.textTheme.subtitle2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  _launchURL() async {
    const url = 'https://www.handong.edu/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  // ignore: override_on_non_overriding_member
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)
    // TODO: Pass Category variable to AsymmetricView (104)

    return Scaffold(
      appBar: AppBar(
        title: Text('Main'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {
              print('Search button');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.language,
              semanticLabel: 'filter',
            ),
            onPressed: _launchURL,
          ),
        ],
      ),


      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,

        children: <Widget>[
      Padding(
          padding: EdgeInsets.all(10),
      child: ToggleButtons(
            color: Colors.black.withOpacity(0.60),
            selectedColor: Color(0xFF6200EE),
            selectedBorderColor: Color(0xFF6200EE),
            fillColor: Color(0xFF6200EE).withOpacity(0.08),
            splashColor: Color(0xFF6200EE).withOpacity(0.12),
            hoverColor: Color(0xFF6200EE).withOpacity(0.04),
            borderRadius: BorderRadius.circular(4.0),
            isSelected: isSelected,
            highlightColor: Colors.transparent,
            onPressed: (index) {
              // Respond to button selection
              setState(() {
                isSelected[index] = !isSelected[index];
                isSelected[(index+1)%2] = !isSelected[(index+1)%2];
              });
            },
            children: [
              Icon(Icons.list),
              Icon(Icons.grid_view),
            ],
          )
      ),
          new Expanded(
            child: getView(),
          ),



        ],
      ),

      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          children: <Widget>[
            DrawerHeader(
              padding:EdgeInsets.only(left: 27, top: 120),
              child: Text('Pages', style: TextStyle(fontSize: 24, color: Colors.white),),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),

            ListTile(
              contentPadding: EdgeInsets.only(left: 30),
              leading: Icon(Icons.home,
                  color: Colors.blue,
                  size: 30.0),
              title: Text('Home'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),

            ListTile(
              contentPadding: EdgeInsets.only(left: 30),
              leading:  Icon(Icons.search,
                  color: Colors.blue,
                  size: 30.0),
              title: Text('Search'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 30),
              leading:  Icon(Icons.location_city,
                  color: Colors.blue,
                  size: 30.0),
              title: Text('Favorite Hotel'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 30),
              leading:  Icon(Icons.person,
                  color: Colors.blue,
                  size: 30.0),
              title: Text('My Page'),
              onTap: () {
                // Update the state of the app
                // …
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }


  List<Card> _buildListCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products == null || products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Card(
        child: ListTile(
          leading: Image.asset(
            product.assetName,
            package: product.assetPackage,
            fit: BoxFit.fitWidth,
          ),
              title: Text(
                product.name,
                style: theme.textTheme.headline6,
                maxLines: 1,
              ),
              subtitle: Text(
                formatter.format(product.price),
                style: theme.textTheme.subtitle2,
              ),
            ),
      );
    }).toList();
  }


  Widget getView() {
    if(isSelected[0]){
      return GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildGridCards(context),
      );
    }else{
      return ListView(
        padding: EdgeInsets.all(16.0),
        children: _buildListCards(context),
      );

    }

  }

}



