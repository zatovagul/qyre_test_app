import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../models/production/production_model.dart';
import '../../services/production/production_service.dart';
import '../base/base_cubit.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends BaseCubit<HomeState> {
  final ProductionService _productionService;
  HomeCubit(this._productionService) : super(const HomeState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(errorMessage: errorMessage));
  }

  void init() {
    getProductions();
  }

  void getProductions() async {
    await performSafeAction(() async {
      emit(state.copyWith(
        productions: await _productionService.getProductions(),
      ));
    });
  }
}
