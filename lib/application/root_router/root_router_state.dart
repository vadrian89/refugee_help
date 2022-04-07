part of 'root_router_cubit.dart';

/// The root router's state.
///
/// Built using freezed package: https://pub.dev/packages/freezed.
/// I use freezed package to write less boilerplate and cleaner/readable state classes.
/// Some of the members could be put in a separated class, for a more cleaner state class.
/// For alternative way of writing state classes you can check my tutorial: https://medium.com/@verbanady/navigator-2-0-with-bloc-cubit-part-1-3dbad5a43054#7a23
@freezed
class RootRouterState with _$RootRouterState {
  /// The root path of the app.
  static const rootPath = "/";

  /// Home path returned, once the user is authenticated.
  static const homePath = "/home";

  static const profilePath = "/user-profile";

  /// Path which means the user is not authenticated.
  static const authPath = "/auth";

  /// Path used for unverified users.
  static const unverifiedPath = "/unverified";

  /// Path used for registration screen.
  static const registerPath = "/register";

  /// 404 - page not found state
  static const unknownPath = "/404";

  static const transportPath = "/transport";

  static const ticketsPath = "/tickets";

  static const addPath = "/add";

  /// Getter to quickly check if the router is in unkown state.
  bool get isUknown => maybeWhen(orElse: () => false, unknown: () => true);

  /// Check if we the screen is root.
  /// [RootRouterState.unauthenticated] and [RootRouterState.home] show the root of the screen
  /// based on the current [AuthenticationState].
  bool get isRoot => maybeMap(
        orElse: () => false,
        unauthenticated: (_) => true,
        home: (home) => true,
      );

  bool get isRegister => maybeWhen(orElse: () => false, register: () => true);
  bool get isModalOpened => maybeMap(
        orElse: () => false,
        tickets: (tickets) => tickets.modalVisible,
        transport: (transport) => transport.modalVisible,
      );

  /// Define the private constructor to enable support for class methods and properties.
  const RootRouterState._();

  /// [RootRouterState.initial] is the initial state of the app.
  ///
  /// This should be used to show the user a loading screen/widget, until the app verifies
  /// if the user is authenticated or not.
  const factory RootRouterState.initial() = _Initial;

  /// [RootRouterState.unauthenticated] shows the [AuthenticationScreen].
  ///
  /// We switch to it when the [AuthenticationState.unauthenticated] is emitted.
  const factory RootRouterState.unauthenticated() = _Unauthenticated;

  /// [RootRouterState.home] is the state of the router after the user is authenticated.
  const factory RootRouterState.home({
    UserModel? user,
    @Default(false) bool viewProfile,
  }) = _Home;

  const factory RootRouterState.transport({
    String? id,
    @Default(false) bool add,
    @Default(false) bool modalVisible,
  }) = _Transport;

  const factory RootRouterState.tickets({
    String? id,
    TicketTypeModel? type,
    @Default(false) bool add,
    @Default(false) bool modalVisible,
    String? transportId,
  }) = _Tickets;

  /// [RootRouterState.register] shows [RegisterScreen].
  const factory RootRouterState.register() = _Register;

  /// [RootRouterState.unknown] is the state returned when the user requests an uknown page.
  ///
  /// This is the equivalent of error 404 for HTTP requests: https://en.wikipedia.org/wiki/HTTP_404.
  /// It shows [UnkownScreen].
  const factory RootRouterState.unknown() = _Unknown;

  /// Factory constructor used to get the correct state from an [Uri].
  ///
  /// This constructor is used inside [RootRouterParser.parseRouteInformation].
  factory RootRouterState.fromUriLevel1(Uri uri) {
    final pathSegment = "/${uri.pathSegments[0]}";
    if (pathSegment == homePath) {
      return const RootRouterState.home();
    } else if (pathSegment == authPath) {
      return const RootRouterState.unauthenticated();
    } else if (pathSegment == registerPath) {
      return const RootRouterState.register();
    } else if (pathSegment == transportPath) {
      return const RootRouterState.transport();
    } else {
      return const RootRouterState.unknown();
    }
  }

  /// Factory constructor used to get the correct state from an [Uri] when [Uri.length] is 2.
  ///
  /// This constructor is used inside [RootRouterParser.parseRouteInformation].
  factory RootRouterState.fromUriLevel2(Uri uri) {
    final pathSegment1 = "/${uri.pathSegments[0]}";
    final pathSegment2 = uri.pathSegments[1];
    if (pathSegment1 == homePath) {
      if ("/$pathSegment2" == profilePath) {
        return const RootRouterState.home(viewProfile: true);
      }
    }
    if (pathSegment1 == transportPath) {
      if ("/$pathSegment2" == addPath) {
        return const RootRouterState.transport(add: true);
      }
      return RootRouterState.transport(id: pathSegment2);
    }
    if (pathSegment1 == ticketsPath && TicketTypeModel.isValidType(pathSegment2)) {
      return RootRouterState.tickets(
        type: TicketTypeModel.values.firstWhereOrNull((element) => element.name == pathSegment2),
      );
    }
    return const RootRouterState.unknown();
  }

  /// Factory constructor used to get the correct state from an [Uri] when [Uri.length] is 3.
  ///
  /// This constructor is used inside [RootRouterParser.parseRouteInformation].
  factory RootRouterState.fromUriLevel3(Uri uri) {
    final pathSegment1 = "/${uri.pathSegments[0]}";
    final pathSegment2 = uri.pathSegments[1];
    final pathSegment3 = uri.pathSegments[2];
    final queryParameters = uri.queryParametersAll;
    if (pathSegment1 == ticketsPath && TicketTypeModel.isValidType(pathSegment2)) {
      if ("/$pathSegment3" == addPath) {
        return RootRouterState.tickets(
          add: true,
          modalVisible: queryParameters["transportId"] != null,
          transportId: queryParameters["transportId"]?.first,
          type: TicketTypeModel.values.firstWhereOrNull((element) => element.name == pathSegment2),
        );
      }
      return RootRouterState.tickets(
        id: pathSegment3,
        type: TicketTypeModel.values.firstWhereOrNull((element) => element.name == pathSegment2),
      );
    }
    return const RootRouterState.unknown();
  }

  /// Get the corresponding url for each state
  String get urlPath => maybeMap(
        initial: (_) => rootPath,
        unauthenticated: (_) => authPath,
        register: (_) => registerPath,
        home: (home) => "$homePath${_getPath(home.viewProfile, profilePath)}",
        transport: (transport) =>
            "$transportPath${_getPath(transport.add, addPath)}" +
            _getPath(transport.id?.trim().isNotEmpty ?? false, "/${transport.id}"),
        tickets: (tickets) =>
            ticketsPath +
            _getPath(tickets.type?.name.trim().isNotEmpty ?? false, "/${tickets.type!.name}") +
            _getPath(tickets.add, addPath) +
            _getPath(tickets.id?.trim().isNotEmpty ?? false, "/${tickets.id}") +
            _getPath(tickets.transportId?.trim().isNotEmpty ?? false, "?") +
            _getParameter("transportId", tickets.transportId ?? ""),
        orElse: () => unknownPath,
      );

  /// Return the path if the expression is `true`, otherwise return an empty string.
  String _getPath(bool expression, path) => expression ? path : "";

  String _getParameter(String name, String value) {
    if (value.trim().isEmpty) return "";

    return "$name=$value";
  }
}
