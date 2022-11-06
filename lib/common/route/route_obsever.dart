import 'package:flutter/cupertino.dart';

class RouteAppObserver extends RouteObserver<PageRoute<dynamic>> {
  Route? currentRoute;

  _printLog(String message) {
    print('----------------Route Observer----------------');
    print('');
    print(message);
    print('');
    print('----------------------------------------------');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    if (route is PageRoute && previousRoute is PageRoute) {
      currentRoute = route;
      _printLog('didPop: {route : ${route.settings.name}, previousRoute: ${previousRoute.settings.name}}');
    }
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute && previousRoute is PageRoute) {
      currentRoute = route;
      _printLog('didPush: {route : ${route.settings.name}, previousRoute: ${previousRoute.settings.name}}');
    }
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    if (route is PageRoute && previousRoute is PageRoute) {
      currentRoute = route;
      _printLog('didRemove: {route : ${route.settings.name}, previousRoute: ${previousRoute.settings.name}}');
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute && oldRoute is PageRoute) {
      currentRoute = newRoute;
      _printLog('didReplace: {newRoute : ${newRoute.settings.name}, oldRoute: ${oldRoute.settings.name}}');
    }
  }
}
