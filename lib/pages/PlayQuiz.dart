import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';

class PlayQuiz extends StatefulWidget {
  const PlayQuiz({super.key});

  @override
  State<PlayQuiz> createState() => _PlayQuizState();
}

class _PlayQuizState extends State<PlayQuiz> {
  final _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[400],
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "1 / 10",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  "insho",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 150,
              width: 150,
              child: CountDownProgressIndicator(
                controller: _controller,
                valueColor: Colors.red,
                backgroundColor: Colors.blue,
                initialPosition: 0,
                duration: 30,
                text: 'detik lagi',
                onComplete: () => null,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Ibukota Indonesia adalah ...",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {},
              child: OpsiQuiz(
                opsiChar: "A",
                opsiDetail: "Biru Donk",
                warna: Colors.blueAccent,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: OpsiQuiz(
                opsiChar: "B",
                opsiDetail: "Merah",
                warna: Colors.blue,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: OpsiQuiz(
                opsiChar: "C",
                opsiDetail: "Kuning",
                warna: Colors.blueAccent,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: OpsiQuiz(
                opsiChar: "D",
                opsiDetail: "Jingga",
                warna: Colors.blue,
              ),
            )
          ],
        ),
      )),
    );
  }
}

class OpsiQuiz extends StatelessWidget {
  //parameter
  final String opsiChar;
  final String opsiDetail;
  final Color warna;

  const OpsiQuiz({
    super.key,
    required this.opsiChar,
    required this.opsiDetail,
    required this.warna,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Text(
                opsiChar,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  opsiDetail,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(color: warna),
      ),
    );
  }
}
