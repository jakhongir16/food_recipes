part of 'package:food_recipes/features/domain/remote/all_ingredients_repo/all_ingredients_repository.dart';

class AllIngredientsRepositoryImpl implements AllIngredientsRepository {
  AllIngredientsRepositoryImpl({required this.dio});
  final Dio dio;

  @override
  Future<Either<Failure, List<AllIngredients>>> obtainAllIngredients() async {
    try{
      final response = await dio.get('${AppContants.baseUrl}${Urls.getAllIngredient}');

      if(response.statusCode == 200){
        List allIngredients = response.data["meals"];

        if(allIngredients.isEmpty){
          return const Right([]);
        } else {
          List<AllIngredients> ingredients = allIngredients
          .map((e) => AllIngredients.fromJson(e)).toList();
          return Right(ingredients);
        }
      } else {
        return Left(ServerError.withDioError(error: response.data).failure);
      }
    } on DioException catch (error, stackTrace) {
      log('Exception occured: $error stacktrace: $stackTrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

}