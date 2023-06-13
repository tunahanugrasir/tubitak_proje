import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubitak_proje/screen/home_view.dart';

import 'model/model.dart';
import 'theme/dark_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThinkSpeakViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: DarkTheme().theme,
      home: const HomeView(),
    );
  }
}
