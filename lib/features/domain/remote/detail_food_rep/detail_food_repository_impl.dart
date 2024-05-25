part of 'package:food_recipes/features/domain/remote/detail_food_rep/detail_food_repository.dart';

class DetailFoodRepositoryImpl implements DetailFoodRepository {
  final Dio dio;

  DetailFoodRepositoryImpl({required this.dio});

  @override
  Future<Either<Failure, DetailFood>> getDetailFood(String id) async {
   try{
     final response = await dio.get("${AppContants.baseUrl}${Urls.getDetailFood}$id");

     if(response.statusCode == 200) {
       Map<String, dynamic> detailFood = response.data["meals"][0] as Map<String, dynamic>;
       DetailFood receiveDetailFood = DetailFood.fromJson(detailFood);
       return Right(receiveDetailFood);
     } else {
       return Left(ServerError.withDioError(error: response.data).failure);
     }
   } on DioException catch (error, stacktrace) {
      log('Exception occured: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
   }
  }
}