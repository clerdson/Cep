import 'package:cep/data/dto/models.dart';
import 'package:cep/domain/entities/entity.dart';
import 'package:dartz/dartz.dart';

abstract class GetCepRepository {
  Future<Either<Exception, CepEntity>> call(String text);
}
