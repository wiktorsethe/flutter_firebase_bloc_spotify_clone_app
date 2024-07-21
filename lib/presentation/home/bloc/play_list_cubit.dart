import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterspotifycloneapp/domain/usecases/song/get_play_list.dart';
import 'package:flutterspotifycloneapp/presentation/home/bloc/play_list_state.dart';
import 'package:flutterspotifycloneapp/service_locator.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListLoading());

  Future<void> getPlayList() async {
    var returnedSongs = await sl<GetPlayListUseCase>().call();

    returnedSongs.fold(
      (ifLeft) {
        emit(PlayListLoadFailure());
      },
      (data) {
        emit(
          PlayListLoaded(songs: data)
        );
      }
    );
  }
}