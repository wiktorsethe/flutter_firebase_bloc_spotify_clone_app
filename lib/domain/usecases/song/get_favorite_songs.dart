import 'package:dartz/dartz.dart';
import 'package:flutterspotifycloneapp/core/usecase/usecase.dart';
import 'package:flutterspotifycloneapp/domain/repository/song/song.dart';
import 'package:flutterspotifycloneapp/service_locator.dart';

class GetFavoriteSongsUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongsRepository>().getUserFavoriteSongs();
  }
}