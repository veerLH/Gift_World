import 'package:dio/dio.dart' hide Headers;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zingift/model/product/product_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'http://restaurantpos.tunlinaing.me/api/')

abstract class ApiService{

  factory ApiService(Dio dio,{String baseUrl}) = _ApiService;

  static ApiService create(){
    final dio =Dio ();
    dio.options.headers["Content-Type"] = "application/json";
    dio.interceptors.add(PrettyDioLogger());
    return ApiService(dio);
  }
  @GET("products")
  Future<ProductModel> getproductall();

  @GET("products/{id}")
  Future<ProductModel> getItemDetail(@Path("id") String id);
}