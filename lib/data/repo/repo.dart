
import 'package:dio/dio.dart';
import 'package:shop_app/data/remote/dio_helper.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/resoruces/constants.dart';

class Repo{
  late DioHelper dio;

  static final Repo instance = Repo.internal();

  factory Repo(){
    return  instance;
  }

  Repo.internal(){
    dio = DioHelper();
  }

  Future<Response> login(String email,String password)async{
    return await dio.postData(url: Constants.loginUrl, data: {
      'email':email,
      'password':password
    });
  }

  Future<HomeModel> getHomeData(token)async{
    Response response = await dio.getData(url: Constants.homeUrl,token: token);

    return HomeModel.fromJson(response.data);
  }

}