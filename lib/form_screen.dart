import 'package:flutter/material.dart';
import 'main.dart';

class FormScreen extends StatefulWidget {
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

  var currentSelectedValue;
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
    return null;
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
     body: Center(
       child: Form(
         key: _formKey,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             _buildName(),
             _buildAge(),
             _buildSubjects(),
             // _buildCourses(),
             SizedBox(height: 100),
             RaisedButton(
               child: Text('Apply',
               style: TextStyle(
                 color:Colors.blue.shade900 ,
                 fontSize: 16.0,
               ),
               ),
               onPressed: (){
                 if(!_formKey.currentState.validate()){
                   return;
                 }
                 _formKey.currentState.save();
                 print(_name);
                 //print(_age);
               },
             )
           ],
         ),
       ),
     ),
        );
  }

}
