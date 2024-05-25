import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/features/presentation/pages/home/widgets/container_all_categories.dart';
import 'package:food_recipes/features/presentation/pages/home/widgets/shimmer_second_widget.dart';
import 'package:food_recipes/features/presentation/pages/home/widgets/shimmer_widget.dart';

import '../../../bloc/home/home_bloc.dart';

class CookingIdeaPattern extends StatelessWidget {
  const CookingIdeaPattern({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state){
        if(state.status.isLoading){
          return GridView.builder(
              itemCount: 9,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.6 / 2),
              itemBuilder: (context, index){
                return const ShimmerSecondWidget();
              });
        }
        if(state.status.isSuccess){
          return GridView.builder(
              itemCount: state.foodCategories.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.6 / 2),
              itemBuilder: (context, index){
                return Material(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(
                       context,
                       "/detailFoodCategory",
                       arguments: state.foodCategories[index].strCategory,
                    ),
                    splashColor: Colors.amber.shade200,
                    highlightColor: Colors.amber.shade200,
                    borderRadius: BorderRadius.circular(20),
                    child: ContainerAllCategories(
                      thumbFood: state.foodCategories[index].strCategoryThumb,
                      category: state.foodCategories[index].strCategory,
                    ),
                  ),
                );
              });
        }
        return GridView.builder(
            itemCount: 9,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.6 / 2),
            itemBuilder: (context, index){
              return const ShimmerSecondWidget();
            });
      },
    );
  }
}
