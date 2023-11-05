import 'package:mi_practical/core/network/network_data_state.dart';
import 'package:mi_practical/core/print/debug_print.dart';
import 'package:mi_practical/di/dependency_injection.dart';
import 'package:mi_practical/modules/home/data/datasources/home_datasource.dart';
import 'package:mi_practical/modules/home/data/models/albums_model.dart';
import 'package:mi_practical/modules/home/data/models/photos_model.dart';
import 'package:mi_practical/modules/home/domain/entities/albums_entity.dart';
import 'package:mi_practical/modules/home/domain/entities/photos_entity.dart';
import 'package:mi_practical/modules/home/domain/repositories/home_repositories.dart';

class HomeRepositoryImpl implements HomeRepository {
  /// Variables
  final apiService = sl<HomeDataSources>();
  final print = sl<PrintX>();

  /// Functions
  @override
  Future<DataState<List<AlbumsEntity>>> getAlbumsData() async {
    try {
      final albumsResponse = await apiService.getAlbumsData();

      final List<AlbumsEntity> albums = albumsResponse.map((e) => e.toAlbumsEntity).toList();
      return Success(albums);
    } catch (e) {
      print.error('Exception :- $e');
      return Failure(Exception());
    }
  }

  @override
  Future<DataState<List<PhotosEntity>>> getPhotosData({
    required int albumId,
  }) async {
    try {
      final photosResponse = await apiService.getPhotosData(albumId:albumId );

      final List<PhotosEntity> photos = photosResponse.map((e) => e.toPhotosEntity).toList();
      return Success(photos);
    } catch (e) {
      print.error('Exception :- $e');
      return Failure(Exception());
    }
  }
}
