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

  static const housingPath = "/housing";

  static const ticketsPath = "/tickets";

  static const addPath = "/add";

  static const searchHousingPath = "/search-housing";

  static const searchTransportPath = "/search-transport";

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
  bool get isModalOpened => maybeWhen(
        orElse: () => false,
        tickets: (stateConfig) => stateConfig.modalVisible,
        transport: (stateConfig) => stateConfig.modalVisible,
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

  const factory RootRouterState.transport([
    @Default(RouterTransportState()) RouterTransportState stateConfig,
  ]) = _Transport;

  const factory RootRouterState.housing([
    @Default(RouterHousingState()) RouterHousingState stateConfig,
  ]) = _Housing;

  const factory RootRouterState.tickets([
    @Default(RouterTicketsState()) RouterTicketsState stateConfig,
  ]) = _Tickets;

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
  factory RootRouterState.fromUri(Uri uri) {
    final pathSegment = "/${uri.pathSegments[0]}";
    if (pathSegment == homePath) {
      final pathSegment2 = uri.pathSegments.length == 2 ? "/${uri.pathSegments[1]}" : null;
      return RootRouterState.home(viewProfile: pathSegment2 == profilePath);
    }
    if (pathSegment == authPath) {
      return const RootRouterState.unauthenticated();
    }
    if (pathSegment == registerPath) {
      return const RootRouterState.register();
    }
    if (pathSegment == transportPath) {
      return RouterTransportState.fromUri(uri).state;
    }
    if (pathSegment == housingPath) {
      return RouterHousingState.fromUri(uri).state;
    }
    if (pathSegment == ticketsPath) {
      return RouterTicketsState.fromUri(uri).state;
    }
    return const RootRouterState.unknown();
  }

  /// Get the corresponding url for each state
  String get uriPath => maybeWhen(
        initial: () => rootPath,
        unauthenticated: () => authPath,
        register: () => registerPath,
        home: (_, viewProfile) => "$homePath${_getPath(viewProfile, profilePath)}",
        transport: (stateConfig) => stateConfig.uriPpath,
        housing: (stateConfig) => stateConfig.uriPpath,
        tickets: (stateConfig) => stateConfig.uriPpath,
        orElse: () => unknownPath,
      );

  dynamic get popResult => maybeWhen(
        orElse: () => null,
        tickets: (stateConfig) => stateConfig.popResult,
      );

  /// Return the path if the expression is `true`, otherwise return an empty string.
  String _getPath(bool expression, String path) => expression ? path : "";
}
