// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../data/sp_helper.dart';
import '../data/session.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({Key? key}) : super(key: key);

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  List<Session> sessions = [];
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtDuration = TextEditingController();
  final SPHelper helper = SPHelper();

  @override
  void initState() {
    helper.init().then((value) {
      updateScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Training Session'),
      ),
      body: ListView(children: getContent()),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showSessionDialog(context);
        },
      ),
    );
  }

  Future<dynamic> showSessionDialog(BuildContext context) async {
    return showDialog(
        context: context, //where you want show the Dialog Window
        builder: (BuildContext context) {
          // builder is a function
          return AlertDialog(
            title: Text('Insert Training Session'),
            content: SingleChildScrollView(
              child: Column(children: [
                TextField(
                  controller: txtDescription,
                  decoration: InputDecoration(hintText: 'Description'),
                ),
                TextField(
                  controller: txtDuration,
                  decoration: InputDecoration(hintText: 'Duration'),
                ),
              ]),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    txtDescription.text = '';
                    txtDuration.text = '';
                  },
                  child: Text('Cancel')),
              ElevatedButton(
                onPressed: saveSession,
                child: Text('Save'),
              )
            ], //SingleChildScrollView make the content scrollable
          );
        });
  }

  Future saveSession() async {
    DateTime now = DateTime.now();
    String today = '${now.year}-${now.month}-${now.day}';
    int id = helper.getCounter() + 1;
    Session newSession = Session(
        id, today, int.tryParse(txtDuration.text) ?? 0, txtDescription.text);
    helper.writeSession(newSession).then((_) {
      updateScreen();
      helper.setCounter(); //increase saved counter
    });
    txtDescription.text = '';
    txtDuration.text = '';
    Navigator.pop(context);
  }

  List<Widget> getContent() {
    List<Widget> tiles = [];
    sessions.forEach((Session session) {
      tiles.add(Dismissible(
        key: UniqueKey(), //uniquekey() return an unique random key
        onDismissed: (_) {
          helper.deleteSession(session.id).then((_) {
            updateScreen();
            //decrease the counter?
          });
        },
        child: ListTile(
          title: Text(session.description),
          subtitle: Text('${session.date} - ${session.duration} min'),
        ),
      ));
    });
    return tiles;
  }

  void updateScreen() {
    sessions = helper.getSessions();
    setState(() {});
  }
}
