import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inovola_task/core/di/dependency_injection.dart';
import 'package:inovola_task/core/helpers/enums.dart';
import 'package:inovola_task/core/theming/colors.dart';
import 'package:inovola_task/core/theming/styles.dart';
import 'package:inovola_task/core/widgets/app_text_form_field.dart';
import 'package:inovola_task/core/widgets/app_date_picker.dart';
import 'package:inovola_task/core/widgets/app_upload_options.dart';
import 'package:inovola_task/Features/home/presentation/bloc/home_bloc.dart';
import 'package:inovola_task/Features/home/presentation/bloc/home_event.dart';
import 'package:inovola_task/Features/home/presentation/bloc/home_state.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  late HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = getIt<HomeBloc>();
    // Load currencies when screen initializes
    _homeBloc.add(const LoadCurrenciesRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _homeBloc,
      child: Scaffold(
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
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
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
              Text('Currency', style: TextStyles.font16MediumBlack),
              CurrencyDropdown(),
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
              AppUploadOptions(
                onImageUpload: (File imageFile) {
                  // Handle image upload from gallery/camera
                  print('Image selected: ${imageFile.path}');
                },
                onFileUpload: (File file) {
                  // Handle file upload
                  print('File selected: ${file.path}');
                },
              ),
              const SizedBox(height: 24),
              Text('Category icon', style: TextStyles.font16MediumBlack),
              const SizedBox(height: 12),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.5,
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final icon = getCategoriesIcons()[index];
                  return GestureDetector(
                    onTap: () {
                      print(icon);
                    },
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Center(child: icon),
                    ),
                  );
                },
                itemCount: getCategoriesIcons().length,
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
      ),
    );
  }
}

class CurrencyDropdown extends StatefulWidget {
  const CurrencyDropdown({super.key});

  @override
  State<CurrencyDropdown> createState() => _CurrencyDropdownState();
}

class _CurrencyDropdownState extends State<CurrencyDropdown> {
  String? selectedCurrency;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        // Handle loading state
        if (state.currenciesStatus == CurrenciesStatus.loading) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            decoration: BoxDecoration(
              color: ColorsManager.textFieldBackground,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Text(
                  'Loading currencies...',
                  style: TextStyles.font14RegularGray,
                ),
                Spacer(),
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: ColorsManager.primary,
                  ),
                ),
              ],
            ),
          );
        }

        // Handle error state
        if (state.currenciesStatus == CurrenciesStatus.error) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            decoration: BoxDecoration(
              color: ColorsManager.textFieldBackground,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              state.currenciesError ?? 'Error loading currencies',
              style: TextStyles.font14RegularGray,
            ),
          );
        }

        // Handle loaded state
        if (state.currenciesStatus == CurrenciesStatus.loaded &&
            state.currencies != null) {
          final currencies = state.currencies!.rates.keys.toList();

          return DropdownButtonFormField<String>(
            initialValue: selectedCurrency,
            hint: Text('Select Currency', style: TextStyles.font14RegularGray),
            items: currencies
                .map(
                  (currency) => DropdownMenuItem(
                    value: currency,
                    child: Text(currency, style: TextStyles.font14RegularBlack),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedCurrency = value;
              });
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

        // Default/initial state
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          decoration: BoxDecoration(
            color: ColorsManager.textFieldBackground,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text('Select Currency', style: TextStyles.font14RegularGray),
        );
      },
    );
  }
}
