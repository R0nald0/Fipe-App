import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../domain/model/marca.dart';

class SearchWidget extends StatelessWidget {
  final List<Marca> marcas;
  final ValueChanged<Marca> onSelectedMarca;
  const SearchWidget({Key? key,required this.marcas ,required this.onSelectedMarca}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("BUSCA buil ${marcas.length}");
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:  8.0, horizontal: 15),
      child: Material(
         borderRadius: BorderRadius.circular(10) ,
        elevation: 10,
        child: TypeAheadField(
             hideOnEmpty: true,
            builder: (context, controller, focusNode) {
              return TextField(
                 focusNode: focusNode,
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    hintText: "Buscar por nome da marca...",
                    labelText: 'Marca.....',
                    labelStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey
                    ),
                    suffixIcon: Icon(Icons.search)
                  ));
            },
            itemBuilder: itemBuilder,
            onSelected: onSelected,
            suggestionsCallback: suggestionsCallback),
      ),
    );
  }

  List<Marca?> suggestionsCallback(String search) {
     if (search.isEmpty) return[];
    return  marcas.where((m) => m.nome.toUpperCase().contains(search.toUpperCase())).toList();
  }

  void onSelected( marca ) => onSelectedMarca(marca);

  Widget itemBuilder(BuildContext context, Marca? marca) {
    
    return ListTile(
      title: Text(marca!.nome),
    );
  }
}
