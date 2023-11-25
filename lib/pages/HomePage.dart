import 'dart:convert';

import "package:flutter/material.dart";
import 'package:myapp2/models/QuestionModel.dart';
import 'package:myapp2/pages/PlayQuiz.dart';
import 'package:http/http.dart' as myHttp;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Controller untuk Username
  TextEditingController usernameController = TextEditingController();

  // Get Question from API
  late QuestionModel questions;
  final String url = "https://script.google.com/macros/s/AKfycbx9Ly4Zf4TOixt3cb1O3WX_FtFJ8sxO2HJNyFfKEC0/dev";

  void getAllData(String username) async {
    try{
      var response = await myHttp.get(Uri.parse(url));
      questions = QuestionModel.fromJson(json.decode(response.body));
      print('DEBUG : '+questions.data.length.toString());
      //Log.d('ZZZ DEBUG');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context)=>PlayQuiz(questionModel: questions, username:username,)));
    }catch (err){
      print('ERROR : '+err.toString());

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //text Yuk Quiz!
              const Text("Yuk Quiz!!",style: TextStyle(color: Colors.white, fontSize: 30),),

              //textfield username


              Padding(padding: EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                      hintText: "Masukan username",
                      fillColor: Colors.white,
                      filled: true
                  ),
                ),
              ),


              //button
              ElevatedButton(onPressed: (){

                // call getAllData from API
                // getAllData();

                // update call getAllData with username
                getAllData(usernameController.text);

                // pindahkan ke Function getAllData()
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context)=>PlayQuiz()));
              }, child: Text("M U L A I"),)

              
            ],
          ),
        ),
      ),
    );
  }
}
