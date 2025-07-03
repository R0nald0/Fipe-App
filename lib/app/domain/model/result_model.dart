import 'package:fipe_app/app/domain/model/marca.dart';
import 'package:fipe_app/app/domain/model/modelo.dart';

class ResultModel {
    ResultModel({
    required this.modelos,
    required this.anosModelo
  });
  
  ResultModel.emppty():this(anosModelo: [],modelos: []);

  final List<Modelo> modelos;
  final List<Marca> anosModelo;

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      modelos: (json['modelos'] as List).map((e) => Modelo.fromJson(e)).toList(),
      anosModelo: (json['anos'] as List).map((e) => Marca.fromJson(e)).toList(),

    );
  }

 /*  factory ResultModel.fromJson(Map<String, dynamic> map) {
    return switch (map) {
      {
        "modelos": List<Map<String, dynamic>> modelos,
        "anos": List<Map<String, dynamic>> anos,
      } =>
        ResultModel(
            modelos: modelos.map<Marca>((m) => Marca.fromJson(m)).toList(),
            anos: anos.map<Marca>((a) => Marca.fromJson(a)).toList()),
      _ => throw ArgumentError()
    };
  } */
  ResultModel copyWith({
    List<Modelo>? modelos,
    List<Marca>? anosModelo    
  }) {
    return ResultModel(
          modelos: modelos ?? this.modelos,
      anosModelo: anosModelo ?? this.anosModelo
    );
  }
}
