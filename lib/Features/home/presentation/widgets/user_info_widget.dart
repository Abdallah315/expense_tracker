import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inovola_task/Features/home/presentation/bloc/home_bloc.dart';
import 'package:inovola_task/Features/home/presentation/bloc/home_event.dart';
import 'package:inovola_task/Features/home/presentation/bloc/home_state.dart';
import 'package:inovola_task/Features/home/presentation/widgets/expense_filter_dropdown.dart';
import 'package:inovola_task/core/theming/colors.dart';
import 'package:inovola_task/core/theming/styles.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: ColorsManager.lighterBlue,
          child: const Icon(Icons.person, color: ColorsManager.white),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Good Morning\n',
                style: TextStyle(
                  color: ColorsManager.lightBlue2,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: 'Abdullah Yasser',
                style: TextStyles.font16MediumWhite,
              ),
            ],
          ),
        ),
        Spacer(),
        BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) =>
              previous.currentFilter != current.currentFilter,
          builder: (context, state) => ExpenseFilterDropdown(
            currentFilter: state.currentFilter,
            onFilterChanged: (filter) {
              context.read<HomeBloc>().add(FilterChangedEvent(filter));
            },
          ),
        ),
      ],
    );
  }
}
