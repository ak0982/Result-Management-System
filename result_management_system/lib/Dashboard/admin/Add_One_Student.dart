import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:device_info/device_info.dart';
import 'package:package_info/package_info.dart';

class Add_One_Student extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Add_One_StudentState();
  }
}

class Add_One_StudentState extends State<Add_One_Student> {
  String _name;
  String _email;
  String _password;
  String _roll;
  String _branch;
  String _course;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 40,
      validator: (String value) {
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

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Password'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  Widget _buildRoll() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Roll'),
      keyboardType: TextInputType.url,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Roll No. is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _roll = value;
      },
    );
  }

  Widget _buildBranch() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Branch'),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Branch is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _branch = value;
      },
    );
  }

  Widget _buildCourse() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Course'),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Course is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _course = value;
      },
    );
  }
  Future createNewUser(String name, String email) async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      FirebaseUser user = result.user;

      Firestore.instance.collection('Student').document(user.uid).setData({
        'name': _name,
        'uid': user.uid,
        'email': _email,
        'Roll_No':_roll,
        "role": "student",
        'Branch':_branch,
        'Course':_course
      });

     // FirebaseFirestore _db = FirebaseFirestore.instance;
      String sem="sem";
      final CollectionReference profileList =
      Firestore.instance.collection('Student');


      for(int i =1;i<10;i++)
      {
        String f_sem='$sem'+'$i';
        final deviceRef = profileList
            .document(user.uid)
            .collection(f_sem)
            .document(user.uid);

        await deviceRef.setData({
          "Course-1":{
            'course_id':"MA101",
            'course_name':"Mathematics I",
            'course_credit':"6",
            'course_grade':"AA",
          },
          "Course-2":{
            'course_id':"MA101",
            'course_name':"Mathematics I",
            'course_credit':"6",
            'course_grade':"AA",
          },
          "Course-3":{
            'course_id':"MA101",
            'course_name':"Mathematics I",
            'course_credit':"6",
            'course_grade':"AA",
          },
          "Course-4":{
            'course_id':"MA101",
            'course_name':"Mathematics I",
            'course_credit':"6",
            'course_grade':"AA",
          },
          "Course-5":{
            'course_id':"MA101",
            'course_name':"Mathematics I",
            'course_credit':"6",
            'course_grade':"AA",
          },
          "Course-6":{
            'course_id':"MA101",
            'course_name':"Mathematics I",
            'course_credit':"6",
            'course_grade':"AA",
          },
          "Course-7":{
            'course_id':"MA101",
            'course_name':"Mathematics I",
            'course_credit':"6",
            'course_grade':"AA",
          },
          "Course-8":{
            'course_id':"MA101",
            'course_name':"Mathematics I",
            'course_credit':"6",
            'course_grade':"AA",
          },
          "Course-9":{
            'course_id':"MA101",
            'course_name':"Mathematics I",
            'course_credit':"6",
            'course_grade':"AA",
          },

        });



      }


      // await Firestore.instance.collection(name, 'Male', 100, user.uid);
      await user.reload();
      return user;
    } catch (e) {
      print(e.toString());
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adding Student")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildEmail(),
                _buildPassword(),
                _buildRoll(),
                _buildBranch(),
                _buildCourse(),
                SizedBox(height: 100),
                RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }

                    _formKey.currentState.save();

                    print(_name);
                    print(_email);
                    print(_branch);
                    print(_roll);
                    print(_password);
                    print(_course);

                    //Send to API
                    createNewUser(_name,_email);
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