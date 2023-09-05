import 'package:flutter/material.dart';

import '../model/trainingModel.dart';

class TrainingInstructionPage extends StatelessWidget {
  final TrainingModel trainingModel;

  const TrainingInstructionPage({super.key, required this.trainingModel});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('${trainingModel.name}'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Image.asset(trainingModel.picture),
              
              Text(trainingModel.instructions)
              
              
              
              
              
              
            ]
            ),
        ),
          );
        }
      )
    );
        }
    
  }

