import 'package:kiwi/kiwi.dart';
import 'package:tutor_flutter_app/core/http/http_client.dart';
import 'package:tutor_flutter_app/data/datasources/local/account_local_datasource.dart';
import 'package:tutor_flutter_app/data/datasources/remote/account_remote_datasource.dart';
import 'package:tutor_flutter_app/data/datasources/remote/course_remote_datasource.dart';
import 'package:tutor_flutter_app/data/datasources/remote/history_remote_datasource.dart';
import 'package:tutor_flutter_app/data/datasources/remote/past_history_remote_datasource.dart';
import 'package:tutor_flutter_app/data/datasources/remote/tutor_remote_datasource.dart';
import 'package:tutor_flutter_app/data/repositories/account_repository.dart';
import 'package:tutor_flutter_app/data/repositories/course_repository.dart';
import 'package:tutor_flutter_app/data/repositories/history_repository.dart';
import 'package:tutor_flutter_app/data/repositories/past_history_repository.dart';
import 'package:tutor_flutter_app/data/repositories/tutor_repository.dart';
import 'package:tutor_flutter_app/domain/usecases/account_usecase.dart';
import 'package:tutor_flutter_app/domain/usecases/course_usecase.dart';
import 'package:tutor_flutter_app/domain/usecases/history_usecase.dart';
import 'package:tutor_flutter_app/domain/usecases/past_history_usecase.dart';
import 'package:tutor_flutter_app/domain/usecases/tutor_usecase.dart';
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
    _configureLocalDataSources();
    _configureCommon();
  }

  // ============ VALIDATORS ============
  @Register.singleton(AutheticationValidator)
  void _configureValidators();

  // ============ USECASES ============
  @Register.singleton(AccountUsecase)
  @Register.singleton(TutorUsecase)
  @Register.singleton(HistoryUsecase)
  @Register.singleton(PastHistoryUsecase)
  @Register.singleton(CourseUsecase)
  void _configureUsecases();

  // ============ REPOSITORIES ============
  @Register.singleton(AccountRepository)
  @Register.singleton(TutorRepository)
  @Register.singleton(HistoryRepository)
  @Register.singleton(PastHistoryRepository)
  @Register.singleton(CourseRepository)
  void _configureRepositories();

  // ============ REMOTE DATASOURCES ============
  @Register.singleton(AccountRemoteDatasource)
  @Register.singleton(TutorRemoteDatasource)
  @Register.singleton(HistoryRemoteDatasource)
  @Register.singleton(PastHistoryRemoteDatasource)
  @Register.singleton(CourseRemoteDatasource)
  void _configureRemoteDataSources();

  // ============ LOCAL DATASOURCES ============
  @Register.singleton(AccountLocalDatasource)
  void _configureLocalDataSources();

  // ============ COMMON ============
  @Register.singleton(HttpClient, constructorName: 'setLetTutorHost')
  void _configureCommon();
}
