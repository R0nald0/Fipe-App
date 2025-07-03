import 'dart:developer';

import 'package:fipe_app/app/core/app_providers.dart';
import 'package:fipe_app/app/domain/model/marca.dart';
import 'package:fipe_app/app/presentation/features/home/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listMarcas = ref.watch(homePageControllerProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Lista de marcas'),
      ),
      body:SafeArea(
        child: listMarcas.when(
          data: (data) {
            return   Column(
              children: [
                  SearchWidget(marcas:data,onSelectedMarca: (marca) {
                     FocusNode().unfocus();
                     Navigator.of(context).pushNamed("/detail",arguments: marca);
                       ref.read(setmarcaProvider.call(marca));
                  },),
                Expanded(
                  child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                  Marca marca = data[index];
                  return ListTile(
                    title: Text(marca.nome),
                    onTap: () {
                       FocusNode().requestFocus();
                       Navigator.of(context).pushNamed("/detail",arguments: marca);
                       ref.read(setmarcaProvider.call(marca));
                    },
                  );
                            },
                             ),
                ),
              ],
            );
          }, 
          error: (error, stackTrace) {
            log("Erro ao buscar os dados",stackTrace: stackTrace,error: error);
            return Center(child: Text("Não conseguimos buscar os dados"),);
          }, 
          loading: () {
             return Center(
                 child:  LoadingAnimationWidget.bouncingBall(color: Colors.greenAccent, size:80 ),
             );
          },
          ),
      ),
    );
  }
}
