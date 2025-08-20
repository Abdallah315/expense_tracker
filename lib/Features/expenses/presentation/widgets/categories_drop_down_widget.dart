import 'package:flutter/material.dart';
import 'package:inovola_task/core/helpers/enums.dart';
import 'package:inovola_task/core/theming/colors.dart';
import 'package:inovola_task/core/theming/styles.dart';

class CategoriesDropDownWidget extends StatelessWidget {
  const CategoriesDropDownWidget({super.key, required this.onCategorySelected});
  final Function(String) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: CategoriesEnum.shopping.name,
      items: [
        ...CategoriesEnum.values.map(
          (category) => DropdownMenuItem(
            value: category.name,
            child: Text(category.name, style: TextStyles.font14RegularGray),
          ),
        ),
      ],
      onChanged: (value) {
        onCategorySelected(value!);
      },
      decoration: InputDecoration(
        fillColor: ColorsManager.textFieldBackground,
        filled: true,
        border: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
      ),
      dropdownColor: ColorsManager.textFieldBackground,
    );
  }
}
