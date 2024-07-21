import 'package:dartz/dartz.dart';
import 'package:flutterspotifycloneapp/core/usecase/usecase.dart';
import 'package:flutterspotifycloneapp/domain/repository/auth/auth.dart';
import 'package:flutterspotifycloneapp/service_locator.dart';

class GetUserUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<AuthRepository>().getUser();
  }

}