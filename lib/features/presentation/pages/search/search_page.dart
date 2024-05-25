import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:food_recipes/constants/app_themes/app_colors.dart';
import 'package:food_recipes/features/presentation/components/loading_image/loading_image_indicator.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../bloc/search_meal/search_meal_bloc.dart';
import '../../components/search_app_bar/search_app_bar.dart';

part 'mixin/search_mixin.dart';



class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SearchMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchAppBar("SEARCH FOOD"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:20),
              child: Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ThemeData().colorScheme.copyWith(primary: AppColors.darkBlackColors),
                ),
                child: TextField(
                  controller: searchController,
                  autocorrect: false,
                  maxLines: 1,
                  cursorColor: AppColors.backgroundColors,
                  onChanged: (value) => context.read<SearchMealBloc>().add(
                    EventSearchMeal(value)
                  ),
                  decoration: InputDecoration(
                    label: const Text("Search"),
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Expanded(
              child: BlocBuilder<SearchMealBloc, SearchMealState>(
                builder: (context, state){
                  if(state.searchStatus.isLoading){
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: LinearProgressIndicator(
                        value: _progress,
                        backgroundColor: AppColors.darkBlackColors,
                        valueColor: const AlwaysStoppedAnimation<Color>(AppColors.shimmerColors),
                      ),
                    );
                  }

                  if(state.searchStatus.isError) {
                     return Center(
                       child: Text("'${searchController.text}' is Not Found"),
                     );
                  }
                  if(state.searchStatus.isSuccess){
                    return ListView.builder(
                        itemCount: state.searchMeal.length,
                        itemBuilder: (context, index){
                          return ListTile(
                            onTap: () => Navigator.pushNamed(
                              context,
                              "/detailFood",
                              arguments: state.searchMeal[index].id,
                            ),
                            style: ListTileStyle.drawer,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                            leading: SizedBox(
                              height: 80,
                              width: 80,
                              child: CachedNetworkImage(
                                imageUrl: state.searchMeal[index].mealThumb,
                                imageBuilder: (context, imageProvider) => SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        )
                                    ),
                                  ),
                                ),
                                progressIndicatorBuilder: (context, url, progress){
                                  return const LoadingImageIndicator();
                                },
                              ),
                            ),
                            title: Text(state.searchMeal[index].mealTitle),
                            titleAlignment: ListTileTitleAlignment.center,
                          );
                        });
                  }
                 return const Center();
                },
              ),
            ),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
