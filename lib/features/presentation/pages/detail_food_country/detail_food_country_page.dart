import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../constants/app_themes/app_colors.dart';
import '../../bloc/detail_meal_country/detail_meal_country_bloc.dart';
import '../../components/build_app_bar_pattern/build_app_bar_pattern.dart';
import 'widgets/error_container_pattern.dart';

class DetailFoodCountryPage extends StatefulWidget {
  final String theNameOfCountry;
  const DetailFoodCountryPage({super.key, required this.theNameOfCountry});

  @override
  State<DetailFoodCountryPage> createState() => _DetailFoodCountryPageState();
}

class _DetailFoodCountryPageState extends State<DetailFoodCountryPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<DetailMealCountryBloc>().add(
          EventDetailMealCountry(widget.theNameOfCountry),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarPattern("${widget.theNameOfCountry} Food"),
      body: BlocBuilder<DetailMealCountryBloc, DetailMealCountryState>(
       builder: (context, state){
         if(state.status.isLoading){
           return Center(
             child: LoadingAnimationWidget.inkDrop(
                 color: AppColors.black38,
                 size: 50,
             ),
           );
         }
         if(state.status.isSuccess){
           return ListView.builder(
               itemCount: state.getCountryFilterMeal.length,
               itemBuilder: (context, index){
                 return ListTile(
                   onTap: () => Navigator.pushNamed(
                     context,
                     "/detailFood",
                     arguments: state.getCountryFilterMeal[index].id,
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
                         imageUrl: state.getCountryFilterMeal[index].mealThumb,
                         imageBuilder: (context, imageProvider) => SizedBox(
                           width: 80,
                           height: 80,
                           child: DecoratedBox(
                             decoration: BoxDecoration(
                               image: DecorationImage(
                                 image: imageProvider,
                                 fit: BoxFit.cover,
                               ),
                             ),
                           ),
                         ),
                       progressIndicatorBuilder: (context, url, progress) {
                           return Center(
                             child: LoadingAnimationWidget.threeArchedCircle(
                                 color: AppColors.shimmerColors,
                                 size: 25),
                           );
                       },
                     ),
                   ),
                   title: Text(state.getCountryFilterMeal[index].mealTitle),
                   titleAlignment: ListTileTitleAlignment.center,
                 );
               }
               );
         }
         return errorContainerPattern(context);
       },
      ),
    );
  }

  }

