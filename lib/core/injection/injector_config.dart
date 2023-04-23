import 'package:kiwi/kiwi.dart';
import 'package:tutor_flutter_app/core/http/http_client.dart';
import 'package:tutor_flutter_app/data/datasources/remote/account_remote_datasource.dart';
import 'package:tutor_flutter_app/data/repositories/account_repository.dart';
import 'package:tutor_flutter_app/domain/usecases/account_usecase.dart';
import 'package:tutor_flutter_app/presentation/providers/authentication_validator.dart';

part 'injector_config.g.dart';

abstract class InjectorConfig {
  static KiwiContainer? container;

  static void setup() {
    container = KiwiContainer();
    _$InjectorConfig()._configure();
  }

  // ignore: type_annotate_public_apis
  static final resolve = container!.resolve;

  void _configure() {
    _configureValidators();
    _configureUsecases();
    _configureRepositories();
    _configureRemoteDataSources();
    // _configureLocalDataSources();
    _configureCommon();
  }

  // ============ VALIDATORS ============
  @Register.singleton(AutheticationValidator)
  void _configureValidators();

  // ============ USECASES ============
  @Register.singleton(AccountUsecase)
  void _configureUsecases();

  // ============ REPOSITORIES ============
  @Register.singleton(AccountRepository)
  void _configureRepositories();

  // ============ REMOTE DATASOURCES ============
  @Register.singleton(AccountRemoteDatasource)
  void _configureRemoteDataSources();

  // ============ LOCAL DATASOURCES ============
  // @Register.singleton(AccountDatasource)
  // void _configureLocalDataSources();

  // ============ COMMON ============
  @Register.singleton(HttpClient, constructorName: 'setLetTutorHost')
  void _configureCommon();
}
