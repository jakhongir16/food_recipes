part of 'detail_meal_bloc.dart';

class DetailMealState extends Equatable {
  const DetailMealState({
    this.status = Status.loading,
    this.mealDetail,
});

  final Status status;
  final DetailFood? mealDetail;

  DetailMealState copyWith({
    Status? status,
    DetailFood? mealDetail,
}) {
    return DetailMealState(
      status: status ?? this.status,
      mealDetail: mealDetail ?? this.mealDetail,
    );
  }

  @override
  List<Object?> get props => [status, mealDetail];
}

