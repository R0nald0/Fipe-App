import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fipe_app/app/domain/model/automovel.dart';
import 'package:fipe_app/app/domain/model/marca.dart';
import 'package:fipe_app/app/domain/model/result_model.dart';

class FipeRepository {
  late final Dio _dio ;
  static const BASE_URL = "https://parallelum.com.br/fipe/api/v1";
  
  FipeRepository(){
    _dio = Dio()..interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      )
    ]);
  }  

  Future<List<Marca>> getMarcas() async {
    try {
       final Response(data: List results) =
          await _dio.get("$BASE_URL/carros/marcas");

      return results.map<Marca>((m) => Marca.fromJson(m)).toList(); 
     // return  marcasCarroMock.map((m) => Marca.fromJson(m) ).toList();
    } on DioException catch (e, s) {
      log("Erro ao buscarmarcas", error: e, stackTrace: s);
      throw Exception("Erro ao buscas marcas");
    }
  }

  Future<ResultModel> getModelos(String codigo) async {
    try {
       final Response(:data) =
          await _dio.get("$BASE_URL/carros/marcas/$codigo/modelos");
      
       return ResultModel.fromJson(data);    
       /*  final mapResult = {
          "modelos" : modelosChevroletMock,
          "anos" : anosOnixMock
        } ;
     return   Future.value(ResultModel.fromJson(mapResult)); */
       
    } on DioException catch (e,s) {
        log("Erro ao buscar modelos" , error: e,stackTrace: s);
        throw Exception("Erro ao buscas modelos");
      } on ArgumentError catch (e,s){
         log("Json Inválido" , error: e,stackTrace: s);
        throw Exception("Json Invalido");
      }
  }
  Future<List<Marca>> getAnos(String idMarca,String idModelo) async {
    try {
       final Response(data : List result) =
          await _dio.get("$BASE_URL/carros/marcas/$idMarca/modelos/$idModelo/anos");
       
       return result.map<Marca>((a) => Marca.fromJson(a)).toList();  
       
      // return anosOnixMock.map<Marca>((a) => Marca.fromJson(a)).toList();
       
    } on DioException catch (e,s) {
        log("Erro ao buscar modelos" , error: e,stackTrace: s);
        throw Exception("Erro ao buscas modelos");
      } on ArgumentError catch (e,s){
         log("Json Inválido" , error: e,stackTrace: s);
        throw Exception("Json Invalido");
      }
  }
  Future<Automovel> getAutomovel(String idMarca,String idModelo,String ano) async{
    try {
    final Response(data : automovel)  = await _dio.get("$BASE_URL/carros/marcas/$idMarca/modelos/$idModelo/anos/$ano");

       return Automovel.fromMap(automovel);
    } on DioException catch (e,s) {
        log("Erro ao buscar modelos" , error: e,stackTrace: s);
        throw Exception("Erro ao buscas modelos");
      } on ArgumentError catch (e,s){
         log("Json Inválido" , error: e,stackTrace: s);
        throw Exception("Json Invalido");
      }
  }
}


// fipe_mock_data.dart

final List<Map<String, String>> marcasCarroMock = [
  {"nome": "Chevrolet", "codigo": "1"},
  {"nome": "Volkswagen", "codigo": "2"},
  {"nome": "Fiat", "codigo": "3"},
  {"nome": "Ford", "codigo": "4"},
];

final List<Map<String, dynamic>> modelosChevroletMock = [
  {"nome": "Onix", "codigo": 1001},
  {"nome": "Cruze", "codigo": 1002},
  {"nome": "S10", "codigo": 1003},
];

final List<Map<String, String>> anosOnixMock = [
  {"nome": "2023 Gasolina", "codigo": "2023-1"},
  {"nome": "2022 Flex", "codigo": "2022-2"},
  {"nome": "2021 Flex", "codigo": "2021-2"},
];

final Map<String, dynamic> veiculoOnix2023Mock = {
  "Valor": "R\$ 78.000,00",
  "Marca": "Chevrolet",
  "Modelo": "Onix",
  "AnoModelo": 2023,
  "Combustivel": "Gasolina",
  "CodigoFipe": "004325-2",
  "MesReferencia": "junho de 2025",
  "TipoVeiculo": 1,
  "SiglaCombustivel": "G",
};
