import 'package:flutter/material.dart';
import 'package:food_recipes/constants/app_themes/app_colors.dart';
import 'package:food_recipes/constants/app_themes/app_style.dart';
import 'package:food_recipes/constants/app_themes/app_images.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5)).then((value) async {
      final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
      final introKey = sharedPrefs.getBool("introKey");
      if(introKey == true) {
        Navigator.pushReplacementNamed(context, "/home");
      } else {
        Navigator.pushReplacementNamed(context, "/intro");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backgroundColors,
      body: Center(
        child: SizedBox(
          width: width - 200,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  width: 4,
                  color: AppColors.backgroundColors,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AppImages.appLogo),
                  const Text(
                    "Food",
                    style: AppTextStyle.fontSplash,
                  ),
                  const Text(
                    "Recipes",
                    style: AppTextStyle.fontSplash,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
