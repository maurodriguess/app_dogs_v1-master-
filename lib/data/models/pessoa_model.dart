class Pessoa {
  final int? id; // Permite ser null
  final String name;
  final String telefone;
  final String email;
  final String enderecoAvRua;
  final String enderecoNumero;
  final String enderecoCep;
  final String enderecoCidade;
  final String enderecoEstado;


  Pessoa({this.id,
  required this.name, 
  required this.telefone,
  required this.email,
  required this.enderecoAvRua,
  required this.enderecoNumero,
  required this.enderecoCep,
  required this.enderecoCidade,
  required this.enderecoEstado 
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'telefone': telefone,
      'email': email,
      'enderecoAvRua': enderecoAvRua,
      'enderecoNumero': enderecoNumero,
      'enderecoCep': enderecoCep,
      'enderecoCidade': enderecoCidade,
      'enderecoEstado': enderecoEstado,
    };
  }
}
