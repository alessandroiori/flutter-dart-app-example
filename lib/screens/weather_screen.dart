// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../data/weather.dart';
import '../data/http_helper.dart';

class WeatherSceen extends StatefulWidget {
  const WeatherSceen({Key? key}) : super(key: key);

  @override
  State<WeatherSceen> createState() => _WeatherSceenState();
}

class _WeatherSceenState extends State<WeatherSceen> {
  final TextEditingController txtPlace = TextEditingController();
  Weather result = Weather('', '', 0, 0, 0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Weather')),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(children: [
            Padding(
                // ignore: prefer_const_constructors
                padding: EdgeInsets.all(16),
                child: TextField(
                    controller: txtPlace,
                    decoration: InputDecoration(
                        hintText: 'Enter a City',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: getData,
                        )))),
            weatherRow('Palce ', result.name),
            weatherRow('Description ', result.description),
            weatherRow('Temperature ', result.temperature.toStringAsFixed(2)),
            weatherRow('Perceived ', result.perceived.toStringAsFixed(2)),
            weatherRow('Pressure ', result.pressure.toString()),
            weatherRow('Humidity ', result.humidity.toString()),
          ]),
        ));
  }

  Future getData() async {
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather(txtPlace.text);
    setState(() {});
  }

  Widget weatherRow(String label, String value) {
    Widget row = Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Row(children: [
          Expanded(
              flex: 3,
              child: Text(label,
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).hintColor))),
          Expanded(
              flex: 4,
              child: Text(value,
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).primaryColor))),
        ]));
    return row;
  }
}
