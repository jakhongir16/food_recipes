import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/constants/app_themes/app_images.dart';
import 'package:food_recipes/constants/app_themes/app_style.dart';
import 'package:food_recipes/features/presentation/bloc/home/home_bloc.dart';
import 'package:food_recipes/features/presentation/pages/home/widgets/cooking_idea.dart';
import 'package:food_recipes/features/presentation/pages/home/widgets/shimmer_widget.dart';

import '../../../../constants/app_themes/app_colors.dart';
import 'widgets/container_filter.dart';
import 'widgets/cooking_idea_pattern.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FOOD RECIPES",
          style: AppTextStyle.appBarStyle,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            onPressed: (){
              context.read<HomeBloc>().add(HomeCookingIdeaEvent());
            },
            icon: const Icon(
            Icons.refresh,
            color: AppColors.darkBlackColors,
          )
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2),
          child: Container(
            color: AppColors.darkBlackColors,
            height: 2,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                      flex: 1,
                      child: ContainerFilter(
                        width: width,
                        assetName: AppImages.bgCountry,
                        iconData: Icons.flag,
                        title: "Food by Country",
                        navigate: () => Navigator.pushNamed(context, "/foodCountryPage"),
                      ),
                  ),
                  const SizedBox(width: 20,),
                  Flexible(
                      flex: 1,
                      child: ContainerFilter(
                        width: width,
                        assetName: AppImages.bgIngredients,
                        iconData: Icons.food_bank,
                        title: "Food by Ingredients",
                        navigate: () => Navigator.pushNamed(context, "/foodIngredientsPage"),
                      ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Divider(color: Colors.grey.shade300,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Cooking Idea",
                  style: AppTextStyle.containerTextStyle.copyWith(
                    fontSize: 20,
                  )),
              ),
              const SizedBox(height: 20,),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state){
                  if(state.status.isLoading){
                    return ShimmerWidget(width: width - 50);
                  }
                  if(state.status.isSuccess){
                    return CookingIdea(
                        width: width,
                        idMeal: state.random?.id ?? "",
                        networkImageName: state.random?.strMealThumb ?? "",
                        titleOfFood: state.random?.strMeal ?? "",
                        titleOfArea: state.random?.strArea ?? "",
                        titleOfCategory: state.random?.strCategory ?? "",
                        titleOfSuitiblity: state.random?.strTags ?? "");
                  }
                  return CookingIdea(
                      width: width,
                      idMeal: "1",
                      networkImageName: "https://www.themealdb.com/images/media/meals/sywswr1511383814.jpg",
                      titleOfFood: "",
                      titleOfArea: "",
                      titleOfCategory: "",
                      titleOfSuitiblity: "",
                  );
                },
              ),
              const SizedBox(height: 20,),
              Divider(
                color: Colors.grey.shade300,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "What a Cooking Now?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const SizedBox(height: 20,),
              const CookingIdeaPattern(),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
