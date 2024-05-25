import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_recipes/core/router/app_routes.dart';

import 'get_it.dart';

void main() async {
  await init();
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Recipes',
      onGenerateRoute: AppRoutes().onRoute,
    );
  }
}

