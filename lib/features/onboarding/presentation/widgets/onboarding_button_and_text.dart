import 'package:doc_doc/core/api/api_keys.dart';
import 'package:doc_doc/core/cache/cache_helper.dart';
import 'package:doc_doc/core/di/server_locator.dart';
import 'package:doc_doc/core/helpers/extention.dart';
import 'package:doc_doc/core/routing/routes.dart';
import 'package:doc_doc/core/theming/app_text_style.dart';
import 'package:doc_doc/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingButtonAndText extends StatelessWidget {
  const OnboardingButtonAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
          style: TextStyles.font15grayW400,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30.h),
        AppButton(
          textButton: 'Get Started',
          onPressed: () async {
            await getIt<CacheHelper>().setData(
              key: ApiKeys.isOnboardingVisited,
              value: true,
            );
            // ignore: use_build_context_synchronously
            context.pushReplacementNamed(Routes.login);
          },
          isLoading: false,
        ),
      ],
    );
  }
}
