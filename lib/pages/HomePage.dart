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

  // Controller for Username
  TextEditingController usernameController = TextEditingController();

  // Get Question from API
  late QuestionModel questionModel;
  final String url = "https://script.google.com/macros/s/AKfycbzUL5ypkoLwaYwJ8tJcw56gVPO2QUeU05ZeQ_RVH_XjWSdajzhKQuefddanapxPikM/exec";

  void getAllData(String username) async {
    try{
      var response = await myHttp.get(Uri.parse(url));
      questionModel = QuestionModel.fromJson(json.decode(response.body));

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context)=>PlayQuiz(questionModel: questionModel, username:username,)));
    }catch (err){
      print('VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV');
      print('ERROR : $err');

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
