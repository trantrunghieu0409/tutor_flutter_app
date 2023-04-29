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
    container
      ..registerSingleton((c) => AccountUsecase(c<AccountRepository>()))
      ..registerSingleton((c) => TutorUsecase(c<TutorRepository>()))
      ..registerSingleton((c) => HistoryUsecase(c<HistoryRepository>()));
  }

  @override
  void _configureRepositories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) => AccountRepository(
          c<AccountRemoteDatasource>(), c<AccountLocalDatasource>()))
      ..registerSingleton((c) => TutorRepository(
          c<TutorRemoteDatasource>(), c<AccountLocalDatasource>()))
      ..registerSingleton((c) => HistoryRepository(
          c<HistoryRemoteDatasource>(), c<AccountLocalDatasource>()));
  }

  @override
  void _configureRemoteDataSources() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) => AccountRemoteDatasource(c<HttpClient>()))
      ..registerSingleton((c) => TutorRemoteDatasource(c<HttpClient>()))
      ..registerSingleton((c) => HistoryRemoteDatasource(c<HttpClient>()));
  }

  @override
  void _configureLocalDataSources() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => AccountLocalDatasource());
  }

  @override
  void _configureCommon() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => HttpClient.setLetTutorHost());
  }
}
