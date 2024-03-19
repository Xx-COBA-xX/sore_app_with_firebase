import 'package:flutter/material.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/costom_app_bar.dart';
import 'package:sore_app_with_firebase/feaures/personalization/screens/profile/widgets/profile_screen_body.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.headlineMedium
        ),
      ),
      body: const ProfileScreenBody(),
    );
  }
}
