import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_google_authentications/core/env_service.dart';
import 'package:firebase_google_authentications/modules/explore/model/wallpaper_response_model.dart';

class ExploreRemoteService {
  final _client =Dio(
    BaseOptions(
      headers: {
        'Authorization':EnvService.ApiKey,
      },
    ),
  );

  Future<Either<String,WallpaperResponseModel>> getWallpapers()async{
    try {
  final response =await _client.get(
    "https://api.pexels.com/v1/curated",
    queryParameters: {
      "page":1,
      "per_page" :15,
    },
    );
    log(response.statusCode.toString());
    if(response.statusCode==200){
      final result= WallpaperResponseModel.fromMap(response.data);
      return Right(result);
    }
    return const Left("something went wrong");
} on DioException catch (e) {
  return Left(e.message?? "Something went wrong");
}
}


}