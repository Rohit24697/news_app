import 'package:flutter/material.dart';

class NewsCatagory extends StatelessWidget {
  final String label;
  final bool isSelected;
  const NewsCatagory({super.key, required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ChoiceChip(
        // color: WidgetStateProperty.all<Color>(Colors.white54),
        label: Text(label),
        selected: isSelected,
        selectedColor: Colors.deepPurpleAccent,
        labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
        onSelected: (bool selected) {},
      ),
    );
  }
}