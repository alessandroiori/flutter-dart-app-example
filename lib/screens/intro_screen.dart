// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../shared/menu_drawer.dart';
import '../shared/menu_bottom.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(title: Text('AAAAAAA')),
            //appBar: AppBar(title: Text('Smetto di fumare')),
            drawer: MenuDrawer(),
            bottomNavigationBar: MenuBottom(),
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/dog.jpg'),
                  //image: AssetImage('assets/20_agosto.jpeg'),
                  fit: BoxFit.cover,
                  )
              ),
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white70
                  ),
                  child: Text(
                    'AAAAAAAAAA,\nAAAAAAAAA',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      // ignore: prefer_const_literals_to_create_immutables
                      shadows: [
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 2.0,
                          color: Color.fromARGB(255, 30, 169, 233)
                        )
                      ],
                    )),
                )),
        ));
  }
}