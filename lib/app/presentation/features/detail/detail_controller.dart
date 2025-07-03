import 'dart:developer';

import 'package:fipe_app/app/core/app_providers.dart';
import 'package:fipe_app/app/domain/model/automovel.dart';
import 'package:fipe_app/app/domain/model/marca.dart';
import 'package:fipe_app/app/presentation/features/detail/detail_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'detail_controller.g.dart';

@riverpod
class DetailController extends _$DetailController {
  @override
  DetailState build() {
    final minhaMarca = ref.watch(getMinhMarcaProvider);
    //final a  = await ref.read(getModeloByMarcaPovider(minhaMarca.codigo).future);
    log("ct BUILD");

    return DetailState(marca: minhaMarca, status: DetailStateStatus.initial);
  }

  Future<void> getModelos(Marca marca) async {
    final modelos = await ref.read(fipeRepository).getModelos(marca.codigo);
    log("ct get modelos");
    state = state.copyWith(
      modelos: () => modelos.modelos,
      status: DetailStateStatus.sucesso,
    );
  }

  Future<void> getAnos(String idMarca, String idModelo) async {
    try {
      final anosModelo =
          await ref.read(fipeRepository).getAnos(idMarca, idModelo);
      state = state.copyWith(anos: () => anosModelo);
    } on Exception catch (e, s) {
      AsyncError(e, s);
    }
  }

  Future<void> getAutomovel(String idMarca, String idModelo, String ano) async {
    try {
      final automovel =
          await ref.read(fipeRepository).getAutomovel(idMarca, idModelo, ano);
      state = state.copyWith(
          automovel: () => automovel, status: DetailStateStatus.sucesso);
    } catch (e) {
      state = state.copyWith(status: DetailStateStatus.erro);
    }
  }
}
