import 'package:cep/domain/usecase/get_cep_usecase_impl.dart';
import 'package:cep/presentation/controllers/controller_home_page.dart';
import 'package:get_it/get_it.dart';

import 'data/datasource/get_cep_datasource.dart';
import 'data/datasource/get_cep_remote_datasource.dart';
import 'data/get_cep_repository_impl.dart';
import 'domain/repository/get_cep_repository.dart';
import 'domain/usecase/get_cep_usecase.dart';

class Inject {
  static initialize() {
    GetIt getIt = GetIt.instance;
    // core

    // datasources
    getIt.registerLazySingleton<GetCepDataSource>(
      () => GetCepRemoteDatasourceImp(),
    );
    // repositories
    getIt.registerLazySingleton<GetCepRepository>(
      () => GetCepRepositoryImp(getIt()),
    );
    // usecases
    getIt.registerLazySingleton<GetCepUseCase>(
      () => GetCepUseCaseImp(getIt()),
    );
    // controllers
    getIt.registerLazySingleton<PoController>(
      () => PoController(getIt()),
    );
  }
}
