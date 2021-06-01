import 'package:fluro/fluro.dart';
import 'package:flutter_algo_wallet/routes/route_handlers.dart';

final router = FluroRouter();

class RouteConfiguration {
  static Future<void> register() async {
    // Register the routes
    router.define("/", handler: rootHandler);
  }
}
