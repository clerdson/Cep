import 'package:cep/data/dto/models.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/entity.dart';

abstract class GetCepDataSource {
  Future<Either<Exception, CepEntity>> call(String text);
}
