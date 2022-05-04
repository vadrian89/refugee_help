import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';

import 'router_state_config.dart';
part 'router_housing_state.freezed.dart';

@freezed
class RouterHousingState extends RouterStateConfig with _$RouterHousingState {
  static const String path = RootRouterState.housingPath;

  const RouterHousingState._();

  const factory RouterHousingState({
    String? id,
    @Default(false) bool add,
    @Default(false) bool modalVisible,
  }) = _RouterHousingState;

  factory RouterHousingState.add() => const RouterHousingState(add: true);

  factory RouterHousingState.fromUri(Uri uri) {
    final pathSegment2 = (uri.pathSegments.length >= 2) ? uri.pathSegments[1] : null;
    if (pathSegment2 == null) {
      return const RouterHousingState();
    }
    if ("/$pathSegment2" == RootRouterState.addPath) {
      return const RouterHousingState(add: true);
    }
    return RouterHousingState(id: pathSegment2);
  }

  @override
  Uri get uri => Uri(
        path: path + getPath(add, RootRouterState.addPath) + getPath(id?.trim().isNotEmpty, "/$id"),
      );

  @override
  RootRouterState get state => RootRouterState.housing(this);
}
