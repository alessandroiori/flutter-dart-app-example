// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import '../shared/menu_drawer.dart';
import '../shared/menu_bottom.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWeight = TextEditingController();

  final double fontSize = 18;
  String result = '';
  bool isMetric = false;
  bool isImperial = true;
  double? height;
  double? weight;
  late List<bool> isSelected;
  String heightMessage = '';
  String weightMessage = '';

  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightMessage =
        'Please insert your height in ' + ((isMetric) ? 'meter' : 'iches');
    weightMessage =
        'Please insert your weight in ' + ((isMetric) ? 'kilos' : 'pounds');
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      bottomNavigationBar: MenuBottom(),
      drawer: MenuDrawer(), //without this we have a '<' back arrow
      //body: Center(child: FlutterLogo())
      body: SingleChildScrollView(
        child: Column(children: [
          ToggleButtons(
              isSelected: isSelected,
              onPressed: toggleMeasure,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Metric', style: TextStyle(fontSize: fontSize)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Imperial', style: TextStyle(fontSize: fontSize)),
                ),
              ]),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: TextField(
                controller: txtHeight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: heightMessage)),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextField(
                controller: txtWeight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: weightMessage)),
          ),
          ElevatedButton(
              onPressed: findBMI,
              child:
                  Text('Calculate BMI', style: TextStyle(fontSize: fontSize))),
          Text(result, style: TextStyle(fontSize: fontSize)),
        ]),
      ),
    );
  }

  void toggleMeasure(value) {
    if (value == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }

  void findBMI() {
    double bmi = 0;
    double height = double.tryParse(txtHeight.text) ??
        0; // ?? -> if the tryPase return null than is set to 0
    double weight = double.tryParse(txtWeight.text) ??
        0; // ?? -> if the tryPase return null than is set to 0

    if (isMetric) {
      bmi = weight / (height * height);
    } else {
      bmi = weight * 703 / (height * height);
    }

    setState(() {
      result = 'Your BMI is ' + bmi.toStringAsFixed(2);
    });
  }
}
