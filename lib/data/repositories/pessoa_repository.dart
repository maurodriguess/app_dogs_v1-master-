import 'package:app_dogs/data/models/pessoa_model.dart';
import 'package:sqflite/sqflite.dart';
import '../../core/database_helper.dart';

class PessoaRepository {
  Future<void> insertPessoa(Pessoa pessoa) async {
    final db = await DatabaseHelper.initDb();
    await db.insert(
      'pessoas',
      pessoa.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Pessoa>> getPessoas() async {
    final db = await DatabaseHelper.initDb();
    final List<Map<String, Object?>> pessoaMaps = await db.query('pessoas');
    return pessoaMaps.map((map) {
      return Pessoa(
          id: map['id'] as int,
          name: map['name'] as String, 
          telefone: map['telefone'] as String, 
          email: map['email'] as String,
          enderecoAvRua: map['enderecoAvRua'] as String,
          enderecoNumero: map['enderecoNumero'] as String, 
          enderecoCep: map['enderecoCep'] as String, 
          enderecoCidade: map['enderecoCidade'] as String, 
          enderecoEstado: map['enderecoEstado'] as String );
    }).toList();
  }

  Future<void> updatePessoa(Pessoa pessoa) async {
    final db = await DatabaseHelper.initDb();
    await db.update(
      'pessoas',
      pessoa.toMap(),
      where: 'id = ?',
      whereArgs: [pessoa.id],
    );
  }

  Future<void> deletePessoa(int id) async {
    final db = await DatabaseHelper.initDb();
    await db.delete(
      'pessoas',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
