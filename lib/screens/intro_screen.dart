// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:globo_fitness/screens/notification_payload_screen.dart';
import 'package:globo_fitness/services/local_notification_service.dart';
import '../shared/menu_drawer.dart';
import '../shared/menu_bottom.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late final LocalNotificationService service = LocalNotificationService();

  @override
  void initState() {
    service.init();
    listenToNotification();
    super.initState();
  }

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
          )),
          child: Center(
            /*
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
                    */
            child: SizedBox(
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        service.showNotification(
                            id: 0,
                            title: 'Notification Title',
                            body: 'Some boby');
                      },
                      child: const Text('Show Local Notification')),
                  ElevatedButton(
                      onPressed: () async {
                        service.showScheduledNotification(
                            id: 1,
                            title: 'Notification Title',
                            body: 'Some boby',
                            seconds: 4);
                      },
                      child: const Text('Show Scheduled Notification')),
                  ElevatedButton(
                      onPressed: () async {
                        service.showNotificationWithPayload(
                            id: 2,
                            title: 'Notification Title',
                            body: 'Some boby',
                            payload: 'Payload Navigation');
                      },
                      child: const Text('Show Notification with Payload')),
                ],
              ),
            ),
          ),
        ));
  }

  void listenToNotification() =>
      service.onNotificationClick.stream.listen(onNotificationListener);

  void onNotificationListener(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      //print('payload $payload');

      Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotificationPayloadScreen(payload: payload))
          );
    }
  }
}
