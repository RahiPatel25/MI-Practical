import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageManagerX {
  final _storage = const FlutterSecureStorage();

  IOSOptions _getIOSOptions() => const IOSOptions(
        accountName: AppleOptions.defaultAccountName,
      );

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
        sharedPreferencesName: 'mi_practical',
      );

  /// [CREATE STORAGE]
  Future<void> add({
    required String key,
    required String value,
  }) async {
    try {
      await _storage.write(
        key: key,
        value: value,
        aOptions: _getAndroidOptions(),
        iOptions: _getIOSOptions(),
      );
      debugPrint('Storage key "$key" created successfully');
    } catch (e) {
      debugPrint('Error while add the data in local storage with this key "$key" :- $e');
    }
  }

  /// [READ STORAGE]
  Future<String?> read({
    required String key,
  }) async {
    try {
      final result = await _storage.read(
        key: key,
        aOptions: _getAndroidOptions(),
        iOptions: _getIOSOptions(),
      );
      debugPrint('Read storage key "$key"');
      return result;
    } catch (e) {
      debugPrint('Error while read the data from local storage for "$key" this key :- $e');
      return null;
    }
  }
}
