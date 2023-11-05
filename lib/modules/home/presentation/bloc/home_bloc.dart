import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_practical/core/local_storage/local_storage.dart';
import 'package:mi_practical/core/network/api_const.dart';
import 'package:mi_practical/core/network/network_data_state.dart';
import 'package:mi_practical/di/dependency_injection.dart';
import 'package:mi_practical/modules/home/domain/entities/home_albums_entity.dart';
import 'package:mi_practical/modules/home/domain/entities/photos_entity.dart';
import 'package:mi_practical/modules/home/domain/usecases/home_usecases.dart';
import 'package:mi_practical/modules/home/presentation/bloc/home_events.dart';
import 'package:mi_practical/modules/home/presentation/bloc/home_states.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _homeUseCase = sl<HomeUseCase>();

  HomeBloc() : super(const GetDataInitialState()) {
    on<GetAlbumsEvent>(getAlbumsData);
  }
  void getAlbumsData(GetAlbumsEvent event, Emitter<HomeState> emit) async {
    /// [Variables]
    final localStorageManagerX = sl<LocalStorageManagerX>();
    final localStorageData = await localStorageManagerX.read(key: ApiEndPoints.albums);

    if (localStorageData != null) {
      final localStorageAlbums = jsonDecode(localStorageData);
      final List<HomeAlbumsEntity> resut = homeAlbumsEntityFromJson(localStorageAlbums);

      emit(GetDataState(resut));
    } else {
      emit(const GetDataLoadingState());
    }

    /// [Usecase]
    final albumsState = await _homeUseCase.getAlbums();

    /// [Success]
    if (albumsState is Success) {
      List<HomeAlbumsEntity> homeAlbumsEntity = [];
      for (var i = 0; i < 4; i++) {
        final photosState = await _homeUseCase.getPhotos(albumId: albumsState.data?[i].id ?? 1);
        if (photosState is Success) {
          homeAlbumsEntity.add(
            HomeAlbumsEntity(
              albumTitle: albumsState.data?[i].title,
              photos: List.generate(
                photosState.data?.length ?? 0,
                (index) => photosState.data?[index % 3] ?? const PhotosEntity(),
              ),
            ),
          );
        }
        if (photosState is Failure) emit(GetDataErrorState(photosState.error.toString()));
      }

      List<HomeAlbumsEntity> albumList = List.generate(
        albumsState.data?.length ?? 0,
        (index) => homeAlbumsEntity[index % 4],
      );

      if (localStorageData == null) {
        /// Store data into local storage for cache
        localStorageManagerX.add(key: ApiEndPoints.albums, value: jsonEncode(homeAlbumsEntityToJson(albumList)));
      }

      emit(GetDataState(albumList));
    }

    /// [Error]
    if (albumsState is Failure) emit(GetDataErrorState(albumsState.error.toString()));
  }
}
