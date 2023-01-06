import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sp_02_agenda/data.dart';
import 'package:sp_02_agenda/models/task.dart';
import 'package:sp_02_agenda/screens/task_screen.dart';
import 'package:sp_02_agenda/user_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Data? data;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    List<Task> defaultTaskList = [];

    Data defaultUserData = Data(defaultTaskList);
    Map<String, dynamic> defaultData = defaultUserData.toMap();
    String encodeDefaultData = jsonEncode(defaultData);

    String? userData = UserPreferences.getData() ?? encodeDefaultData;
    Map<String, dynamic> userDataMap = jsonDecode(userData);
    data = Data.fromMap(userDataMap);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => data,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        home: const TasksScreen(),
      ),
    );
  }
}
