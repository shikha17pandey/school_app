import 'package:flutter/material.dart';
import 'db_save.dart';
import 'main.dart';

class FormScreen extends StatefulWidget {
  final dbHelper = DatabaseHelper.instance;

  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}
class FormScreenState extends State<FormScreen>{
  String _name;
  int _age;
  String _subjects;
  String _courses;
  String currentSelectedValue;
  bool checkBoxValueMCA = false;
  bool checkBoxValueBCA = false;
  bool checkBoxValueBTech = false;
  bool checkBoxValueMTech = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
      return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      validator: ( value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildAge() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Age'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Age is Required';
        }
        final n = num.tryParse(value);
        if(n == null) {
          return '"$value" values is not a valid number';
        }
        if(n >= 14 && n <= 35){
          //
        } else {
          return 'Age should be greater then 14 & less then 35';
        }
        return null;
      },
      onSaved: (String value) {
        _age = num.tryParse(value);
      },
    );
  }

  Widget _buildSubjects() {
    const deviceTypes = ["C++", "Java", "C#", "Python", "c", "php"];
    return Container(

      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: Text("Select Subject"),
                value: currentSelectedValue,
                isDense: true,
                onChanged: (newValue) {
                  setState(() {
                    currentSelectedValue = newValue;
                  });
                  print(currentSelectedValue);
                },
                items: deviceTypes.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),

              ),

            ),
          );
        },
      ),

    );
  }

  Widget _buildCourses(){
 return Column(
   crossAxisAlignment: CrossAxisAlignment.start,
   children: [
     SizedBox(height: 10), // 1st spacer
     Text('Courses'),
     Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
           Column(
             children: [
               Checkbox(
                value: checkBoxValueMCA,
                onChanged: (bool value){
                  print(value);
                  setState(() {
                    checkBoxValueMCA = value;
                 });
                },
              ),
             ],
           ),
          Text("MCA"),

            Column(
              children: [
                Container(width: 10.0),

                Checkbox(
                  value: checkBoxValueBTech,
                  onChanged: (bool value){
                    print(value);
                    setState(() {
                      checkBoxValueBTech = value;
                    });
                  },
                ),
              ],
            ),
        Text("BTech"),
       ],
     ),
     Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: <Widget>[
         Column(
           children: [
             Checkbox(
               value: checkBoxValueBCA,
               onChanged: (bool value){
                 print(value);
                 setState(() {
                   checkBoxValueBCA = value;
                 });
               },
             ),
           ],
         ),
         Text("BCA"),

         Column(
           children: [
             Checkbox(
               value: checkBoxValueMTech,
               onChanged: (bool value){
                 print(value);
                 setState(() {
                   checkBoxValueMTech = value;
                 });
               },
             ),
           ],
         ),
         Text("MTech"),
       ],
     ),
   ],

 );

}

  final dbHelper = DatabaseHelper.instance;

  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName : this._name,
      DatabaseHelper.columnAge  : this._age,
      DatabaseHelper.columnSubjects  : this._subjects,
      DatabaseHelper.columnCourses  : this._courses,

    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(

      appBar: AppBar(
          title: Center(
            child: Text(
                'Student Registration Form ',
            ),
          ),
     ),

     body: Container(
       padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
       child: Center(
       child: Form(
        key: _formKey,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               _buildName(),
               _buildAge(),
               _buildSubjects(),
               _buildCourses(),
               SizedBox(height: 100),
               RaisedButton(
                 color: Colors.blue,
                 child: Text('Apply',
                 style: TextStyle(
                   color:Colors.black ,
                   fontSize: 16.0,
                 ),
                 ),
                 onPressed: (){
                   if(!_formKey.currentState.validate()){
                     return;
                   }
                   _formKey.currentState.save();
                   print(_name);
                   print(_age);
                   print(currentSelectedValue);
                   print(checkBoxValueMCA);
                   print(checkBoxValueBCA);
                   print(checkBoxValueBTech);
                   print(checkBoxValueMTech);

                 },
               )
             ],
           ),
         ),
       ),
     ),
        );
  }

}
