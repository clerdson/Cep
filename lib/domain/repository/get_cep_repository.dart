import 'package:cep/data/dto/models.dart';
import 'package:dartz/dartz.dart';

abstract class GetCepRepository {
  Future<Either<Exception, CepDTO>> call(String text);
}
