import 'package:cep/domain/entities/entity.dart';

extension CepDTO on CepEntity {
  static CepEntity fromJson(Map<String, dynamic> json) {
    return CepEntity(
        cep: json['cep'],
        logradouro: json['logradouro'],
        complemento: json['complemento'],
        bairro: json['bairro'],
        localidade: json['localidade'],
        uf: json['uf'],
        ibge: json['ibge'],
        gia: json['gia'],
        ddd: json['ddd'],
        siafi: json['siafi']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cep'] = this.cep;
    data['logradouro'] = this.logradouro;
    data['complemento'] = this.complemento;
    data['bairro'] = this.bairro;
    data['localidade'] = this.localidade;
    data['uf'] = this.uf;
    data['ibge'] = this.ibge;
    data['gia'] = this.gia;
    data['ddd'] = this.ddd;
    data['siafi'] = this.siafi;
    return data;
  }
}
