import 'package:flutter/material.dart';
import 'package:job_test_project/presentation/trainingInstructionPage.dart';

import '../model/trainingModel.dart';

class TrainingCard extends StatelessWidget {
  final TrainingModel trainingModel;
  TrainingCard(this.trainingModel);
  String val = "Medium";
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(trainingModel.picture),
      title: Text("${trainingModel.name}", style: TextStyle(fontWeight: FontWeight.bold),),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Muscle: ${trainingModel.muscle}"),
        Text('Equipment: ${trainingModel.equipment}'),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: (trainingModel.difficulty=="Hard")?Colors.red 
              : (trainingModel.difficulty == "beginner") ? Colors.green 
              : Colors.yellow
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right:8.0, top: 4, bottom: 4),
              child: Text(
                '${trainingModel.difficulty}'),
            ))
      ]),
      trailing: IconButton(
        onPressed: () {
          Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) =>  TrainingInstructionPage(trainingModel: trainingModel),
    )
          );
        },
        icon: Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}
