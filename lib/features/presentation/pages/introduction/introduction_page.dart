import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/constants/app_themes/app_colors.dart';
import 'package:food_recipes/constants/app_themes/app_images.dart';
import 'package:food_recipes/constants/app_themes/app_style.dart';
import 'package:food_recipes/features/presentation/bloc/introduction/introduction_bloc.dart';
import 'package:lottie/lottie.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      backgroundColor: Colors.amber.shade300,
      body: Padding(
        padding: EdgeInsets.only(top: statusBarHeight + 50, left: 20, right: 20, bottom: 20),
        child: Column(
          children: [
            const Text("FOOD RECIPES",
            style: AppTextStyle.introTextStyle,
            ),
            const SizedBox(height: 30,),
            SizedBox(
              width: width - 150,
              child: Lottie.asset(
                AppImages.lottieFood,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20,),
            const Text("Learn To Cook Your Favorite Dishes At Home",
            textAlign: TextAlign.center,
            style: AppTextStyle.introSecondTextStyle,
            ),
            const SizedBox(height: 10,),
            const Text("Make your favorite dishes, specialities from different countries and ingredients you have on hand",
            textAlign: TextAlign.center,
            style: AppTextStyle.introThirdTextStyle,
            ),
            const SizedBox(height: 50,),
            BlocListener<IntroductionBloc, IntroState>(
              listener: (context, state){
                if(state is IntroSuccess) {
                  Navigator.pushReplacementNamed(context, "/home");
                }
              },
              child: ElevatedButton(
                onPressed: (){
                  context.read<IntroductionBloc>().add(EventIntro());
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(width, 60),
                  backgroundColor: AppColors.darkBlackColors,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text(
                  "Get Started",
                  style: AppTextStyle.introFourthTextStyle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
