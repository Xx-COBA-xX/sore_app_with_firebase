// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';


import 'widgets/onboarding_screen_bod.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnBoardingScreenBody(),
    );
  }
}


