// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector_config.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$InjectorConfig extends InjectorConfig {
  @override
  void _configureValidators() {
    final KiwiContainer container = KiwiContainer();
    container
        .registerSingleton((c) => AutheticationValidator(c<AccountUsecase>()));
  }

  @override
  void _configureUsecases() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => AccountUsecase(c<AccountRepository>()));
  }

  @override
  void _configureRepositories() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton(
        (c) => AccountRepository(c<AccountRemoteDatasource>()));
  }

  @override
  void _configureRemoteDataSources() {
    final KiwiContainer container = KiwiContainer();
    container
        .registerSingleton((c) => AccountRemoteDatasource(c<HttpClient>()));
  }

  @override
  void _configureCommon() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => HttpClient.setLetTutorHost());
  }
}
