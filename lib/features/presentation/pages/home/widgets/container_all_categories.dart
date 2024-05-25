import 'package:flutter/material.dart';

class ContainerAllCategories extends StatelessWidget {
  const ContainerAllCategories({super.key, required this.category, required this.thumbFood});

  final String thumbFood;
  final String category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          ),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.amber.shade200,
                      width: 2,
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        thumbFood,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                child: const SizedBox(
                  width: 100,
                  height: 100,
                ),
              ),
              const SizedBox(height: 10,),
              Text(category),
            ],
          ),
        ),
    )
      ),
    );
  }
}
