part of 'package:food_recipes/features/domain/remote/country_filter/country_filter_repository.dart';

class CountryFilterRepositoryImpl implements CountryFilterRepository {
  final Dio dio;

  CountryFilterRepositoryImpl({required this.dio});

  @override
  Future<Either<Failure, List<FilterMeals>>> getCountryFilterMeal(String country) async {
    try{
      final response = await dio.get('${AppContants.baseUrl}${Urls.getCountryFilterFood}$country');
      if(response.statusCode == 200) {
        List everyFood = response.data["meals"];
        if(everyFood.isEmpty){
          return const Right([]);
        } else {
          List<FilterMeals> countryMealList = everyFood.map((e) => FilterMeals.fromJson(e))
              .toList();
          return Right(countryMealList);
        }
      } else {
        return Left(ServerError.withDioError(error: response.data).failure);
      }
    } on DioException catch (error, stacktrace) {
      log('Exception occured: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }
}