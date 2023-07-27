// ignore_for_file: prefer_const_constructors

import 'package:helloworld/widgets/left_bar.dart';
import 'package:helloworld/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style:
              TextStyle(color: Colors.amberAccent, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Color(0xff161615),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 130,
                      child: TextField(
                        controller: _heightController,
                        style: const TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.amberAccent,
                        ),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Height",
                          hintStyle: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "metres", // Add the label for height input
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 130,
                      child: TextField(
                        controller: _weightController,
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.amberAccent,
                        ),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Weight",
                          hintStyle: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w300,
                            color: Color(0xfff8f8f8),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "kg", // Add the label for weight input
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                // print("Calculate tapped");   for the debug purpose.

                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);

                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if (_bmiResult > 25) {
                    _textResult = "You're OVER_WEIGHT!!";
                  } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                    _textResult = "You have Normal Weight.";
                  } else {
                    _textResult = "You're Under Weight!!";
                  }
                });

                // print("_textResult: $_textResult");   for the debug purpose.
              },
              child: Text(
                "Calculate",
                style: TextStyle(
                  color: Colors.amberAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              _bmiResult.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 50,
                color: Colors.amberAccent,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Text(
                _textResult,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                  color: Colors.amberAccent,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            LeftBar(
              barWidth: 40,
            ),
            SizedBox(
              height: 20,
            ),
            LeftBar(
              barWidth: 80,
            ),
            SizedBox(
              height: 20,
            ),
            LeftBar(
              barWidth: 40,
            ),
            RightBar(
              barWidth: 120,
            ),
            SizedBox(
              height: 20,
            ),
            RightBar(
              barWidth: 60,
            ),
          ],
        ),
      ),
    );
  }
}
