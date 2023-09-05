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
String urlFromData="";
 _loadData() async
{
  urlFromData = await FirebaseRepository().load();
  if(urlFromData!="")
        {
            HiveVisited().updateData(urlFromData);
            result=true;
           
        }
}
  @override
  void initState()  {
    super.initState();
    if((_myBox.get("URL")==null)||(_myBox.get("URL")==""))
    {
      _loadData();
        ///String url = urlFromData;

        
        
    }

    else
    {
      urlFromData = _myBox.get("URL");
    }
    
    
   
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: (result==true) ? WebViewPage(url: urlFromData) : TrainingCardList() ,
      ),
      
    );
  }
}