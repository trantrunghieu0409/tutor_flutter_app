// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector_config.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$InjectorConfig extends InjectorConfig {
  @override
  void _configureSettingsController() {
    final KiwiContainer container = KiwiContainer();
    container
        .registerSingleton((c) => SettingsController(c<SettingsRepository>()));
  }

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
      ..registerSingleton((c) => HistoryUsecase(c<HistoryRepository>()))
      ..registerSingleton((c) => PastHistoryUsecase(c<PastHistoryRepository>()))
      ..registerSingleton((c) => CourseUsecase(c<CourseRepository>()))
      ..registerSingleton(
          (c) => ChatgptUsecase(chatgptRepository: c<ChatgptRepository>()));
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
          c<HistoryRemoteDatasource>(), c<AccountLocalDatasource>()))
      ..registerSingleton((c) => PastHistoryRepository(
          c<PastHistoryRemoteDatasource>(), c<AccountLocalDatasource>()))
      ..registerSingleton((c) => CourseRepository(
          c<CourseRemoteDatasource>(), c<AccountLocalDatasource>()))
      ..registerSingleton((c) => SettingsRepository(
          settingsLocalDatasource: c<SettingLocalDatasource>()))
      ..registerSingleton((c) => ChatgptRepository(
          chatgptRemoteDatasource: c<ChatgptRemoteDatasource>(),
          chatgptLocalDatasource: c<ChatgptLocalDatasource>()));
  }

  @override
  void _configureRemoteDataSources() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton(
          (c) => AccountRemoteDatasource(c<HttpClient>(), c<DioClient>()))
      ..registerSingleton((c) => TutorRemoteDatasource(c<HttpClient>()))
      ..registerSingleton((c) => HistoryRemoteDatasource(c<HttpClient>()))
      ..registerSingleton((c) => PastHistoryRemoteDatasource(c<HttpClient>()))
      ..registerSingleton((c) => CourseRemoteDatasource(c<HttpClient>()))
      ..registerSingleton(
          (c) => ChatgptRemoteDatasource(httpClient: c<ChatGptHttpClient>()));
  }

  @override
  void _configureLocalDataSources() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) => AccountLocalDatasource())
      ..registerSingleton((c) => SettingLocalDatasource())
      ..registerSingleton((c) => ChatgptLocalDatasource());
  }

  @override
  void _configureCommon() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) => HttpClient.setLetTutorHost())
      ..registerSingleton((c) => ChatGptHttpClient.setChatgptAPIhost())
      ..registerSingleton((c) => DioClient.setLetTutorHost());
  }
}
