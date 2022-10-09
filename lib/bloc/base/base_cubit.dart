import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<State> extends Cubit<State> {
  BaseCubit(State initialState) : super(initialState);

  void handleError(String errorMessage);

  Future<T?> performSafeAction<T>(
    AsyncValueGetter<T> callback,
  ) async {
    try {
      return await callback();
    } catch (exception) {
      handleError('$exception');
      return null;
    }
  }
}
