import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/domain/tickets/ticket_type_model.dart';

import 'router_state_config.dart';
part 'router_tickets_state.freezed.dart';

@freezed
class RouterTicketsState extends RouterStateConfig with _$RouterTicketsState {
  static const String path = RootRouterState.ticketsPath;

  const RouterTicketsState._();

  const factory RouterTicketsState({
    String? id,
    @Default(false) bool add,
    @Default(false) bool modalVisible,
    TicketTypeModel? type,
    String? transportId,
    String? housingId,
    @Default(false) bool searchHousing,
    @Default(false) bool searchTransport,
    @Default(false) bool isUnkown,
    Object? popResult,
  }) = _RouterTicketState;

  factory RouterTicketsState.add(TicketTypeModel type) => RouterTicketsState(
        add: true,
        type: type,
      );

  factory RouterTicketsState.fromUri(Uri uri) {
    if (uri.pathSegments.length == 2) {
      return RouterTicketsState.fromUriLevel2(uri);
    }
    if (uri.pathSegments.length == 3) {
      return RouterTicketsState.fromUriLevel3(uri);
    }
    if (uri.pathSegments.length == 4) {
      return RouterTicketsState.fromUriLevel4(uri);
    }
    return const RouterTicketsState(isUnkown: true);
  }

  /// Factory constructor used to get the correct state from an [Uri] when [Uri.length] is 2.
  factory RouterTicketsState.fromUriLevel2(Uri uri) {
    final pathSegment2 = uri.pathSegments[1];
    if (TicketTypeModel.isValidType(pathSegment2)) {
      return RouterTicketsState(
        type: TicketTypeModel.values.firstWhereOrNull((element) => element.name == pathSegment2),
      );
    }
    return const RouterTicketsState(isUnkown: true);
  }

  /// Factory constructor used to get the correct state from an [Uri] when [Uri.length] is 3.
  factory RouterTicketsState.fromUriLevel3(Uri uri) {
    final pathSegment2 = uri.pathSegments[1];
    final pathSegment3 = uri.pathSegments[2];
    if (TicketTypeModel.isValidType(pathSegment2)) {
      final isAddPath = "/$pathSegment3" == RootRouterState.addPath;
      return RouterTicketsState(
        type: TicketTypeModel.values.firstWhereOrNull((element) => element.name == pathSegment2),
        add: isAddPath,
        id: isAddPath ? null : pathSegment3,
      );
    }
    return const RouterTicketsState(isUnkown: true);
  }

  /// Factory constructor used to get the correct state from an [Uri] when [Uri.length] is 4.
  factory RouterTicketsState.fromUriLevel4(Uri uri) {
    final pathSegment2 = uri.pathSegments[1];
    final pathSegment3 = uri.pathSegments[2];
    final pathSegment4 = uri.pathSegments[3];
    final queryParameters = uri.queryParameters;
    if (TicketTypeModel.isValidType(pathSegment2)) {
      final isAddPath = "/$pathSegment3" == RootRouterState.addPath;
      return RouterTicketsState(
        type: TicketTypeModel.values.firstWhereOrNull((element) => element.name == pathSegment2),
        add: isAddPath,
        id: isAddPath ? null : pathSegment3,
        searchHousing: "/$pathSegment4" == RootRouterState.searchHousingPath,
        searchTransport: "/$pathSegment4" == RootRouterState.searchTransportPath,
        transportId: queryParameters["transportId"],
        housingId: queryParameters["housingId"],
      );
    }
    return const RouterTicketsState(isUnkown: true);
  }

  @override
  Uri get uri {
    final uri = Uri(
      path: path +
          getPath(type?.name.trim().isNotEmpty ?? false, "/${type!.name}") +
          getPath(add, RootRouterState.addPath) +
          getPath(id?.trim().isNotEmpty, "/$id") +
          getPath(searchHousing, RootRouterState.searchHousingPath) +
          getPath(searchTransport, RootRouterState.searchTransportPath),
      queryParameters: <String, dynamic>{
        if (transportId?.isNotEmpty ?? false) "transportId": transportId,
        if (housingId?.isNotEmpty ?? false) "housingId": housingId,
      },
    );
    return uri;
  }

  @override
  RootRouterState get state {
    if (isUnkown) {
      return const RootRouterState.unknown();
    }
    return RootRouterState.tickets(this);
  }

  RootRouterState? popedState(dynamic popResult) {
    if ((transportId?.isNotEmpty ?? false) || (housingId?.isNotEmpty ?? false)) {
      return copyWith(transportId: null, housingId: null).state;
    }
    if (searchHousing || searchTransport) {
      return copyWith(
        searchHousing: false,
        searchTransport: false,
        popResult: popResult,
      ).state;
    }
    if (id != null || add) {
      return RouterTicketsState(type: type).state;
    }
    return null;
  }
}
