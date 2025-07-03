import 'dart:convert';

class Automovel {
  final int? tipoVeiculo;
  final String valor;
  final String marca;
  final String modelo;
  final int anoModelo;
  final String combustivel;
  final String codigoFipe;
  final String cmesReferencia;
  final String siglaCombutivel;

  Automovel.empty()
      : this(
          anoModelo: 0,
          cmesReferencia: "",
          codigoFipe: "",
          combustivel: "",
          marca: "",
          modelo: "",
          siglaCombutivel: "",
          valor: "",
        );

  Automovel(
      {this.tipoVeiculo,
      required this.valor,
      required this.marca,
      required this.modelo,
      required this.anoModelo,
      required this.combustivel,
      required this.codigoFipe,
      required this.cmesReferencia,
      required this.siglaCombutivel});

  Map<String, dynamic> toMap() {
    return {
      'TipoVeiculo': tipoVeiculo,
      'valor': valor,
      'marca': marca,
      'modelo': modelo,
      'anoModelo': anoModelo,
      'combustivel': combustivel,
      'codigoFipe': codigoFipe,
      'cmesReferencia': cmesReferencia,
      'siglaCombutivel': siglaCombutivel,
    };
  }

  factory Automovel.fromMap(Map<String, dynamic> map) {
    return switch (map) {
      {
        "TipoVeiculo": final int? tipoVeiculo,
        "Valor": final String valor,
        "Marca": final String marca,
        "Modelo": final String modelo,
        "AnoModelo": final int anoModelo,
        "Combustivel": final String combustivel,
        "CodigoFipe": final String codigoFipe,
        "MesReferencia": final String mesReferencia,
        "SiglaCombustivel": final String siglaCombutivel,
      } =>
        Automovel(
          tipoVeiculo: tipoVeiculo,
          valor: valor,
          marca: marca,
          modelo: modelo,
          anoModelo: anoModelo,
          combustivel: combustivel,
          codigoFipe: codigoFipe,
          cmesReferencia: mesReferencia,
          siglaCombutivel: siglaCombutivel,
        ),
      _ => throw ArgumentError()
    };
  }

  String toJson() => json.encode(toMap());

  factory Automovel.fromJson(String source) =>
      Automovel.fromMap(json.decode(source));

  Automovel copyWith({
    int? tipoVeiculo,
    String? valor,
    String? marca,
    String? modelo,
    int? anoModelo,
    String? combustivel,
    String? codigoFipe,
    String? cmesReferencia,
    String? siglaCombutivel,
  }) {
    return Automovel(
      tipoVeiculo: tipoVeiculo,
      valor: valor ?? this.valor,
      marca: marca ?? this.marca,
      modelo: modelo ?? this.modelo,
      anoModelo: anoModelo ?? this.anoModelo,
      combustivel: combustivel ?? this.combustivel,
      codigoFipe: codigoFipe ?? this.codigoFipe,
      cmesReferencia: cmesReferencia ?? this.cmesReferencia,
      siglaCombutivel: siglaCombutivel ?? this.siglaCombutivel,
    );
  }
}
