import 'package:flutter/material.dart';
import 'package:inovola_task/core/theming/colors.dart';
import 'package:inovola_task/core/helpers/enums.dart';

class CategoryIconData {
  final int iconCodePoint;
  final int colorValue;
  final CategoriesEnum category;

  const CategoryIconData({
    required this.iconCodePoint,
    required this.colorValue,
    required this.category,
  });

  Map<String, dynamic> toJson() => {
    'iconCodePoint': iconCodePoint,
    'colorValue': colorValue,
    'category': category.name,
  };

  factory CategoryIconData.fromJson(Map<String, dynamic> json) {
    return CategoryIconData(
      iconCodePoint: json['iconCodePoint'],
      colorValue: json['colorValue'],
      category: CategoriesEnum.values.firstWhere(
        (e) => e.name == json['category'],
        orElse: () => CategoriesEnum.other,
      ),
    );
  }

  Widget toWidget() {
    return CircleAvatar(
      backgroundColor: Color(colorValue).withAlpha(25),
      child: Icon(
        IconData(iconCodePoint, fontFamily: 'MaterialIcons'),
        color: Color(colorValue),
      ),
    );
  }

  @override
  String toString() =>
      'CategoryIconData(iconCodePoint: $iconCodePoint, colorValue: $colorValue, category: $category)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryIconData &&
          runtimeType == other.runtimeType &&
          iconCodePoint == other.iconCodePoint &&
          colorValue == other.colorValue &&
          category == other.category;

  @override
  int get hashCode =>
      iconCodePoint.hashCode ^ colorValue.hashCode ^ category.hashCode;
}

class CategoryIconHelper {
  static final Map<CategoriesEnum, CategoryIconData> _categoryIcons = {
    CategoriesEnum.groceries: CategoryIconData(
      iconCodePoint: Icons.local_grocery_store.codePoint,
      colorValue: ColorsManager.primary.value,
      category: CategoriesEnum.groceries,
    ),
    CategoriesEnum.shopping: CategoryIconData(
      iconCodePoint: Icons.shopping_bag.codePoint,
      colorValue: ColorsManager.red.value,
      category: CategoriesEnum.shopping,
    ),
    CategoriesEnum.entertainment: CategoryIconData(
      iconCodePoint: Icons.movie.codePoint,
      colorValue: ColorsManager.green.value,
      category: CategoriesEnum.entertainment,
    ),
    CategoriesEnum.gas: CategoryIconData(
      iconCodePoint: Icons.local_gas_station.codePoint,
      colorValue: ColorsManager.orange.value,
      category: CategoriesEnum.gas,
    ),
    CategoriesEnum.transport: CategoryIconData(
      iconCodePoint: Icons.directions_bus.codePoint,
      colorValue: ColorsManager.pink.value,
      category: CategoriesEnum.transport,
    ),
    CategoriesEnum.newsPaper: CategoryIconData(
      iconCodePoint: Icons.article.codePoint,
      colorValue: ColorsManager.brown.value,
      category: CategoriesEnum.newsPaper,
    ),
    CategoriesEnum.rent: CategoryIconData(
      iconCodePoint: Icons.home.codePoint,
      colorValue: ColorsManager.blue.value,
      category: CategoriesEnum.rent,
    ),
    CategoriesEnum.other: CategoryIconData(
      iconCodePoint: Icons.category.codePoint,
      colorValue: ColorsManager.gray.value,
      category: CategoriesEnum.other,
    ),
  };

  static CategoryIconData getIconForCategory(CategoriesEnum category) {
    return _categoryIcons[category] ?? _categoryIcons[CategoriesEnum.other]!;
  }

  static List<CategoryIconData> getAllIcons() {
    return _categoryIcons.values.toList();
  }

  static Widget getWidgetForCategory(CategoriesEnum category) {
    return getIconForCategory(category).toWidget();
  }
}
