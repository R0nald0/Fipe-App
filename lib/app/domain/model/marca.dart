
class Marca {
    Marca({
    required this.codigo,
    required this.nome
  });

  
  Marca.empty():this(codigo: "",nome:"");

  final String codigo ;
  final String nome ;
  Marca copyWith({
    String? codigo,
    String? nome    
  }) {
    return Marca(
          codigo: codigo ?? this.codigo,
      nome: nome ?? this.nome
    );
  }

  factory Marca.fromJson(Map<String,dynamic> map){
    return switch(map) {
      {
        "codigo" : String codigo,
        "nome" : String nome
       }=> Marca(
        codigo: codigo, 
        nome: nome,
        ),
       
       _ => throw ArgumentError("invalid json")
    };
  }
}