import 'dart:ffi';

import 'package:cep/data/dto/models.dart';
import 'package:cep/domain/entities/entity.dart';
import 'package:flutter/widgets.dart';
import '../../domain/usecase/get_cep_usecase.dart';

class PoController {
  final GetCepUseCase _getCepUseCase;
  PoController(this._getCepUseCase) {
    fetchData("61645060");
  }
  ValueNotifier<CepEntity> posts = ValueNotifier<CepEntity>(CepEntity(
      cep: '61645060',
      bairro: 'caucaia',
      complemento: 'novo ',
      ddd: 'CE',
      ibge: '',
      gia: 'CE',
      localidade: 'novo',
      logradouro: 'novo',
      siafi: 'CE',
      uf: 'CE'));
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  fetchData(String text) async {
    var result = await _getCepUseCase(text);

    result.fold(
      (error) => debugPrint(error.toString()),
      (success) => posts.value = success,
    );
  }
}
