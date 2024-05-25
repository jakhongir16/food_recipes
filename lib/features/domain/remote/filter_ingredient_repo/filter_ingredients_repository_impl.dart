part of 'filter_ingredients_repository.dart';


class FilterIngredientsRepositoryImpl implements FilterIngredientsRepository {
   final Dio dio;

   const FilterIngredientsRepositoryImpl({required this.dio});

  @override
  Future<Either<Failure, List<FilterMeals>>> filterIngredient(String ingredient) async {
    try {
       final response = await dio.get("${AppContants.baseUrl}${Urls.getIngredientFilterFood}$ingredient");

       if(response.statusCode == 200){
          List allMeals = response.data["meals"];

          if(allMeals.isEmpty){
             return const Right([]);
          } else {
             List<FilterMeals> allFilterMeals = allMeals.map((e) => FilterMeals.fromJson(e))
                 .toList();
             return Right(allFilterMeals);
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