import 'package:flutter/material.dart';

class HasilQuiz extends StatefulWidget {
  final int poin;

  const HasilQuiz({super.key, required this.poin});

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
                'Hore !! Nilai kamu '+widget.poin.toString(),
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
