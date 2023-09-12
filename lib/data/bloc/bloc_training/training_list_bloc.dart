import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/training_repository/training_repository.dart';

part 'training_list_event.dart';
part 'training_list_state.dart';

class TrainingListBloc extends Bloc<TrainingListEvent, TrainingListState> {
  TrainingListBloc(this.value) : super(TrainingListInitial()) {
    on<LoadTraininList>((event, emit) {
      // TODO: implement event handler
    });
  }
  final String value;
  ///final trainingRepository = TrainingRepository(value);
}