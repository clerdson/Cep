import 'dart:convert';
import 'package:cep/data/datasource/get_cep_datasource.dart';
import 'package:cep/data/dto/models.dart';
import 'package:cep/domain/entities/entity.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class GetCepRemoteDatasourceImp implements GetCepDataSource {
  @override
  Future<Either<Exception, CepEntity>> call(String text) async {
    var url = "https://viacep.com.br/ws/${text}/json/";

    var response = await http.get(Uri.parse(url));
    var decodedJson = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return Right(CepDTO.fromJson(decodedJson));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
