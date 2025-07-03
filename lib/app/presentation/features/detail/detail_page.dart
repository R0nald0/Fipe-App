import 'dart:developer';

import 'package:fipe_app/app/domain/model/marca.dart';
import 'package:fipe_app/app/presentation/features/detail/detail_controller.dart';
import 'package:fipe_app/app/presentation/features/detail/detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var modelo = 0;
    var anoModelo = "";
    var sizeOf = MediaQuery.sizeOf(context);
    final marca = ModalRoute.of(context)?.settings.arguments as Marca;
    final deatilController = ref.watch(detailControllerProvider.notifier);
    deatilController.getModelos(marca);

    log("Retona BUILD");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(marca.nome),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 22),
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer(
                builder: (context, reff, child) {
                  final DetailState(:modelos) =
                      reff.watch(detailControllerProvider);
                  return DropdownMenu(
                    width: double.infinity,
                    menuHeight: (modelos?.length ?? 0) * 55.0,
                    onSelected: (value) {
                      modelo = value as int;
                      deatilController.getAnos(
                          marca.codigo, modelo.toString());
                      log("MINHA modelo $modelo");
                    },
                    label: Text("Escolha um o Modelo"),
                    menuStyle: MenuStyle(
                      fixedSize: WidgetStatePropertyAll(Size(400, 400)),
                    ),
                    dropdownMenuEntries: modelos != null
                        ? modelos
                            .map(
                              (m) => DropdownMenuEntry(
                                value: m.codigo,
                                label: m.nome,
                              ),
                            )
                            .toList()
                        : [],
                  );
                },
              ),
              Consumer(
                builder: (context, reff, child) {
                  final anos = reff.watch(detailControllerProvider);
                  return Offstage(
                    offstage: modelo == 0,
                    child: anos.anos != null
                        ? DropdownMenu(
                            width: double.infinity,
                            menuHeight: (anos.anos?.length ?? 0) * 55.0,
                            onSelected: (value) {
                              anoModelo = value ?? "";
                              log("MINHA modelo $anoModelo");
                              deatilController.getAutomovel(
                                  marca.codigo, modelo.toString(), anoModelo);
                            },
                            label: Text("Escolha o Ano"),
                            menuStyle: MenuStyle(
                              fixedSize: WidgetStatePropertyAll(
                                  Size.fromHeight(400)),
                            ),
                            dropdownMenuEntries: anos.anos!
                                .map(
                                  (a) => DropdownMenuEntry(
                                    value: a.codigo,
                                    label: a.nome,
                                  ),
                                )
                                .toList(),
                          )
                        : SizedBox.shrink(),
                  );
                },
              ),
              SizedBox(
                height: 25,
              ),
              Consumer(
                builder: (context, reff, child) {
                  final DetailState(:automovel) = reff.watch(detailControllerProvider);
                  return Offstage(
                    offstage: anoModelo.isEmpty,
                    child: AnimatedOpacity(
                      duration: Duration(seconds: 1),
                      opacity: anoModelo.isEmpty ? 0 : 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Preço do veículo na Tabela Fipe",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Table(
                            columnWidths: {0: FixedColumnWidth(180)},
                            border: TableBorder.all(color: Colors.black),
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            children: [
                              rowTable("Valor",automovel?.valor ?? "desconhecido"),
                              rowTable("Marca",automovel?.marca ?? "desconhecido" ),
                              rowTable("Modelo",automovel?.modelo ?? "desconhecido"),
                              rowTable("Ano do Modelo",automovel?.anoModelo.toString() ?? "desconhecido"),
                              rowTable("Combústitivel",automovel?.combustivel ?? "desconhecido"),
                              rowTable("Codigo Fipe",automovel?.codigoFipe ?? "desconhecido"),
                              rowTable("Mês de Referência",automovel?.cmesReferencia ?? "desconhecido"),                       
                              rowTable("Sígla do Combústitivel",automovel?.siglaCombutivel ?? "desconhecido"),                       
                              ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  TableRow rowTable(String label,String value) {
    return TableRow(
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 172, 14, 14))),
      children: [
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              value,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
          ),
        )
      ],
    );
  }
}
