// import 'package:flutter/material.dart';

// import 'package:meals/data/dummy_data.dart';
// import 'package:meals/models/meal.dart';
// import 'package:meals/widgets/category_grid_item.dart';
// import 'package:meals/screens/meals.dart';
// import 'package:meals/models/category.dart';

// class CategoriesScreen extends StatefulWidget {
//   const CategoriesScreen({
//     super.key,
//     required this.availableMeals,
//   });

//   final List<Meal> availableMeals;

//   @override
//   State<CategoriesScreen> createState() => _CategoriesScreenState();
// }

// class _CategoriesScreenState extends State<CategoriesScreen>
//     with SingleTickerProviderStateMixin {
//   // with 키워드는
//   late AnimationController _animController;

//   @override
//   void initState() {
//     super.initState();

//     _animController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 300),
//       lowerBound: 0,
//       upperBound: 1,
//     );

//     _animController.forward();
//   }

//   @override
//   void dispose() {
//     _animController
//         .dispose(); // to make sure that the animation controller is disposed
//     super.dispose();
//   }

//   void _selectCategory(BuildContext context, Category category) {
//     final filteredMeals = widget.availableMeals
//         .where((meal) => meal.categories.contains(category.id))
//         .toList();

//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (ctx) => MealsScreen(
//           title: category.title,
//           meals: filteredMeals,
//         ),
//       ),
//     ); // Navigator.push(context, route)
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//         animation: _animController,
//         child: GridView(
//           padding: const EdgeInsets.all(24),
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             childAspectRatio: 3 / 2,
//             crossAxisSpacing: 20,
//             mainAxisSpacing: 20,
//           ),
//           children: [
//             // availableCategories.map((category) => CategoryGridItem(category: category)).toList()
//             for (final category in availableCategories)
//               CategoryGridItem(
//                 category: category,
//                 onSelectCategory: () {
//                   _selectCategory(context, category);
//                 },
//               )
//           ],
//         ),
//         builder: (context, child) => SlideTransition(
//               position: Tween(
//                 begin: const Offset(0, 0.3),
//                 end: const Offset(0, 0),
//               ).animate(CurvedAnimation(
//                   parent: _animController, curve: Curves.easeOut)),
//               child: child,
//             ));
//   }
// }

import 'package:flutter/material.dart';

import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/models/category.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;

  @override
  void initState() {
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 240),
      lowerBound: 0,
      upperBound: 1,
    );
    super.initState();

    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    ); // Navigator.push(context, route)
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animController,
      child: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          // availableCategories.map((category) => CategoryGridItem(category: category)).toList()
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            )
        ],
      ),
      builder: (context, child) => SlideTransition(
        position: Tween(
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: _animController,
            curve: Curves.easeOut,
          ),
        ),
        child: child,
      ),
    );
  }
}
