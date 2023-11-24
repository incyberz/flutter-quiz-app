import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  decoration: const InputDecoration(
                      hintText: "Masukan username",
                      fillColor: Colors.white,
                      filled: true
                  ),
                ),
              ),


              //button
              ElevatedButton(onPressed: (){}, child: Text("M U L A I"),)

              
            ],
          ),
        ),
      ),
    );
  }
}
