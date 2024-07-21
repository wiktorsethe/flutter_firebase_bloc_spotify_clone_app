import 'package:dartz/dartz.dart';
import 'package:flutterspotifycloneapp/core/usecase/usecase.dart';
import 'package:flutterspotifycloneapp/data/models/auth/signin_user_req.dart';
import 'package:flutterspotifycloneapp/domain/repository/auth/auth.dart';
import 'package:flutterspotifycloneapp/service_locator.dart';

class SigninUseCase implements UseCase<Either, SignInUserReq> {
  @override
  Future<Either> call({SignInUserReq ? params}) async {
    return sl<AuthRepository>().signin(params!);
  }

}