import 'dart:convert';
import 'dart:js';

import 'package:auth3/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class loginscreen extends StatelessWidget{
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future login() async {
    var response = await http.post(Uri.parse("rabie-co.com/user.php"), body: {
      "username": username.text,
      "password": password.text,
    });
    var data = json.decode(response.body);
    if (data == "Success") {
      // BottomSheet()
      Fluttertoast.showToast(
          msg: "Login Successful",
        //  toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard() ));


    }
    else {
      Fluttertoast.showToast(
          msg: "Username and password invalid",
          //  toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );

    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: username,
            autocorrect: true,
            decoration: InputDecoration(hintText: 'enter username'),
          ),
          TextField(
            controller: password,
            autocorrect: true,
            decoration: InputDecoration(hintText: 'enter password'),
          ),

        ],
      ),

    );
  }


}