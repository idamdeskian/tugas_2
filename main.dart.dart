import 'package:flutter/material.dart';
import 'stateful_tab.dart';
import 'provider_tab.dart';
import 'riverpod_tab.dart';
import 'bloc_tab.dart';
import 'getx_tab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToDoApp(),
    );
  }
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('To-Do App'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Stateful'),
              Tab(text: 'Provider'),
              Tab(text: 'Riverpod'),
              Tab(text: 'Bloc'),
              Tab(text: 'GetX'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            StatefulTab(),
            ProviderTab(),
            RiverpodTab(),
            BlocTab(),
            GetXTab(),
          ],
        ),
      ),
    );
  }
}
