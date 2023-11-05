import 'package:mi_practical/config/enums/server_type.dart';

extension ServerTypeExt on ServerType {
  String get baseUrl {
    switch (this) {
      case ServerType.dev:
        return 'https://jsonplaceholder.typicode.com/';
      default:
        return 'https://jsonplaceholder.typicode.com/';
    }
  }
}
