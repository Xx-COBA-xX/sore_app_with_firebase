import 'package:flutter/material.dart';

import 'widgets/setteing_screen_body.dart';

class SetteingScreen extends StatelessWidget {
  const SetteingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SetteingScreenBody(),
    );
  }
}