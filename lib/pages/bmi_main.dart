import 'package:bmi_app/calculate.dart';
import 'package:bmi_app/pages/bmi_result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BmiMain extends StatefulWidget {
  const BmiMain({Key? key}) : super(key: key);

  @override
  _BmiMainState createState() => _BmiMainState();
}

class _BmiMainState extends State<BmiMain> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text(
            'Home',
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
              // end: Alignment.centerRight,
              colors: [Colors.purple, Colors.blue],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(children: [
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'Your Weight',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      weightTextfield(),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'Your Height',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      heightTextfield(),
                      const SizedBox(height: 48),
                      calcButton(context)
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox calcButton(BuildContext context) {
    final AlertDialog dialog = AlertDialog(
      title: Row(
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              FontAwesomeIcons.exclamationTriangle,
              color: Colors.red,
            ),
          ),
          Text('Empty input field')
        ],
      ),
      // title: ,
      content: const Text(
        'height and weight must not empty.',
        style: TextStyle(fontSize: 18),
      ),

      actions: [
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(const Color(0xFF6200EE)),
          ),
          // textColor: Color(0xFF6200EE),
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    );
    return SizedBox(
      width: 230,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          onPressed: () {
            if (weightController.text.isNotEmpty &&
                heightController.text.isNotEmpty) {
              Calculator cal = Calculator(double.parse(weightController.text),
                  double.parse(heightController.text));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BmiResult(
                    bmiResult: cal.calculateBMI(),
                    resultText: cal.resultText(),
                  ),
                ),
              );
            } else {
              showDialog<void>(context: context, builder: (context) => dialog);
            }
          },
          child: const Text(
            'Calculate',
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

  weightTextfield() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: weightController,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      cursorColor: Colors.purple,
      style: const TextStyle(fontSize: 28),
      decoration: InputDecoration(
        hintText: 'weight in kg',
        hintStyle: const TextStyle(fontSize: 22),
        prefixIcon: const Icon(
          FontAwesomeIcons.weight,
          color: Colors.purple,
        ),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      ),
    );
  }

  heightTextfield() {
    return TextFormField(
      textInputAction: TextInputAction.done,
      controller: heightController,
      keyboardType: TextInputType.number,
      style: const TextStyle(fontSize: 28),
      textAlign: TextAlign.center,
      cursorColor: Colors.purple,
      decoration: InputDecoration(
        hintText: 'height in cm',
        hintStyle: const TextStyle(fontSize: 22),
        prefixIcon: const Icon(
          FontAwesomeIcons.arrowsAltV,
          color: Colors.purple,
        ),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      ),
    );
  }
}
