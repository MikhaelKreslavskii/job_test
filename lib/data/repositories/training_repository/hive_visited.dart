import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';



class HiveVisited{

 String _savedUrl = "";

final _myBox =Hive.box('mybox');



void updateData(String url)
{
  _savedUrl=url;
  try{
  _myBox.put("URL", _savedUrl);
  }
  catch(e)
  {
    print("My error $e");
  }
}

void loadData()
{
  _savedUrl = _myBox.get("FLAG");
}
 
String get savedUrl => _savedUrl;  
}