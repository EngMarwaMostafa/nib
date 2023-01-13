import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../api/api/repo/auth_repo.dart';
import '../models/response_model.dart';

class AuthController extends GetxController implements GetxService{
  final AuthRepo authRepo;
  AuthController({
    required this.authRepo
  });

  bool _isLoading=false;
  bool get isLoading=>_isLoading;

  Future<ResponseModel> registration(String name,String email,String password)async{
    _isLoading=true;
    update();
    Response response=await authRepo.registration(name, email, password);
    late ResponseModel responseModel;
    if(response.statusCode==200){
      authRepo.saveUserToken(response.body['token']);
      responseModel=ResponseModel(true, response.body['token']);
    }else{
      responseModel=ResponseModel(false, response.statusText!);
    }
    _isLoading=true;
    update();
    return responseModel;
  }

  Future<ResponseModel>login(String email, String password)async{
    _isLoading=true;
    update();
    Response response=await authRepo.login(email,password);
    late ResponseModel responseModel;
    if(response.statusCode==200){
      print('Backend token');
      authRepo.saveUserToken(response.body['token']);
      print(response.body['token'].toString());
      responseModel = ResponseModel(true,response.body['token']);
    }else{
      responseModel = ResponseModel(false,response.statusText!);
    }
    _isLoading = true;
    update();
    return responseModel;
  }

  void saveUserEmailAndPassword(String name,String email,String password){
    authRepo.saveUserEmailAndPassword(name, email, password);
  }

  bool userLoggedIn(){
    return authRepo.userLoggedIn();
  }

  bool clearSharedData(){
    return authRepo.clearSharedData();
  }
}