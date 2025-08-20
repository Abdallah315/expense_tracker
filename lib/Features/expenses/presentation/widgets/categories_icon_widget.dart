import 'package:flutter/material.dart';
import 'package:inovola_task/core/helpers/icon_helper.dart';
import 'package:inovola_task/core/theming/colors.dart';

class CategoriesIconWidget extends StatefulWidget {
  const CategoriesIconWidget({super.key, required this.onIconSelected});
  final Function(CategoryIconData) onIconSelected;

  @override
  State<CategoriesIconWidget> createState() => _CategoriesIconWidgetState();
}

class _CategoriesIconWidgetState extends State<CategoriesIconWidget> {
  CategoryIconData? selectedIcon;

  @override
  Widget build(BuildContext context) {
    final allIcons = CategoryIconHelper.getAllIcons();

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1.2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final iconData = allIcons[index];
        final isSelected = selectedIcon == iconData;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIcon = iconData;
            });
            widget.onIconSelected(iconData);
          },
          child: Container(
            decoration: BoxDecoration(
              border: isSelected
                  ? Border.all(color: ColorsManager.primary, width: 2)
                  : Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(child: iconData.toWidget()),
          ),
        );
      },
      itemCount: allIcons.length,
    );
  }
}
