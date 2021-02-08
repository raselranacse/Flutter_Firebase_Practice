import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_practice/views/home_page.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: 50,),
            Container(
              height: MediaQuery.of(context).size.height*.06,
              child: TextField(
                onChanged: (value){
                  email=value;
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
                    labelStyle: TextStyle(fontStyle: FontStyle.normal,fontSize: 15,fontWeight: FontWeight.bold),
                    filled: true,
                    fillColor: Colors.white
                ),

              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: MediaQuery.of(context).size.height*.06,
              child: TextField(
                onChanged: (value){
                 password= value;
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
                    labelStyle: TextStyle(fontStyle: FontStyle.normal,fontSize: 15,fontWeight: FontWeight.bold),
                    filled: true,
                    fillColor: Colors.white
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: MediaQuery.of(context).size.height*.05,
              width: MediaQuery.of(context).size.width*.95,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blue
              ),
              child: Center(
                  child: GestureDetector(
                    onTap: (){
                      FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: email, password: password).then((value){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                      }).catchError((e){
                        print(e);
                      });
                    },
                    child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold)),
                  )),
            )

          ],
        ),
      ),
    );
  }
}
