import 'package:tutor_flutter_app/core/config/build_environment.dart';

class Environment {
  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static final Environment _singleton = Environment._internal();

  static const String DEV = 'DEV';
  static const String PROD = 'PROD';

  BuildEnvironment? config;

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  BuildEnvironment _getConfig(String environment) {
    if (environment == Environment.PROD) {
      BuildEnvironment.init(
          flavor: BuildFlavor.production,
          baseUrl: 'https://sandbox.api.lettutor.com/');
    } else {
      BuildEnvironment.init(
          flavor: BuildFlavor.development,
          baseUrl: 'https://sandbox.api.lettutor.com/');
    }
    return env;
  }
}
