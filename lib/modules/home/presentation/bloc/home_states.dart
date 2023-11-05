import 'package:equatable/equatable.dart';
import 'package:mi_practical/modules/home/domain/entities/home_albums_entity.dart';

/// Bloc home states abstract class
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class GetDataInitialState extends HomeState {
  const GetDataInitialState();
}

/// Loading state

class GetDataLoadingState extends HomeState {
  const GetDataLoadingState();
}

/// Success state
class GetDataState extends HomeState with EquatableMixin {
  final List<HomeAlbumsEntity> result;

  const GetDataState(this.result);

  @override
  List<Object?> get props => [result];
}

/// Error state
class GetDataErrorState extends HomeState with EquatableMixin {
  final String message;

  const GetDataErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
