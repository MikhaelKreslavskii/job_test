import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:job_test_project/model/trainingModel.dart';

class TrainingRepository{
final String value;

  TrainingRepository(this.value);
  Future<List<TrainingModel>> getTrainingList() async {
    final response = await Dio(BaseOptions(headers:{'X-Api-Key' : '9IXxgDbvjjoNwAmNTuPkow==rVI4XafC6zg4Gisg'})).get('https://api.api-ninjas.com/v1/exercises?muscle='+value);
    log('response ${response.data}' );
    final data = response.data;
 ////   debugPrint(data.toString());
    List<TrainingModel> trainingModelList=[];
 //// List<TrainingModel> traininModelList = data.map((e) => TrainingModel(name: e.value, type: e.value, muscle: e.value, equipment: e.value, difficulty: e.value, instructions: e.value)).toList();
  for(int i=0;i<data.length; i++)
  {
   print(data[i]);

   final cur_data = data[i] as Map<String, dynamic>;

  log("AAAA $cur_data");

   String picture = 'assets/images/biceps.jpg';
   switch(cur_data["muscle"])
   {
    case "biceps":
      {
        picture = 'assets/images/biceps.jpg';
        break;
      }
    case "abdominals":
      {
        picture = 'assets/images/abdominals.jpg';
        break;
      }
    case "calves":
      {
        picture = 'assets/images/calves.jpg';
        break;
      }
    
   }
   trainingModelList.add(TrainingModel(name: cur_data["name"], type: cur_data["type"], muscle: cur_data["muscle"], equipment: cur_data["equipment"], difficulty: cur_data["difficulty"], instructions: cur_data["instructions"], picture: picture),);
   }
  

    return trainingModelList;

  }
}