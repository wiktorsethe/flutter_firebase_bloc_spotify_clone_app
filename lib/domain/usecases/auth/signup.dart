import 'package:dartz/dartz.dart';
import 'package:flutterspotifycloneapp/core/usecase/usecase.dart';
import 'package:flutterspotifycloneapp/data/models/auth/create_user_req.dart';
import 'package:flutterspotifycloneapp/domain/repository/auth/auth.dart';
import 'package:flutterspotifycloneapp/service_locator.dart';

class SignupUseCase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq ? params}) async {
    return sl<AuthRepository>().signup(params!);
  }

}