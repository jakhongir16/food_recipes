import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'introduction_event.dart';
part 'introduction_state.dart';

class IntroductionBloc extends Bloc<IntroductionEvent, IntroState> {
  IntroductionBloc() : super(IntroInitial()) {
    on<EventIntro>(_introSplash);
  }

  _introSplash(EventIntro event, Emitter<IntroState> emit) async {
    final SharedPreferences sharedPrefs =
    await SharedPreferences.getInstance();
    emit(IntroLoading());
    Future.delayed(const Duration(seconds: 2)).then((value) async {
      return await sharedPrefs.setBool("introKey", true);
    });
    emit(IntroSuccess());
  }
}
