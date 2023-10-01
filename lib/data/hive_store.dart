///Package firedart/auth/token_store.dart adalah package yang berisi fungsi-fungsi untuk melakukan autentikasi menggunakan Firebase. 
///Sedangkan hive_flutter/adapters.dart adalah package yang berisi adapter untuk menghubungkan aplikasi dengan database lokal Hive, 
///yang biasanya digunakan untuk menyimpan data aplikasi secara lokal pada perangkat pengguna
import 'package:firedart/auth/token_store.dart';
import 'package:hive_flutter/adapters.dart';

///Mendefinisikan class HiveStore yang merupakan turunan dari class TokenStore.
class HiveStore extends TokenStore {
  ///Mendeklarasikan konstanta keyToken dengan nilai "auth_token" yang digunakan sebagai kunci 
  ///untuk menyimpan token autentikasi di dalam database lokal Hive
  static const keyToken = "auth_token";
  ///Mendeklarasikan field _box yang bertipe Box. Field ini akan digunakan 
  ///untuk menyimpan instance dari database lokal Hive.
  final Box _box;
  ///Mendefinisikan constructor HiveStore._internal yang menerima parameter Box 
  ///dan digunakan untuk membuat instance dari HiveStore.
  HiveStore._internal(this._box);

  ///Mendefinisikan method create() yang merupakan static method dan bertipe Future<HiveStore>. 
  ///Method ini digunakan untuk membuat instance dari HiveStore dan membuka database lokal Hive.
  static Future<HiveStore> create() async {
    /// Membuka sebuah Box pada database lokal Hive dengan nama "auth_store". 
    /// Kita juga menentukan compactionStrategy yang digunakan untuk melakukan kompaksi 
    /// pada database lokal jika jumlah data yang sudah dihapus melebihi 50 entri. Selanjutnya, 
    /// kita mengembalikan instance dari HiveStore yang telah dibuat menggunakan parameter Box yang baru saja dibuka.
    var box = await Hive.openBox("auth_store",
        compactionStrategy: (entries, deletedEntries) => deletedEntries > 50);
    return HiveStore._internal(box);
  }

  @override
  ///Mendefinisikan method delete() yang digunakan untuk menghapus token autentikasi dari database lokal Hive.
  void delete() {
    ///Menghapus token autentikasi dari database lokal Hive menggunakan kunci keyToken.
    _box.delete(keyToken);
  }

  @override
  ///Mendefinisikan method read() yang digunakan untuk membaca token autentikasi dari database lokal Hive.
  Token? read() {
    return _box.get(keyToken);
  }

  @override
  ///Mendefinisikan method write() yang digunakan untuk menulis token autentikasi ke dalam database lokal Hive.
  void write(Token? token) {
    _box.put(keyToken, token);
  }
}
