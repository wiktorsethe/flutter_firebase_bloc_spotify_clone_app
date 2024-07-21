import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterspotifycloneapp/domain/usecases/song/get_news_songs.dart';
import 'package:flutterspotifycloneapp/presentation/home/bloc/news_songs_state.dart';
import 'package:flutterspotifycloneapp/service_locator.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewsSongs() async {
    var returnedSongs = await sl<GetNewsSongsUseCase>().call();

    returnedSongs.fold(
        (ifLeft) {
          emit(NewsSongsLoadFailure());
        },
        (data) {
          emit(
            NewsSongsLoaded(songs: data)
          );
        }
    );
  }
}