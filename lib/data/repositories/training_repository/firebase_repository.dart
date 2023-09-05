import 'dart:developer';

import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseRepository
{
   ///String url="";
    Future<String> load() async {
    final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.fetchAndActivate();
    log('URL FROM FIREBASE ${remoteConfig.getString('url')}');
    return remoteConfig.getString('url');
  }
 

}