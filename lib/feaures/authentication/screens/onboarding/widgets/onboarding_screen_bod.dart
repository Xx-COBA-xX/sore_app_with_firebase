import 'package:flutter/material.dart';

import '../../../models/onboarding_models/onboarding_models.dart';
import 'onboarding_dot_indicator.dart';
import 'onboarding_next_button.dart';
import 'onboarding_page_view.dart';
import 'onboarding_skip_button.dart';

class OnBoardingScreenBody extends StatelessWidget {
  const OnBoardingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // page view
        OnBoardingPageView(
          onBoardingModels: OnBoardingData.onBoardingInof,
        ),

        // skip button
        const OnBoardingSkipButton(),
        // next button

        const OnboardingNextButton(),

        // page dot indicator

        const PageDotIndicator(),
      ],
    );
  }
}
