import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';

import 'router_state_config.dart';
part 'router_transport_state.freezed.dart';

@freezed
class RouterTransportState extends RouterStateConfig with _$RouterTransportState {
  static const String path = RootRouterState.transportPath;

  const RouterTransportState._();

  const factory RouterTransportState({
    String? id,
    @Default(false) bool add,
    @Default(false) bool modalVisible,
  }) = _RouterTransportState;

  factory RouterTransportState.add() => const RouterTransportState(add: true);

  factory RouterTransportState.fromUri(Uri uri) {
    final pathSegment2 = (uri.pathSegments.length >= 2) ? uri.pathSegments[1] : null;
    if (pathSegment2 == null) {
      return const RouterTransportState();
    }
    if ("/$pathSegment2" == RootRouterState.addPath) {
      return const RouterTransportState(add: true);
    }

    return RouterTransportState(id: pathSegment2);
  }

  @override
  Uri get uri => Uri(
        path: path + getPath(add, RootRouterState.addPath) + getPath(id?.trim().isNotEmpty, "/$id"),
      );

  @override
  RootRouterState get state => RootRouterState.transport(this);
}
