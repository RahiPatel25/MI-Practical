import 'package:mi_practical/config/enums/server_request_type.dart';
import 'package:mi_practical/core/network/api_const.dart';
import 'package:mi_practical/core/network/api_service.dart';
import 'package:mi_practical/di/dependency_injection.dart';
import 'package:mi_practical/modules/home/data/models/albums_model.dart';
import 'package:mi_practical/modules/home/data/models/photos_model.dart';

abstract class HomeDataSources {
  Future<List<AlbumsModel>> getAlbumsData();
  Future<List<PhotosModel>> getPhotosData({required int albumId});
}

class HomeDataSourcesImpl implements HomeDataSources {
  /// Variables
  final apiService = sl<ApiService>();

  /// Functions
  @override
  Future<List<AlbumsModel>> getAlbumsData() async {
    return await apiService.apiService(
      urlPath: ApiEndPoints.albums,
      fun: albumsModelFromJson,
      type: ServerRequestType.get,
    );
  }

  @override
  Future<List<PhotosModel>> getPhotosData({
    required int albumId,
  }) async {
    return await apiService.apiService(
      urlPath: ApiEndPoints.photos(albumId: albumId),
      fun: photosModelFromJson,
      type: ServerRequestType.get,
    );
  }
}
