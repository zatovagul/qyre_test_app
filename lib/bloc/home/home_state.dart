part of 'home_cubit.dart';

class HomeState extends Equatable {
  final String errorMessage;
  final List<ProductionModel> productions;
  const HomeState({
    this.errorMessage = '',
    this.productions = const [],
  });

  @override
  List<Object> get props => [errorMessage, productions];

  HomeState copyWith({
    String? errorMessage,
    List<ProductionModel>? productions,
  }) {
    return HomeState(
      errorMessage: errorMessage ?? this.errorMessage,
      productions: productions ?? this.productions,
    );
  }
}
