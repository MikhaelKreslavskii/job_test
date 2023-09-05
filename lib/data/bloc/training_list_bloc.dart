import 'package:flutter_bloc/flutter_bloc.dart';

part 'training_list_event.dart';
part 'training_list_state.dart';

class TrainingListBloc extends Bloc<TrainingListEvent, TrainingListState> {
  TrainingListBloc() : super(TrainingListInitial()) {
    on<TrainingListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}