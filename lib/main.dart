import 'package:crative_minds_devolpment/github_repo_model.dart';
import 'package:crative_minds_devolpment/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {

   await Hive.initFlutter();
  Hive.registerAdapter(GithubRepoAdapter());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home_page(),
    );
  }
}
