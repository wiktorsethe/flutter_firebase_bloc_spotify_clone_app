import 'package:dartz/dartz.dart';
import 'package:flutterspotifycloneapp/core/usecase/usecase.dart';
import 'package:flutterspotifycloneapp/domain/repository/song/song.dart';
import 'package:flutterspotifycloneapp/service_locator.dart';

class AddOrRemoveFavoriteSongUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String ? params}) async {
    return await sl<SongsRepository>().addOrRemoveFavoriteSongs(params!);
  }
}