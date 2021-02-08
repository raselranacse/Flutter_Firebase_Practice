import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_practice/views/home_page.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _fireStore = FirebaseFirestore.instance;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .06,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      //borderRadius: BorderRadius.all(Radius.circular(8.0))
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      //borderRadius: BorderRadius.all(Radius.circular(8.0))
                    ),
                    labelText: 'E-mail',
                    labelStyle: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    filled: true,
                    fillColor: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .06,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      //borderRadius: BorderRadius.all(Radius.circular(8.0))
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      //borderRadius: BorderRadius.all(Radius.circular(8.0))
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    filled: true,
                    fillColor: Colors.white),
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .05,
              width: MediaQuery.of(context).size.width * .95,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.blue),
              child: Center(
                  child: GestureDetector(
                onTap: () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: email, password: password)
                      .then((signedInUser) {
                    _fireStore
                        .collection('users')
                        .add({'email': email, 'Pass': password}).then((value) {
                      if (signedInUser != null) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HomePage()));
                      }
                    }).catchError((e) {
                      print(e);
                    });
                  }).catchError((e) {
                    print(e);
                  });
                },
                child: Text('Sign-Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              )),
            )
          ],
        ),
      ),
    );
  }
}
