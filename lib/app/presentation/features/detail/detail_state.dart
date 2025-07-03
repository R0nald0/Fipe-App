import 'package:flutter/widgets.dart';

import '../../../domain/model/automovel.dart';
import '../../../domain/model/marca.dart';
import '../../../domain/model/modelo.dart';

enum DetailStateStatus{
  initial,erro,sucesso
}

class DetailState {
  final Marca marca;
  final List<Modelo>? modelos;
  final List<Marca>? anos;
  final Automovel? automovel;
  final DetailStateStatus status;

  DetailState.initial({required Marca marca}):this(
    marca: marca,
    status: DetailStateStatus.initial,
    anos: [],
    automovel: Automovel.empty(),
    modelos: []
  );
  DetailState({
    required this.marca,
    required this.status,
    this.modelos,
    this.anos,
    this.automovel,
    
  });

  

  DetailState copyWith({
    Marca? marca,
    ValueGetter<List<Modelo>?>? modelos,
    ValueGetter<List<Marca>?>? anos,
    ValueGetter<Automovel?>? automovel,
    DetailStateStatus? status,
  }) {
    return DetailState(
      marca: marca ?? this.marca,
      modelos: modelos != null ? modelos() : this.modelos,
      anos: anos != null ? anos() : this.anos,
      automovel: automovel != null ? automovel() : this.automovel,
      status: status ?? this.status,
    );
  }
}
