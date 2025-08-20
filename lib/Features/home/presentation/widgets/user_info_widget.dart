import 'package:flutter/material.dart';
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
        // ToDO this will be the filter
      ],
    );
  }
}
