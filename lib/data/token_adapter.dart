///Mengimpor library firedart dan hive_flutter
import 'package:firedart/firedart.dart';
import 'package:hive_flutter/hive_flutter.dart';

///Mendefinisikan class TokenAdapter yang extends dari TypeAdapter<Token>. TypeAdapter 
///adalah abstract class yang digunakan oleh Hive untuk mengubah objek menjadi bytes dan sebaliknya.
class TokenAdapter extends TypeAdapter<Token> {
  ///Mendefinisikan typeId yang merupakan nomor identifikasi unik untuk tipe data Token.
  @override
  final typeId = 42;

  ///Mendefinisikan method write yang mengambil parameter writer dari tipe BinaryWriter 
  ///dan token dari tipe Token. Method ini akan menulis token ke dalam BinaryWriter dengan menggunakan token.toMap().
  @override
  void write(BinaryWriter writer, Token token) =>
      writer.writeMap(token.toMap());

  ///Mendefinisikan method read yang mengambil parameter reader dari tipe BinaryReader. 
  ///Method ini akan membaca Token dari reader dengan menggunakan Token.fromMap(reader.
  ///readMap().map<String, dynamic>((key, value) => MapEntry<String, dynamic>(key, value))).
  @override
  Token read(BinaryReader reader) =>
      Token.fromMap(reader.readMap().map<String, dynamic>(
          (key, value) => MapEntry<String, dynamic>(key, value)));
}
