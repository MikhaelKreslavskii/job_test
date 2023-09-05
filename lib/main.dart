import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:job_test_project/firebase_options.dart';
import 'package:job_test_project/presentation/generalPage.dart';
import 'package:job_test_project/presentation/trainingCard.dart';
import 'package:job_test_project/presentation/trainingCard_list.dart';
import 'package:job_test_project/presentation/webViewPage.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');
  runApp( GeneralPage());
}


 

