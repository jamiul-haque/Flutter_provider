import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerr/provider/count_provider.dart';
import 'package:providerr/provider/example_one_provider.dart';
import 'package:providerr/screens/examples/example_one.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => ExampleOneProvider()),

        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home:const  ExampleOneScreen(),
        )
    );
  }
}

