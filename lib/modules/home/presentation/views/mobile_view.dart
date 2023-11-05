import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_practical/modules/home/domain/entities/photos_entity.dart';
import 'package:mi_practical/modules/home/presentation/bloc/home_bloc.dart';
import 'package:mi_practical/modules/home/presentation/bloc/home_events.dart';
import 'package:mi_practical/modules/home/presentation/bloc/home_states.dart';

class HomeMobileView extends StatelessWidget {
  const HomeMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(GetAlbumsEvent());
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, state) {
        if (state is GetDataInitialState) {
          return const SizedBox();
        } else if (state is GetDataLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetDataState) {
          return ListView.builder(
            itemCount: state.result.length,
            itemBuilder: (context, index) {
              return Container(
                height: 130,
                margin: const EdgeInsets.only(top: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _text(text: state.result[index].albumTitle ?? ''),
                    _listView(context: context, photos: state.result[index].photos ?? []),
                  ],
                ),
              );
            },
          );
        } else if (state is GetDataErrorState) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _text({
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 22.0,
          letterSpacing: 0.5,
          color: Colors.grey[800],
        ),
      ),
    );
  }

  Widget _listView({required BuildContext context, required List<PhotosEntity> photos}) {
    final width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: 90,
      width: width,
      child: ListView.builder(
        itemCount: photos.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 0 : 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                width: width / 3.5,
                imageUrl: photos[index].url ?? '',
                fit: BoxFit.cover,
                errorWidget: (context, url, error) {
                  return const Center(child: Icon(Icons.error));
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
