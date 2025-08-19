import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inovola_task/Features/home/presentation/bloc/home_bloc.dart';
import 'package:inovola_task/Features/home/presentation/bloc/home_state.dart';
import 'package:inovola_task/core/theming/colors.dart';
import 'package:inovola_task/core/theming/styles.dart';
import 'package:inovola_task/core/widgets/error_widget.dart';
import 'package:inovola_task/core/widgets/loader.dart';

class CurrencyDropdown extends StatefulWidget {
  const CurrencyDropdown({super.key, required this.onCurrencySelected});
  final Function(Map<String, int>) onCurrencySelected;
  @override
  State<CurrencyDropdown> createState() => _CurrencyDropdownState();
}

class _CurrencyDropdownState extends State<CurrencyDropdown> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.currenciesStatus == CurrenciesStatus.loading) {
          return Loader();
        }

        if (state.currenciesStatus == CurrenciesStatus.error) {
          return CustomErrorWidget(error: state.currenciesError ?? '');
        }

        if (state.currenciesStatus == CurrenciesStatus.loaded &&
            state.currencies != null) {
          final currencies = state.currencies!.rates.keys.toList();

          return DropdownButtonFormField<String>(
            hint: Text('Select Currency', style: TextStyles.font14RegularGray),
            items: currencies
                .map(
                  (currency) => DropdownMenuItem(
                    value: currency,
                    child: Text(currency, style: TextStyles.font14RegularBlack),
                  ),
                )
                .toList(),
            onChanged: (val) {
              final exchangeRate = state.currencies!.rates[val];
              widget.onCurrencySelected({val!: exchangeRate!.toInt()});
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
        return const SizedBox.shrink();
      },
    );
  }
}
