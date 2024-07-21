import 'package:dartz/dartz.dart';
import 'package:flutterspotifycloneapp/data/models/auth/create_user_req.dart';
import 'package:flutterspotifycloneapp/data/models/auth/signin_user_req.dart';
import 'package:flutterspotifycloneapp/data/sources/auth/auth_firebase_service.dart';
import 'package:flutterspotifycloneapp/domain/repository/auth/auth.dart';
import 'package:flutterspotifycloneapp/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin(SignInUserReq signInUserReq) async {
    return await sl<AuthFirebaseService>().signin(signInUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signup(createUserReq);
  }

  @override
  Future<Either> getUser() async {
    return await sl<AuthFirebaseService>().getUser();
  }

}