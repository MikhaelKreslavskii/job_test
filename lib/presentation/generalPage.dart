import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:job_test_project/data/repositories/training_repository/firebase_repository.dart';
import 'package:job_test_project/presentation/trainingCard_list.dart';
import 'package:job_test_project/presentation/webViewPage.dart';

import '../data/repositories/training_repository/hive_visited.dart';

class GeneralPage extends StatefulWidget {
  const GeneralPage({super.key});

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  final _myBox = Hive.box('mybox');
  bool result = false;
  bool internetConnection = false;
  String urlFromData = "";

  _loadData() async {
    urlFromData = await FirebaseRepository().load();
    bool isEmu = await checkIsEmu();
    if ((urlFromData != "") && (!isEmu)) {
      HiveVisited().updateData(urlFromData);
      result = true;
      setState(() {});
    }
  }

  void checkInet() async {
    internetConnection = await internet() ?? false;
    setState(() {});

    log("Internet is $internetConnection");
    setState(() {});
  }

  @override
  void initState() {
    checkInet();

    if ((_myBox.get("URL") == null) || (_myBox.get("URL") == "")) {
      _loadData();
    } else {
      urlFromData = _myBox.get("URL");
      log("UrlFroMData $urlFromData");
      result = true;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: ((result == true) && (internetConnection == true))
              ? WebViewPage(url: urlFromData)
              :  (internetConnection == false)
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("No internet"),
                            ElevatedButton(onPressed: () 
                            {
                              checkInet();
                              setState(() {
                                
                              });
                            }, child: Text("Refresh"))
                          ],
                        ))
                      : (result ==false)
                       ? TrainingCardList()
                     : Center(
                          child: CircularProgressIndicator(),
                        )),
    );
  }

  Future<bool> checkIsEmu() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final em = await deviceInfo.androidInfo;
    var phoneModel = em.model;
    var buildProduct = em.product;
    var buildHardware = em.hardware;
    var result = (em.fingerprint.startsWith("generic") ||
        phoneModel.contains("google_sdk") ||
        phoneModel.contains("droid4x") ||
        phoneModel.contains("Emulator") ||
        phoneModel.contains("Android SDK built for x86") ||
        em.manufacturer.contains("Genymotion") ||
        buildHardware == "goldfish" ||
        buildHardware == "vbox86" ||
        buildProduct == "sdk" ||
        buildProduct == "google_sdk" ||
        buildProduct == "sdk_x86" ||
        buildProduct == "vbox86p" ||
        em.brand.contains('google') ||
        em.board.toLowerCase().contains("nox") ||
        em.bootloader.toLowerCase().contains("nox") ||
        buildHardware.toLowerCase().contains("nox") ||
        !em.isPhysicalDevice ||
        buildProduct.toLowerCase().contains("nox"));
    if (result) return true;
    result = result ||
        (em.brand.startsWith("generic") && em.device.startsWith("generic"));
    if (result) return true;
    result = result || ("google_sdk" == buildProduct);
    return result;
  }

  Future<bool?> internet() async {
    try {
      final result = await InternetAddress.lookup("google.com");

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      internetConnection = false;
      return false;
    }
    setState(() {});
  }
}
