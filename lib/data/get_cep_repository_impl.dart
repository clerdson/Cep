import 'package:cep/data/dto/models.dart';
import 'package:dartz/dartz.dart';

import '../domain/entities/entity.dart';
import '../domain/repository/get_cep_repository.dart';
import 'datasource/get_cep_datasource.dart';

class GetCepRepositoryImp implements GetCepRepository {
  final GetCepDataSource _getCepDataSource;
  GetCepRepositoryImp(this._getCepDataSource);

  @override
  Future<Either<Exception, CepEntity>> call(String text) async {
    return await _getCepDataSource(text);
  }
}
