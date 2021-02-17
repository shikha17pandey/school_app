import 'package:flutter/material.dart';
import 'package:school_app/Settings.dart';
import 'package:school_app/form_screen.dart';
import 'package:school_app/history.dart';



class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
              'Profile',
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
    );
  }
}