
class Modelo {
    Modelo({
    required this.codigo,
    required this.nome
  });

  
  final int codigo ;
  final String nome ;
  Modelo copyWith({
    int? codigo,
    String? nome    
  }) {
    return Modelo(
          codigo: codigo ?? this.codigo,
      nome: nome ?? this.nome
    );
  }

  factory Modelo.fromJson(Map<String,dynamic> map){
    return switch(map) {
      {
        "codigo" : int codigo,
        "nome" : String nome
       }=> Modelo(
        codigo: codigo, 
        nome: nome,
        ),
       
       _ => throw ArgumentError("invalid json")
    };
  }
}
