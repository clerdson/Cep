// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:cep/data/dto/models.dart';
import 'package:cep/domain/entities/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cep/main.dart';

void main() {
  CepEntity entity = CepEntity(
      cep: '61645060',
      bairro: 'caucaia',
      complemento: 'novo ',
      ddd: 'CE',
      ibge: '',
      gia: 'CE',
      localidade: 'novo',
      logradouro: 'novo',
      siafi: 'CE',
      uf: 'CE');
  test('not null', () {
    expect(entity, isNotNull);
  });
  test('cep is =', () {
    expect(entity.cep, '61645060');
  });
  test('uf is =', () {
    expect(entity.uf, 'CE');
  });
}
