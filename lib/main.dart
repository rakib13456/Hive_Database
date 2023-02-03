import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_database/home.dart';
import 'package:hive_flutter/adapters.dart';


void  main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Box box =await Hive.openBox('name-box');
  //Box box1 =await Hive.openBox('nmbr-box');
  runApp(MyApp());
  
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage() ,
    );
  }
}
