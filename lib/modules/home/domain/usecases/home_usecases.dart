import 'package:mi_practical/core/network/network_data_state.dart';
import 'package:mi_practical/di/dependency_injection.dart';
import 'package:mi_practical/modules/home/domain/entities/albums_entity.dart';
import 'package:mi_practical/modules/home/domain/entities/photos_entity.dart';
import 'package:mi_practical/modules/home/domain/repositories/home_repositories.dart';

class HomeUseCase {
  /// Variables
  final repository = sl<HomeRepository>();

  /// Functions
  Future<DataState<List<AlbumsEntity>>> getAlbums() {
    return repository.getAlbumsData();
  }

  Future<DataState<List<PhotosEntity>>> getPhotos({
    required int albumId,
  }) {
    return repository.getPhotosData(albumId: albumId);
  }
}
