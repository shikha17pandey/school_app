import 'package:flutter/material.dart';
import 'package:school_app/Profile.dart';
import 'package:school_app/Settings.dart';
import 'package:school_app/db_save.dart';
import 'package:school_app/form_screen.dart';
import 'main.dart';
class MainPage extends StatefulWidget{
  HistoryTable createState()=> HistoryTable();
}

class HistoryTable extends State<MainPage> {

  List<Map<String, dynamic>> row_data;
  final dbHelper = DatabaseHelper.instance;

  Future<void> get_data() async {
    final row_data = await dbHelper.queryAllRows();
    this.setState(() {  this.row_data = row_data; });
    print('row data: $row_data');
  }
  
  @override
  Widget build(BuildContext context) {


    this.get_data();
    return  Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
              'History ',
            )
        ),
      ),
      drawer: Drawer(
        child: Container(
          height: 100,
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text('About Us',
                  style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    fontSize: 20.0,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.push(
                    context,MaterialPageRoute(builder: (context)=>FormScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.person_rounded),
                title: Text('Profile'),
                onTap: () {
                  Navigator.push(
                    context,MaterialPageRoute(builder: (context)=>Profile()),
                  );
                },

              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text('History'),
                onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
              ),

              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Settings()),
                  );
                },
              ),

            ],
          ),
        ),
      ),
        body: Center(
            child: Column(children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                child: Table(
                  //defaultColumnWidth: FixedColumnWidth(120.0),
                  border: TableBorder.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 2),
                  children: this.row_data==null?[]: this.row_data.map((row)
                  {
                    return  TableRow(
                        children: [
                      Column(children:[Text(row["name"], style: TextStyle(fontSize: 20.0))]),
                      Column(children:[Text(row["age"].toString(), style: TextStyle(fontSize: 20.0))]),
                      Column(children:[Text(row["subjects"]==null?"":row["subjects"], style: TextStyle(fontSize: 20.0))]),
                      Column(children:[Text(row["courses"], style: TextStyle(fontSize: 20.0))]),
                    ]
                    );
                  }
                  ).toList()
                ),
              ),
            ])
        ),
    );
  }
}






