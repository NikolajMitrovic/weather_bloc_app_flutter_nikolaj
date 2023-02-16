import 'package:flutter/material.dart';
// import '_all.dart';
// import '../../app.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(children: const <Widget>[
        ListTile(
          title: Text('Temperature Units'),
        ),
      ]),
    );
  }
}
