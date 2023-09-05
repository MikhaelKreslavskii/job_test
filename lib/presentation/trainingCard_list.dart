import 'dart:developer';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:job_test_project/data/repositories/training_repository/firebase_repository.dart';

import 'package:job_test_project/data/repositories/training_repository/training_repository.dart';
import 'package:job_test_project/presentation/trainingCard.dart';

import '../data/repositories/training_repository/hive_visited.dart';
import '../model/trainingModel.dart';

class TrainingCardList extends StatefulWidget {
  TrainingCardList({super.key});

  @override
  State<TrainingCardList> createState() => _TrainingCardListState();
}

class _TrainingCardListState extends State<TrainingCardList> {


  List<TrainingModel>? _trainingModelList;
  String value = "biceps";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Choose your muscle"),
      ),
      body: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.width/2,
                child: DropdownButton<String>(
                  isExpanded: true,
                  isDense: true,
                  value: value,
                  onChanged: (newValue) {
                    value = newValue!;
                    setState(() {
                      
                    });
                  },
                  items: [
                    DropdownMenuItem(child: Text('biceps'), value: 'biceps',),
                    DropdownMenuItem(child: Text('abdominals'), value: 'abdominals',),
                    DropdownMenuItem(child: Text('calves'), value: 'calves',),
                  ],
                ),
              ),
              ElevatedButton(onPressed: (){
                _loadData();
              }, child: Text("Search"))
            ],
          ),
        ),


        (_trainingModelList == null)
            ? Center(child: CircularProgressIndicator())
            : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.75,
                  child: ListView.builder(
                      itemBuilder: (context, i) {
                        return TrainingCard(_trainingModelList![i]);
                      },
                      itemCount: _trainingModelList!.length),
                ),
            ),
      ]),
     
    ));
  }

  void _loadData() async
  {
     _trainingModelList = await TrainingRepository(value).getTrainingList();
          log(_trainingModelList!.length.toString());
          setState(() {});
        }
  
}
