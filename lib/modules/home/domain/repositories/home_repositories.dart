import 'package:mi_practical/core/network/network_data_state.dart';
import 'package:mi_practical/modules/home/domain/entities/albums_entity.dart';
import 'package:mi_practical/modules/home/domain/entities/photos_entity.dart';

abstract class HomeRepository {
  Future<DataState<List<AlbumsEntity>>> getAlbumsData();
  Future<DataState<List<PhotosEntity>>> getPhotosData({required int albumId});
}
