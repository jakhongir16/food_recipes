part of 'introduction_bloc.dart';

abstract class IntroductionEvent extends Equatable {
  const IntroductionEvent();
}

class EventIntro extends IntroductionEvent {
  @override
  List<Object?> get props => [];
}
