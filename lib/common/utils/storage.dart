
import 'package:localstorage/localstorage.dart';

import '../values/values.dart';

class StorageUtil {
  static final StorageUtil _singleton = new StorageUtil._internal();
  late LocalStorage _storage;

  factory StorageUtil() {
    return _singleton;
  }

  StorageUtil._internal() {
    _storage = new LocalStorage(STORAGE_MASTER_KEY);
  }

  String getItem(String key) {
    return _storage.getItem(key);
  }

  Future<void> setItem(String key, String val) async {
    await _storage.setItem(key, val);
  }
}