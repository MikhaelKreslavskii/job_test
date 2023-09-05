import 'package:job_test_project/model/trainingModel.dart';

class TrainingListModel 
{
  final List<TrainingModel> _trainingList;

  TrainingListModel(this._trainingList);

  List<TrainingModel> get trainingList => _trainingList;

  
}