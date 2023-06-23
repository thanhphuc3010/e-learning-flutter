import 'package:elearning/presentation/screens/welcome/bloc/welcome_event.dart';
import 'package:elearning/presentation/screens/welcome/bloc/welcome_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

//// Created by PhucPT on 17/06/2023

@injectable
class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    on((event, emit) => emit(WelcomeState(page: state.page)));
  }
}
