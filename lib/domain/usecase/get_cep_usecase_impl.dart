import 'package:cep/domain/entities/entity.dart';
import 'package:cep/domain/usecase/get_cep_usecase.dart';
import 'package:cep/data/dto/models.dart';
import 'package:dartz/dartz.dart';
import '../repository/get_cep_repository.dart';

class GetCepUseCaseImp implements GetCepUseCase {
  final GetCepRepository _getCepRepository;
  GetCepUseCaseImp(this._getCepRepository);

  @override
  Future<Either<Exception, CepEntity>> call(String text) async {
    return await _getCepRepository(text);
  }
}
