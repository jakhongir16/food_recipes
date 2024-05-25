part of 'package:food_recipes/features/domain/remote/home_repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final Dio dio;

  HomeRepositoryImpl({required this.dio});

  @override
  Future<Either<Failure, List<AllCategoriesMeals>>> getAllCategoriesFood() async {
    try{
      final response = await dio.get(AppContants.baseUrl + Urls.getAllCategoriesFood);

      if(response.statusCode == 200){
        List allCategories = response.data["categories"];

        if(allCategories.isEmpty){
          return const Right([]);
        } else {
          List<AllCategoriesMeals> categories = allCategories.
          map((e) => AllCategoriesMeals.fromJson(e))
              .toList();
          return Right(categories);
        }
      } else {
        return Left(ServerError.withDioError(error: response.data).failure);
      }
    } on DioException catch (error, stacktrace) {
      log('Exception occured: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }



  @override
  Future<Either<Failure, DetailFood>> getRandomFood() async {
    try{
     final response = await dio.get(AppContants.baseUrl + Urls.getRandomFood);

     if(response.statusCode! >= 200){
       Map<String, dynamic> meals = response.data["meals"][0] as Map<String, dynamic>;
       DetailFood randomFood = DetailFood.fromJson(meals);
       return Right(randomFood);
     } else {
       return Left(ServerError.withDioError(error: response.data).failure);
     }
    } on DioException catch (error, stacktrace) {
      log('Exception occured: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

}