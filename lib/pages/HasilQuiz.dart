import 'package:flutter/material.dart';

class HasilQuiz extends StatefulWidget {
  const HasilQuiz({super.key});

  @override
  State<HasilQuiz> createState() => _HasilQuizState();
}

class _HasilQuizState extends State<HasilQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/piala.png',
                width: 150,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Hore !! Nilai kamu 10',
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
