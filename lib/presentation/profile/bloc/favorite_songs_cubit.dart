import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterspotifycloneapp/domain/entities/song/song.dart';
import 'package:flutterspotifycloneapp/domain/usecases/song/get_favorite_songs.dart';
import 'package:flutterspotifycloneapp/presentation/profile/bloc/favorite_songs_state.dart';
import 'package:flutterspotifycloneapp/service_locator.dart';

class FavoriteSongsCubit extends Cubit<FavoriteSongsState> {
  FavoriteSongsCubit() : super(FavoriteSongsLoading());

  List<SongEntity> favoriteSongs = [];

  Future<void> getFavoriteSongs() async {

    var result  = await sl<GetFavoriteSongsUseCase>().call();

    result.fold(
      (isLeft){
        emit(
          FavoriteSongsFailure()
        );
      },
      (isRight){
        favoriteSongs = isRight;
        emit(
          FavoriteSongsLoaded(favoriteSongs: favoriteSongs)
        );
      }
    );
  }

  void removeSong(int index) {
    favoriteSongs.removeAt(index);
    emit(
      FavoriteSongsLoaded(favoriteSongs: favoriteSongs)
    );
  }

}