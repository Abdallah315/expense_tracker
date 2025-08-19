import 'package:flutter/material.dart';
import 'package:inovola_task/core/helpers/enums.dart';
import 'package:inovola_task/core/theming/colors.dart';
import 'package:inovola_task/core/theming/styles.dart';
import 'package:inovola_task/core/widgets/app_text_form_field.dart';
import 'package:inovola_task/core/widgets/app_date_picker.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Expense'), centerTitle: true),
      backgroundColor: ColorsManager.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Categories', style: TextStyles.font16MediumBlack),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: CategoriesEnum.shopping.name,
              items: [
                ...CategoriesEnum.values.map(
                  (category) => DropdownMenuItem(
                    value: category.name,
                    child: Text(
                      category.name,
                      style: TextStyles.font14RegularGray,
                    ),
                  ),
                ),
              ],
              onChanged: (_) {},
              decoration: InputDecoration(
                fillColor: ColorsManager.textFieldBackground,
                filled: true,
                border: OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
              ),
              dropdownColor: ColorsManager.textFieldBackground,
            ),
            const SizedBox(height: 16),
            Text('Amount', style: TextStyles.font16MediumBlack),
            const SizedBox(height: 8),
            AppTextFormField(
              hintText: '0',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Amount is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Text('Date', style: TextStyles.font16MediumBlack),
            const SizedBox(height: 8),
            AppDatePicker(
              hintText: '02/01/24',
              onDateSelected: (DateTime? date) {},
            ),
            const SizedBox(height: 16),
            Text('Attach Receipt', style: TextStyles.font16MediumBlack),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt),
              label: const Text('Upload image'),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
              ),
            ),
            const SizedBox(height: 24),
            Text('Categories', style: TextStyles.font16MediumBlack),
            const SizedBox(height: 12),
            Wrap(
              spacing: 16,
              runSpacing: 12,
              children: const [
                _CategoryChip(
                  label: 'Groceries',
                  icon: Icons.local_grocery_store,
                ),
                _CategoryChip(
                  label: 'Entertainment',
                  icon: Icons.videogame_asset,
                ),
                _CategoryChip(label: 'Gas', icon: Icons.local_gas_station),
                _CategoryChip(label: 'Shopping', icon: Icons.shopping_bag),
                _CategoryChip(label: 'News Paper', icon: Icons.article),
                _CategoryChip(label: 'Transport', icon: Icons.directions_bus),
                _CategoryChip(label: 'Rent', icon: Icons.home),
                _CategoryChip(label: 'Add Category', icon: Icons.add),
              ],
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final IconData icon;
  const _CategoryChip({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(icon, size: 18, color: ColorsManager.primary),
      label: Text(label),
      backgroundColor: ColorsManager.lightBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
