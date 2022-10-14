part of 'home_cubit.dart';

class HomeState extends Equatable {
  final String errorMessage;
  final List<ProductionModel> productions;
  final Map<DateTime, DayStatus> schedule;

  const HomeState({
    this.errorMessage = '',
    this.productions = const [],
    this.schedule = const {},
  });

  @override
  List<Object> get props => [errorMessage, productions, schedule];

  HomeState copyWith({
    String? errorMessage,
    List<ProductionModel>? productions,
    Map<DateTime, DayStatus>? schedule,
  }) {
    return HomeState(
      errorMessage: errorMessage ?? this.errorMessage,
      productions: productions ?? this.productions,
      schedule: schedule ?? this.schedule,
    );
  }
}
