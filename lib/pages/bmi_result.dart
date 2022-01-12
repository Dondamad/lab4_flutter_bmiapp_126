import 'package:bmi_app/pages/bmi_main.dart';
import 'package:flutter/material.dart';

class BmiResult extends StatefulWidget {
  const BmiResult({Key? key, required this.bmiResult, required this.resultText})
      : super(key: key);

  final String bmiResult;
  final String resultText;

  @override
  _BmiResultState createState() => _BmiResultState();
}

class _BmiResultState extends State<BmiResult> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text(
            'Your Result',
            style: TextStyle(
              color: Color(0xFFf9efe0),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(0xFFf9efe0),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: [Colors.purple, Colors.blue],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 24.0),
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: Text(
                            'Your BMI is',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Text(
                          widget.bmiResult,
                          style: const TextStyle(
                              fontSize: 66, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          widget.resultText,
                          style: const TextStyle(fontSize: 32),
                        ),
                      ],
                    ),
                  ),
                ),
                bottomBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox bottomBtn() {
    return SizedBox(
      width: 230,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BmiMain(),
                ));
          },
          child: const Text(
            'Recalculate',
            style: TextStyle(fontSize: 20),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.grey[200]),
            foregroundColor: MaterialStateProperty.all(Colors.purple),
          ),
        ),
      ),
    );
  }
}
