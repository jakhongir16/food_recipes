part of 'package:food_recipes/features/domain/remote/food_country_repository/food_country_repository.dart';


class FoodCountryRepositoryImpl implements FoodCountryRepository {
  final Dio dio;
  FoodCountryRepositoryImpl({required this.dio});

  @override
  Future<Either<Failure, List<MealCountry>>> getMealCountry() async {
    try{
      final response = await dio.get(AppContants.baseUrl + Urls.getFoodCountry);

      if(response.statusCode == 200){
        List allCountry = response.data["meals"];

        if(allCountry.isEmpty){
          return const Right([]);
        } else {
          List<MealCountry> countryMeal = allCountry.map((e) => MealCountry.fromJson(e))
              .toList();
          return Right(countryMeal);
        }
      } else {
        return Left(ServerError.withDioError(error: response.data).failure);
      }
    } on DioException catch (error, stacktrace) {
      log('Exception occured: $error, stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }


}