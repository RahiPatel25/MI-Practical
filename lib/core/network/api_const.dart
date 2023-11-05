import 'package:mi_practical/config/enums/server_type.dart';

const ServerType apiServer = ServerType.dev;

class ApiEndPoints {
  /// [ENDPOINTS]
  static const String albums = 'albums';
  static String photos({required int albumId}) => 'photos?albumId=$albumId';
}
