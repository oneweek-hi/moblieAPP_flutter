import 'package:Shrine/model/product.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchPage extends StatefulWidget {
//  const DetailPage({Key key, this.productData}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool check = true;
  DateTime currentDate = DateTime.now();


  Map<String, bool> values = {
    'noKidsZone': false,
    'petFriendly': false,
    'freeBreakfast':false,
  };



  String MakingOption(){
    String result ='';
    for (var entry in values.entries) {
      if(entry.value){
        result = result + entry.key+"/";
      }
    }
    return result;
  }
  // ignore: non_constant_identifier_names
  void FlutterDialog() {
    showDialog(
        context: context,
        //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            //Dialog Main Title
            title:  DecoratedBox(

            decoration: const BoxDecoration(color: Colors.blue),
                child: Align(
                  alignment: Alignment.center,
                  child:Padding(
                      padding: EdgeInsets.fromLTRB(0, 25, 0, 25.0),
                      child: Text(
                        "Please check\nyour choice:)",
                        style: TextStyle(
                            color: Colors.white),
                      )
                  ),
                ),
            ),
            titlePadding: const EdgeInsets.all(0),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 10.0, 10.0),
                      child: Icon(Icons.wifi , size:20, color:Colors.blue),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 10.0, 10.0),

                      child: Container(
                        width: 200,
                        child: Text(
                          MakingOption(),
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 13),
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 10.0, 0.0),
                      child: Icon(Icons.calendar_today, size:20, color:Colors.blue),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 10.0, 0.0),
                      child: Text(
                        "IN",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.black
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 10.0, 0.0),
                      child: Text(
                        DateFormat('yyyy.MM.dd(EEE)').format(currentDate),
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey
                        ),),
                    ),
                  ],
                ),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                child: new Text("Search"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),

              ElevatedButton(
                child: new Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }



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

          title: Text('Search'),
        ),
        body: ListView(
          children: <Widget>[
        ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            check =! isExpanded;
           });
         },
        children: [
          ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
            title: Text('Filter'),
            );
          },
            body: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
              children: values.keys.map((String key) {
                return new CheckboxListTile(
                  title: Text(key),
                  value: values[key],
                  onChanged: (bool value) {
                    setState(() {
                      values[key] = value;
                    });
                  },
                );
              }).toList()
           ),
            isExpanded: check,
          )
        ],
      ),
      Container(
          padding: const EdgeInsets.fromLTRB(30, 30, 0, 20),
          child: Column(
            // TODO: Align labels to the bottom and center (103)
              crossAxisAlignment: CrossAxisAlignment.start,
              // TODO: Change innermost Column (103)
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                  child: Text(
                    "Date",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 10.0, 0.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Icon(Icons.calendar_today, size:20, color:Colors.blue),
                                Text("check-in")
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(12, 10, 10.0, 0.0),
                              child: Text(
                                  DateFormat('yyyy.MM.dd(EEE)\nkk:mm a').format(currentDate),
                                  style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey
                              ),),
                            ),
                          ],

                        )
                    ),


                    Padding(
                      padding: EdgeInsets.fromLTRB(100, 5, 10.0, 0.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.lightBlue,
                            onPrimary: Colors.white
                        ),
                        child: Text('select date'),
                        onPressed: () => selectDate(context),
                      ),)

                  ],
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(100, 100, 10.0, 0.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlue,
                        onPrimary: Colors.white

                    ),
                    child: Text('Search', style: TextStyle(
                        fontSize: 30,
                    ),
                    ),
                    onPressed: () => FlutterDialog(),
                  ),)

              ]
          )

      ),

          ],
        ),
      ),
    );
  }
}
class Item {
  Item({
    this.isExpanded = false,
  });

  bool isExpanded;
  Map<String, bool> values = {
    'noKidsZone': false,
    'petFriendly': false,
    'freeBreakfast':false,
  };

}

