import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/domain/core/operation_result.dart';
import 'package:refugee_help/domain/housing/housing_model.dart';
import 'package:refugee_help/domain/housing/housing_repository.dart';
import 'package:refugee_help/domain/housing/list_housing_request_model.dart';
import 'package:refugee_help/domain/user/user_model.dart';
import 'package:refugee_help/infrastructure/utils.dart';

part 'list_housing_state.dart';
part 'list_housing_cubit.freezed.dart';

class ListHousingCubit extends Cubit<ListHousingState> {
  late final HousingRepository _repo;
  late final StreamSubscription<OperationResult> _resultSub;
  StreamSubscription<List<HousingModel>>? _listSub;
  UserModel? _user;

  ListHousingCubit({required AuthenticationCubit authCubit})
      : _repo = HousingRepository(),
        super(const ListHousingState.initial()) {
    _user = authCubit.state.user;
    _resultSub = _repo.resultStream.listen(_parseResult);
  }

  void _parseResult(OperationResult result) => result.when(
        success: (response) {
          if (response is String) {
            emit(ListHousingState.success(response));
          }
          return;
        },
        failure: (message) => emit(ListHousingState.failure(message)),
      );

  Future<void> fetchList(ListHousingRequestModel request, {bool all = false}) async {
    final isLoading = state.maybeWhen(orElse: () => false, loading: (_) => true);
    if (isLoading) {
      return;
    }
    state.maybeMap(
      initial: (_) => null,
      orElse: () => emit(ListHousingState.loading("retrieving_data".tr())),
    );
    final updatedRequest = request.copyWith(userId: all ? null : _user!.id);
    await _listSub?.cancel();
    _listSub = _repo.listStream(updatedRequest).listen(_parseListSub);
  }

  void _parseListSub(List<HousingModel> list) {
    state.maybeWhen(
      orElse: () => null,
      loading: (_) => emit(const ListHousingState.success("")),
      deleting: () => emit(ListHousingState.success("deleted_housing".tr())),
    );
    emit(ListHousingState.view(list));
  }

  Future<void> delete(HousingModel model) async {
    emit(const ListHousingState.deleting());
    await Utils.repoDelay();
    await _repo.delete(model);
  }

  @override
  Future<void> close() async {
    await _repo.close();
    await _listSub?.cancel();
    await _resultSub.cancel();
    return super.close();
  }
}
