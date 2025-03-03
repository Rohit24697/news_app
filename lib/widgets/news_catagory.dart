import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/category_controller.dart';

class NewsCategory extends StatelessWidget {
  final String label;
  final bool isSelected;

  NewsCategory({super.key, required this.label, this.isSelected=false});

  final CategoryController categoryController = Get.find(); // Get the controller

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isSelected = categoryController.selectedCategory.value == label;

      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: ChoiceChip(
          label: Text(label),
          selected: isSelected,
          selectedColor: Colors.deepPurpleAccent,
          checkmarkColor: Colors.white, // Checkmark color for selected chip
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
          onSelected: (bool selected) {
            categoryController.selectCategory(label); // Update the selected category
          },
        ),
      );
    });
  }
}
