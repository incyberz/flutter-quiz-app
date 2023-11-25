import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:myapp2/models/QuestionModel.dart';
import 'package:myapp2/pages/HasilQuiz.dart';

class PlayQuiz extends StatefulWidget {
  // menerima data dari HomePage
  final QuestionModel questionModel;
  final String username;

  const PlayQuiz(
      {super.key, required this.questionModel, required this.username});

  @override
  State<PlayQuiz> createState() => _PlayQuizState();
}

class _PlayQuizState extends State<PlayQuiz> {
  final _controller = CountDownController();

  // agar tampilan soal dinamis
  int index = 0;
  int poin = 0;

  void navigate(String optionChar) {
    setState(() {
      // cek benar/salah jawaban
      if (optionChar == widget.questionModel.data[index].kj) {
        poin++;
      }

      // menuju soal berikutnya
      index++;

      // tampilkan hasil jika soalnya habis
      if (index == widget.questionModel.data.length) {
        // poin = int.parse((poin/widget.questionModel.data.length*100) as String);
        Navigator.of(context)
            .push(MaterialPageRoute(
                builder: (context) => HasilQuiz(
                      poin: poin,
                    )))
            .then((value) => {setState(() {})});
      }
    });
  }

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
                  "1 / " + widget.questionModel.data.length.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  // "insho",
                  widget.username,
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
                duration: 60,
                text: 'detik lagi',
                onComplete: () => {
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                          builder: (context) => HasilQuiz(
                                poin: poin,
                              )))
                      .then((value) => {setState(() {})})
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              // "Ibukota Indonesia adalah ...",
              widget.questionModel.data[index].soal,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                navigate("a");
              },
              child: OpsiQuiz(
                opsiChar: "A",
                // opsiDetail: "Biru Donk",
                opsiDetail: widget.questionModel.data[index].opsiA,
                warna: Colors.blueAccent,
              ),
            ),
            GestureDetector(
              onTap: () {
                navigate("b");
              },
              child: OpsiQuiz(
                opsiChar: "B",
                // opsiDetail: "Merah",
                opsiDetail: widget.questionModel.data[index].opsiB,
                warna: Colors.blue,
              ),
            ),
            GestureDetector(
              onTap: () {
                navigate("c");
              },
              child: OpsiQuiz(
                opsiChar: "C",
                // opsiDetail: "Kuning",
                opsiDetail: widget.questionModel.data[index].opsiC,
                warna: Colors.blueAccent,
              ),
            ),
            GestureDetector(
              onTap: () {
                navigate("d");
              },
              child: OpsiQuiz(
                opsiChar: "D",
                // opsiDetail: "Jingga",
                opsiDetail: widget.questionModel.data[index].opsiD,
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
