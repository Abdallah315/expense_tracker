import 'package:flutter/material.dart';
import 'package:inovola_task/core/theming/colors.dart';

enum CategoriesEnum {
  groceries,
  shopping,
  entertainment,
  gas,
  transport,
  newsPaper,
  rent,
  other,
}

extension CategoriesExtension on CategoriesEnum {
  String get name => switch (this) {
    CategoriesEnum.groceries => 'Groceries',
    CategoriesEnum.shopping => 'Shopping',
    CategoriesEnum.entertainment => 'Entertainment',
    CategoriesEnum.gas => 'Gas',
    CategoriesEnum.transport => 'Transport',
    CategoriesEnum.newsPaper => 'News Paper',
    CategoriesEnum.rent => 'Rent',
    CategoriesEnum.other => 'Other',
  };
}

final Map<CategoriesEnum, CircleAvatar> categoriesIcons = {
  CategoriesEnum.groceries: CircleAvatar(
    backgroundColor: ColorsManager.primary.withValues(alpha: 0.1),
    child: Icon(Icons.local_grocery_store, color: ColorsManager.primary),
  ),
  CategoriesEnum.shopping: CircleAvatar(
    backgroundColor: ColorsManager.red.withValues(alpha: 0.1),
    child: Icon(Icons.shopping_bag, color: ColorsManager.red),
  ),
  CategoriesEnum.entertainment: CircleAvatar(
    backgroundColor: ColorsManager.green.withValues(alpha: 0.1),
    child: Icon(Icons.movie, color: ColorsManager.green),
  ),
  CategoriesEnum.gas: CircleAvatar(
    backgroundColor: ColorsManager.orange.withValues(alpha: 0.1),
    child: Icon(Icons.local_gas_station, color: ColorsManager.orange),
  ),
  CategoriesEnum.transport: CircleAvatar(
    backgroundColor: ColorsManager.pink.withValues(alpha: 0.1),
    child: Icon(Icons.directions_bus, color: ColorsManager.pink),
  ),
  CategoriesEnum.newsPaper: CircleAvatar(
    backgroundColor: ColorsManager.red.withValues(alpha: 0.1),
    child: Icon(Icons.newspaper, color: ColorsManager.red),
  ),
  CategoriesEnum.rent: CircleAvatar(
    backgroundColor: ColorsManager.orange.withValues(alpha: 0.1),
    child: Icon(Icons.home, color: ColorsManager.orange),
  ),
  CategoriesEnum.other: CircleAvatar(
    backgroundColor: ColorsManager.brown.withValues(alpha: 0.1),
    child: Icon(Icons.more_horiz, color: ColorsManager.brown),
  ),
};
