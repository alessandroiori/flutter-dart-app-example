// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:shared_preferences/shared_preferences.dart';
import 'session.dart';
import 'dart:convert';

class SPHelper {
  //static to call the same instance every time
  static late SharedPreferences prefs;

  Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future writeSession(Session session) async {
    prefs.setString(
        session.id.toString(),
        json.encode(session
            .toJson())); // we can save string so we convert sesssion object to json and encode json to string with json.encode()
  }

  List<Session> getSessions() {
    List<Session> sessions = []; //ordered list
    Set<String> keys = prefs.getKeys(); //unordered set
    keys.forEach((String key) {
      if (key != 'counter') {
        Session session =
            Session.fromJson(json.decode(prefs.getString(key) ?? ''));
        sessions.add(session);
      }
    });
    return sessions;
  }

  Future setCounter() async {
    int counter = prefs.getInt('counter') ?? 0;
    counter++;
    await prefs.setInt('counter', counter);
  }

  int getCounter() {
    return prefs.getInt('counter') ?? 0;
  }

  Future deleteSession(int id) async {
    await prefs.remove(id.toString());
  }
}
